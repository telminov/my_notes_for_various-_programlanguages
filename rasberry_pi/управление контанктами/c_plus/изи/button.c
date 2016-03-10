// Программа мигает светодиодом 1 раз в секунду
// и завершается при нажатии на кнопку.
// Светодиод подключён к порту Р1_03
// Кнопка подключена к портам Р1_05 и Р1_07
// Компиляция: gcc -o button button.c -lrt -lbcm2835
// Запуск: sudo ./button

#include <bcm2835.h> 

#define PIN RPI_GPIO_P1_03       // Определяем порт для подключения светодиода
#define PIN_OUT RPI_GPIO_P1_05   // Определяем порт для записи
#define PIN_IN RPI_GPIO_P1_07    // Определяем порт для чтения

int main()
{

    if (!bcm2835_init())         // Инициализация GPIO
        return 1;                // Завершение программы, если инициализация не удалась

    bcm2835_gpio_fsel(PIN, BCM2835_GPIO_FSEL_OUTP);          // Устанавливаем порт PIN на вывод
    bcm2835_gpio_fsel(PIN_OUT, BCM2835_GPIO_FSEL_OUTP);      // Устанавливаем порт PIN_OUT на вывод
    bcm2835_gpio_fsel(PIN_IN, BCM2835_GPIO_FSEL_INPT);       // Устанавливаем порт PIN_IN на ввод
    bcm2835_gpio_pud(PIN_IN, 1);                             // Включаем подтяжку порта PIN_IN к "0"

    bcm2835_gpio_write(PIN_OUT, HIGH);                       // Устанавливаем порт PIN_OUT в состояние "1"  

    while(!bcm2835_gpio_lev(PIN_IN))    // Повторяем все действия, заключённые в скобки {} пока не будет нажата кнопка
    {

        bcm2835_gpio_write(PIN, LOW);   // Устанавливаем порт в 0, светодиод горит
        bcm2835_delay(500);             // Ждём 500 милисекунд
        bcm2835_gpio_write(PIN, HIGH);  // Устанавливаем порт в 1, светодиод не горит
        bcm2835_delay(500);             // Ждём 500 милисекунд

    }

    bcm2835_gpio_pud(PIN_IN, 0);   // Отключаем подтяжку порта PIN_IN к "0"
    return (bcm2835_close ());     // Выход из программы
}
