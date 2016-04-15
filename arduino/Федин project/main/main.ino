#include <frequency_valid.cpp>
// #include <SoftwareSerial.h>
//последовательный интерфейс BT 4,5 (RX to pin 4 and TX to pin 5.)
// SoftwareSerial BLE_Shield(4,5);

//Переменные

//То, что принимается со смартфона
int MoistThresh = 300; //порог влажности ПРИМИ МЕНЯ С СМАРТФОНА
int TempThresh = 0; // порог температуры
int PumpWorkTime = 0; // время работы насоса

Moisture moisture; // частота проверок
moisture.moistThresh = MoistThresh;

//Назначение аналоговых входов датчикам
const int MoistureSnsPin = A0;
const int TemperatureSnsPin = A1;
const int WaterLvlSnsPin = A2;

//Считываемые значения с датчиков
int MoistureValue = 0;
int TemperatureValue = 0;
int WaterLvlValue = 0;

//Сумма температур для расчёта средней температуры
int TemperatureSum = 0;

//Текущее время в миллисекундах
unsigned long currentMillis = millis();
//
void setup()
{
  //Первая проверка
  MoistureValue = analogRead(MoistureSnsPin);
  TemperatureValue = analogRead(TemperatureSnsPin);
  WaterLvlValue = analogRead(WaterLvlSnsPin);
  
  //Отправка данных на смартфон
  //...
  Serial.print("Moisture = " );                       
  Serial.print(MoistureValue);      
  Serial.print("\t Temperature = ");      
  Serial.print(TemperatureValue); 
  Serial.print("\t WaterLvl = ");  
  Serial.println(WaterLvlValue); 
  Serial.println();
  BLE_Shield.begin(9600);   // Setup the serial port at 9600 bps. This is the BLE Shield default baud rate.
  
  moisture.moistureValue = analogRead(MoistureSnsPin); // первый раз считываем.. для 
}

void writingSensorsToDict()
{
  if (millis() % 60000 * 60) // каждый час
  {
    // будет считывание с тачиков (или браться уже существующие данные)
    // запись этих данных
  }
}
void loop()
{
  /* Доступны ли новые данные
  if (BLE_Shield.available()) {
    MoistThresh.write(BLE_Shield.read());
  }
  */
  moisture.frequencyMoisture(millis()); // работа с влажностью
  
  writingSensorsToDict(); // запись данные с сенсоров куда то 
  
}

