obj-m += char_driver.o
KBUILD_DIR ?= /lib/modules/`uname -r`/build

all:
	make -C $(KBUILD_DIR) M=`pwd`

clean:
	make -C $(KBUILD_DIR) M=`pwd` clean
