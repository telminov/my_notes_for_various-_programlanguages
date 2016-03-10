
// DS1302_LCD (C)2010 Henning Karlsen
 // web: http://www.henningkarlsen.com/electronics
 //
 // A quick demo of how to use my DS1302-library to make a quick
 // clock using a DS1302 and a 20x2 LCD.
 / /
 // Соответствие пинов часов и экрана пинпм Ардуино.
 // DS1302: CE pin -> Arduino Digital 3
 // I/O pin -> Arduino Digital 1
 // SCLK pin -> Arduino Digital 0
 // LCD: DB7 -> Arduino Digital 13
 // DB6 -> Arduino Digital 12
 // DB5 -> Arduino Digital 11
 // DB4 -> Arduino Digital 10
 // E -> Arduino Digital 5
 // RS -> Arduino Digital 4

#include <LiquidCrystal.h>  // Подключение библиотеки экрана.
#include <DS1302.h> // Подключение библиотеки часов.

// Инициализация пинов часов
DS1302 rtc(A3, A1, A0);
 // Инициализация пинов экрана
LiquidCrystal lcd(4, 5, 10, 11, 12, 13);

void setup()
 {
 // Запуск часов
rtc.halt(false);
rtc.writeProtect(false);

// Запуск экрана с указанием количества символов и строк
lcd.begin(20, 2);

// Три нижние строчки в первый раз раскомментированы, в них указываем текущую дату и время. Второй раз - закомментруем.
// rtc.setDOW(MONDAY); // День недели, если пятница, то FRIDAY на русском не писать!
// rtc.setTime(2, 10, 0); // Часы, минуты, секунды 24-часовой формат.
// rtc.setDate(1, 2, 2016); // Дата. ЦИФРАМИ!!! Ноль перед одиночной цифрой можно не ставить!
 Serial.begin(7600);
 }

void loop()
 {
 // Display time centered on the upper line
lcd.setCursor(6, 0); // Устанавливаем курсор для печати времени в верхней строчке
lcd.print(rtc.getTimeStr()); // Печатаем время

  Serial.println(rtc.getDateStr());
  
  delay(1000);

// Display abbreviated Day-of-Week in the lower left corner
lcd.setCursor(0, 1); // Устанавливаем курсор слева внизу для печати дня недели
lcd.print(rtc.getDOWStr(FORMAT_LONG)); // Печатаем день недели полностью, благо экран позволяет.

// Display date in the lower right corner
lcd.setCursor(9, 1); // Устанавливаем курсор для печати даты
lcd.print(rtc.getDateStr()); // Печатаем дату

// Wait one second before repeating 
delay (1000); // Пауза 1 секунда и все по новой!
 }
