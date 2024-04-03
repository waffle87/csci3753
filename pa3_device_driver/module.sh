#!/bin/bash
if [ "$1" == "sample" ]; then
    MAJOR=511
    MODULE="pa3_char_driver"
    DEVICE="/dev/simple_character_device"
    if [ ! -f "$MODULE.ko" ]; then
        cp .char_driver_sample $MODULE.ko
    fi
elif [ "$1" == "test" ]; then
    MAJOR=241
    MODULE="char_driver"
    DEVICE="/dev/char_dev"
else
  echo "usage: ./module.sh [sample] [test]"
fi

if [ $(rg -q $MODULE /proc/modules) ]; then
    rmmod $MODULE
fi
if [ -f $DEVICE ]; then
    rm $DEVICE
fi
mknod -m 777 $DEVICE c $MAJOR 0
insmod "$MODULE.ko"
