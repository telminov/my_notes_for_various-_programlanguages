// Программа мигает светодиодом 1 раз в секунду.
// Светодиод подключён к порту Р1_03
// Компиляция: gcc -o blink blink.c -lrt -lbcm2835
// Запуск: sudo ./blink

#include <bcm2835.h>  
#define PIN RPI_GPIO_P1_03 
//#define PIN RPI_V2_GPIO_P1_03  //для плат RPi rev. V2
int main()
{

    if (!bcm2835_init())         // Инициализация GPIO
        return 1;                //Завершение программы, если инициализация не удалась

    bcm2835_gpio_fsel(PIN, BCM2835_GPIO_FSEL_OUTP);          //Устанавливаем порт Р1_03 на вывод

    while(1)   // Повторяем все действия, заключённые в скобки {} бесконечное число раз
    {

        bcm2835_gpio_write(PIN, LOW);   // Устанавливаем порт в 0, светодиод горит
        bcm2835_delay(500);             // Ждём 500 милисекунд
        bcm2835_gpio_write(PIN, HIGH);  // Устанавливаем порт в 1, светодиод не горит
        bcm2835_delay(500);             // Ждём 500 милисекунд

    }
    return 0;     // Выход из программы
}
