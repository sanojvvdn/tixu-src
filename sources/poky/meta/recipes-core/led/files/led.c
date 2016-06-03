#include<stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <errno.h>
#include <stdint.h>
#include<string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>

#define GPIO_PIN_1  14          /*WIFI*/
#define GPIO_PIN_2  15          /*BT*/
#define GPIO_PIN_3  16          /*zigbee*/
#define GPIO_PIN_4  18

/****************************************************************************
 * @func : gpio_io_init
 *
 * Initializes the GPIOs. also inits
 * the specified GPIO pin with the direction
 * each GPIO should be initialized once before using.
 *******************************************************************************/
void gpio_io_init(int pin)
{ int fd;
	char buf[200]; 

	fd = open("/sys/class/gpio/export", O_WRONLY);
	sprintf(buf, "%d", pin); 
	write(fd, buf, strlen(buf));
	close(fd);


	sprintf(buf, "/sys/class/gpio/gpio%d/direction", pin);
	fd = open(buf, O_WRONLY);
	write(fd, "out", 3); 
	close(fd);

}



void gpio_io_write(int pin_no, char *val)
{ int fd;
	char buf[200]; 
	sprintf(buf, "/sys/class/gpio/gpio%d/value", pin_no);
	fd = open(buf, O_WRONLY);
	write(fd, val, 1);
	close(fd);
}



/**
 * Provides a command output in a string
 *
 * @param command string
 * @param User's pointer to collect output of the command
 * @param size number of bytes to copy from command's output
 * @return 0 on success else -1
 */
int get_cmd_output(char *cmd_str, char *out_data, int size)
{
	FILE *fp = NULL;

	if (out_data == NULL)
		return -1;

	fp = popen(cmd_str, "r");
	if (fp == NULL)
		return -1;

	if (fread(out_data, size, 1, fp) < 0) {
		pclose(fp);
		return -1;
	}
	pclose(fp);
	out_data[strlen(out_data) - 1] = '\0';

	return 0;
}


void gpio_config()
{

	gpio_io_init(GPIO_PIN_1);
	gpio_io_init(GPIO_PIN_2);
	gpio_io_init(GPIO_PIN_3);
	gpio_io_init(GPIO_PIN_4);
	gpio_io_write(GPIO_PIN_1, "0");
	gpio_io_write(GPIO_PIN_2, "0");
	gpio_io_write(GPIO_PIN_3, "0");
	gpio_io_write(GPIO_PIN_4, "0");
}

void main()
{

	char cmd_bt_st[4] = {0},cmd_wifi_client_st[4] = {0},cmd_wifi_ap_st[10] = {0},cmd_zigbee_st[10] = {0},cmd_obex[4] = {0},log[10] = {0};
	gpio_config();                      

	while(1){


		get_cmd_output("/bin/ps | grep hostapd | grep -vi grep",cmd_wifi_ap_st, 4);
		if(cmd_wifi_ap_st[0]!='\0')
			gpio_io_write(GPIO_PIN_1, "0");           

		get_cmd_output("/sbin/ifconfig wlan0 | grep UP",cmd_wifi_client_st, 4);
		if(cmd_wifi_client_st[0]!='\0')
			gpio_io_write(GPIO_PIN_1, "1");
		else
			gpio_io_write(GPIO_PIN_1, "0");


		get_cmd_output("/bin/ps | grep zigbeeHAgw | grep -vi grep",cmd_zigbee_st, 10);
		if(cmd_zigbee_st[0]!='\0')                 
			gpio_io_write(GPIO_PIN_3, "1");
		else
			gpio_io_write(GPIO_PIN_3, "0");	


		get_cmd_output("/usr/sbin/hciconfig hci0 | grep UP",cmd_bt_st, 4);
		if(cmd_bt_st[0] !='\0')
			gpio_io_write(GPIO_PIN_2, "1");
		else
			gpio_io_write(GPIO_PIN_2, "0");	


		 get_cmd_output("/bin/ps | grep obexftp | grep -vi grep",cmd_obex, 4);
                if(cmd_bt_st[0] !='\0' && cmd_obex[0]!='\0')
                        gpio_io_write(GPIO_PIN_2, "0");
	}
}




