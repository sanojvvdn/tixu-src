while :
do
if [ $(cat /var/log/messages | grep "(null)(0x0)" | grep $(date +"%H:%M:%S") | wc -l ) -ne 0 ];
then
	echo 0 > /sys/class/gpio/gpio15/value
fi
done
