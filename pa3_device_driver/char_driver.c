// Jack Sangdahl
// CSCI3753 SP24
// PA3 Device Driver
#include <linux/fs.h>
#include <linux/module.h>

MODULE_AUTHOR("jasa7131");
MODULE_LICENSE("GPL");

#define BUFFER_SIZE 900
#define DEVICE_NAME "char_dev"
static int major, counter = 0;
static char *data;

int char_driver_open(struct inode *, struct file *);
int char_driver_close(struct inode *, struct file *);
ssize_t char_driver_read(struct file *, char *, size_t, loff_t *);
ssize_t char_driver_write(struct file *, const char *, size_t, loff_t *);
loff_t char_driver_seek(struct file *, loff_t, int);

struct file_operations char_fops = {.owner = THIS_MODULE,
                                    .open = char_driver_open,
                                    .release = char_driver_close,
                                    .read = char_driver_read,
                                    .write = char_driver_write,
                                    .llseek = char_driver_seek};

int char_driver_open(struct inode *pinode, struct file *pfile) {
  counter++;
  printk("Device opened %d times\n", counter);
  return 0;
}

int char_driver_close(struct inode *pinode, struct file *pfile) {
  printk("Device closed %d times\n", counter);
  return 0;
}

ssize_t char_driver_read(struct file *pfile, char __user *buffer, size_t length,
                         loff_t *offset) {
  ssize_t data_read = simple_read_from_buffer(buffer, length, offset,
                                              data + *offset, BUFFER_SIZE);
  if (data_read < 0) {
    printk("READ FAILED: Failed to read from user buffer.\n");
    return -EFAULT;
  }
  if (data_read) {
    printk("READ SUCCESS: Read %ld bytes from %s.\n", data_read, DEVICE_NAME);
    if (data_read >= BUFFER_SIZE)
      printk("Reached EOF\n");
  }
  return data_read;
}

ssize_t char_driver_write(struct file *pfile, const char __user *buffer,
                          size_t length, loff_t *offset) {
  ssize_t data_written = simple_write_to_buffer(data + *offset, BUFFER_SIZE,
                                                offset, buffer, length);
  printk("WRITE SUCCESS: Wrote %ld bytes to %s.\n", data_written, DEVICE_NAME);
  if (data_written > BUFFER_SIZE)
    printk("WRITE ERR: Buffer is filled.\n");
  return data_written;
}

loff_t char_driver_seek(struct file *pfile, loff_t offset, int whence) {
  switch (whence) {
  case SEEK_SET:
    pfile->f_pos = offset;
    break;
  case SEEK_CUR:
    pfile->f_pos += offset;
    break;
  case SEEK_END:
    pfile->f_pos = strlen(data) - offset;
    break;
  }
  return pfile->f_pos;
}

static int char_driver_init(void) {
  printk("Registering device %s\n", DEVICE_NAME);
  data = (char *)kmalloc(BUFFER_SIZE * sizeof(char), GFP_KERNEL);
  major = register_chrdev(511, DEVICE_NAME, &char_fops);
  if (major < 0) {
    printk(KERN_ALERT "REGISTRATION FAILED: %s could not be reigstered.\n",
           DEVICE_NAME);
    return -EFAULT;
  }
  printk("REGISTRATION SUCCESS: %s successfully registered.\n", DEVICE_NAME);
  return 0;
}

static void char_driver_exit(void) {
  kfree(data);
  unregister_chrdev(major, DEVICE_NAME);
  printk("UNREGISTER SUCCESS: %s successfully unregistered\n", DEVICE_NAME);
}

module_init(char_driver_init);
module_exit(char_driver_exit);
