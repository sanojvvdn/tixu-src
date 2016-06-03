#!/bin/sh

if ( hciconfig  | grep UP > /dev/null 2>&1 )
then
        echo "Bluetooth is already running"
else
        bluetoothd &
        sleep 3
        hciconfig hci0 up piscan
        sleep 4

	j=`/usr/bin/dbus-launch | grep ADDRESS | cut -d= -f2,3,4`
	echo $j
	export DBUS_SESSION_BUS_ADDRESS=$j

	chmod 755 /usr/bin/obexd
	chmod 755 /bin/bt-device
	/usr/bin/obexd -n -a -f -o &
	sleep 4
	blinking.sh &
fi
