#!/bin/sh

if !( ps  | grep zigbeeHAgw > /dev/null 2>&1 )
then
        echo "zigbee is already Down"
else
	killall zigbeeHAgw
	killall lighttpd
#	killall system_server
fi 
