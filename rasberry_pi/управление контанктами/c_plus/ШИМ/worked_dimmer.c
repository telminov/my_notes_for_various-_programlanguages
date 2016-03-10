
#include <bcm2835.h>
#define PIN RPI_V2_GPIO_P1_11
int main()
{    
if (!bcm2835_init()) return 1;       

bcm2835_gpio_fsel(PIN,BCM2835_GPIO_FSEL_OUTP);  

int d = 100, i, j, flag=0;

int a=10; 
while (a)
{
    for (j=100; j!=0; j--) 
    {
        int t_on=50*d; 
        int t_off=50*(100-d);  
        if (flag==0) d=d-1; 
        if (flag==1) d=d+1; 

        for (i=10; i!=0; i--) 
         {             
            bcm2835_gpio_write(PIN, LOW);              
            delayMicroseconds(t_on);              
            bcm2835_gpio_write(PIN, HIGH);              
            delayMicroseconds(t_off);         
         }

    if (d==0) flag=1; 
    if (d==100) flag=0; 
    }

a--;
}
return (!bcm2835_close ()); 
} 
