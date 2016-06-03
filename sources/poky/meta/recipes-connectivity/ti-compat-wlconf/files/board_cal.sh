#!/bin/sh

cd /usr/sbin/wlconf
chmod 755 *

./wlconf -o /mnt/wl18xx-conf.bin -I official_inis/WL8_System_parameters.ini
./wlconf -i /mnt/wl18xx-conf.bin -o /mnt/wl18xx-conf.bin -s wl18xx.phy.number_of_assembled_ant2_4=1
./wlconf -i /mnt/wl18xx-conf.bin -o /mnt/wl18xx-conf.bin -s wl18xx.phy.number_of_assembled_ant5=0
./wlconf -i /mnt/wl18xx-conf.bin -o /mnt/wl18xx-conf.bin -s wl18xx.phy.high_band_component_type=0x09
./wlconf -i /mnt/wl18xx-conf.bin -o /mnt/wl18xx-conf.bin -s wl18xx.ht.mode=0x01

cd /

cp /mnt/wl18xx-conf.bin /lib/firmware/ti-connectivity

