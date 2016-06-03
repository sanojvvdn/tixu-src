#!/bin/sh
if ( ifconfig  | grep wlan0 > /dev/null 2>&1 )
then
        echo "Wi-Fi is already UP"
else
	ifconfig wlan0 10.4.30.34 netmask 255.255.255.0 up
	sleep 3
	while :
	do
	echo "press 1-secure mode 2-open mode"
	read num
	case $num in
	1)
	hostapd -B /etc/hostapd.conf -P /var/run/hostapd.pid
	break;;
	2)
	hostapd -B /etc/hostapd_open.conf -P /var/run/hostapd.pid
	break;;
	*)
	echo "invalid option"
	continue;;	
	esac
	done
	sleep 5 
	udhcpd /etc/udhcpd.conf
	sleep 4
fi

