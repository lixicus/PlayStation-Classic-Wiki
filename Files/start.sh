#!/bin/sh

# THIS IS NOT FOR REGULAR USERS!!!
# You need to solder to the UART port and short the two pads under the PCB near the charger.
# Baud rate: 921600

red_led () {
  SLEEP=1
  LOOP=1
  if [ x"$1" != x ]; then LOOP=$1; fi
  if [ x"$2" != x ]; then SLEEP=$2; fi
  for i in `seq 1 $LOOP`; do
    echo 1 > /sys/class/leds/red/brightness
    sleep $SLEEP
    echo 0 > /sys/class/leds/red/brightness
    sleep $SLEEP
  done
}

if [ ! -f "/tmp/ran" ]; then
  touch /tmp/ran

  #mount -o remount,rw /
  dmesg -n 1
  ps -aux > /dev/ttyS0 2>&1
  systemctl stop getty.target
  systemctl stop console-getty.service
  systemctl stop serial-getty@ttyS0.service
  killall agetty
  /sbin/agetty -a root -8 -L ttyS0 921600 xterm

  red_led "6" "0.3"
fi

sleep 60
