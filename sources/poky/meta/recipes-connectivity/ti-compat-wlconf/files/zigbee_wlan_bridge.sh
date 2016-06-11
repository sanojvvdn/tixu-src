#!/bin/sh
### BEGIN INIT INFO
# Provides:          Startup Application for TIXU
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: Starts the applications for TIXU board functionality
wifi_stop.sh > /dev/null 2&>1
cd /home/root/zigbee/servers/
./zigbeeHAgw bbb > /dev/null 2&>1 &
sleep 15
/opt/tixu/bin/system_server &
sleep 3
/usr/local/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
function()
{
	sleep 1h
	fw_setnorflags boot_fail_count 0
}
function &
echo -n "system server starting"
