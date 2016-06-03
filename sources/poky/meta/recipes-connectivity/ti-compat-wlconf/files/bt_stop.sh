#!/bin/sh

if ( hciconfig  | grep DOWN > /dev/null 2>&1 )
then
        echo "Bluetooth is already down"
else
        hciconfig hci0 down
fi
