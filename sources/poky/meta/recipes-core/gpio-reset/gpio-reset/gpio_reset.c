#include <stdio.h>            
#include <unistd.h>           
#include <fcntl.h>
#include <string.h>           
#include <stdlib.h>           

#define GPIO_RST    50        	/*GPIO2_IO18*/
#define RST_LED	    17		/*GPIO1_IO17*/

#define rst_cmd  "/sbin/init 6"

/****************************************************************************
 * @func : gpio_io_init
 *
 * Initializes the GPIOs. also inits
 * the specified GPIO pin with the direction
 * each GPIO should be initialized once before using.
*******************************************************************************/
void gpio_io_init(int pin, char *directory)
{
        char export_dir[50], gpio_dir[50], fname[50];
        int pin_no = pin;
        char dir[5];
        strcpy(dir, directory);
        sprintf(export_dir, "echo %d > /sys/class/gpio/export", pin_no);
        sprintf(fname, "/sys/class/gpio/gpio%d", pin_no);
        if (access(fname, F_OK) == -1) {
        	system(export_dir);
        }
        sprintf(gpio_dir, "echo %s > /sys/class/gpio/gpio%d/direction", dir, pin_no);
        system(gpio_dir);
}

/****************************************************************************
 * @func : gpio_io_read
 * This function reads the GPIO pin specified. the read can be of 2 types.
 * @arg1 : int pin; The GPIO pin number to be read
** **************************************************************************/
static char gpio_io_read(int pin_no)
{
        char val = '0';
        int gpio_fd = 0;
	char Dev_path[35];
	
        sprintf(Dev_path, "/sys/class/gpio/gpio%d/value", pin_no);

        gpio_fd = open(Dev_path, O_RDWR);
        read(gpio_fd, &val, 1);
        close(gpio_fd);
        return val;
}

void gpio_io_write(int pin_no, char *val)
{
        int gpio_fd = 0;

        char Dev_path[35];
        sprintf(Dev_path, "/sys/class/gpio/gpio%d/value", pin_no);
        gpio_fd  = open(Dev_path, O_RDWR);
        write(gpio_fd, val, 1);
        close(gpio_fd);
}

int main()
{
	char b_pressed = -1;

	gpio_io_init(GPIO_RST, "in");
	gpio_io_init(RST_LED, "out");

	while(1){
		b_pressed = gpio_io_read(GPIO_RST);
		if(b_pressed == '0'){
			gpio_io_write(RST_LED, "1");
			system(rst_cmd);
		}
	}
	return 0;
}
