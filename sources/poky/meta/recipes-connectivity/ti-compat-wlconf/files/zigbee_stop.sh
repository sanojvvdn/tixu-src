#!/bin/sh

if !( ps  | grep zigbeeHAgw > /dev/null 2>&1 )
then
        echo "zigbee is already Down"
else
	killall zigbeeHAgw > /dev/null 2>&1
	killall lighttpdi > /dev/null 2>&1
#	killall system_server
fi 
