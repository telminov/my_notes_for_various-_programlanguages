#define BACKLIGHT     3 
#define EN  2 
#define RW  1 
#define RS  0 
#define D4  4 
#define D5  5 
#define D6  6 
#define D7  7 
#define BACKLIGHT     7 
#define LCD_EN  4 
#define LCD_RW  5 
#define LCD_RS  6 
#define LCD_D4  0 
#define LCD_D5  1 
#define LCD_D6  2 
#define LCD_D7  3 

#include <LiquidCrystal_I2C.h>
//Создаем экземпляр класса LiquidCrystal_I2C       
lcd(LCD_I2C_ADDR,LCD_EN,LCD_RW,LCD_RS,LCD_D4,LCD_D5,LCD_D6,LCD_D7);
lcd.begin (20,4); //инициализирует дисплей с указанным количеством строк и символов в строке
lcd.setBacklightPin(BACKLIGHT,NEGATIVE); //инициализация пина подсветки
lcd.setBacklight(HIGH); //включение подсветки
lcd.clear(); //очистка экрана
lcd.setCursor ( 0, 1 ); //позиционирование курсора (столбец, строка)
lcd.print("Hello world!"); //вывод текста
