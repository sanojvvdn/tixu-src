#!/bin/sh

tixu_AP_en.sh          
brctl addbr wlan0-bg
brctl addif wlan0-bg eth0
brctl addif wlan0-bg wlan0
ifconfig eth0 0.0.0.0
ifconfig wlan0 0.0.0.0
ifconfig wlan0-bg up
udhcpc -i wlan0-bg


