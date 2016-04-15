class Photoresistor
{
  public:
    Photoresistor(int SensorPin);
    ~Photoresistor(); 
    
    int PIN;
    int getCounShotsFromSensor(); 
    int countSignals = 0; // кол-во сигналов за отведенное время
    int lastCountSignals; // велосипед для передачи кол-ва сигналов
    
    int analogData; // данные с сенсора (ПЕРЕДАВАТЬ)
    int maxPhotoSensor = 800; // max данные после которого считается как выстрел
    
    int duration = 100; // сколько выстрелов в промеж времени
    int duractionCurrent = 0; // для подсчета текущей секунды
};

Photoresistor::Photoresistor(int SensorPin)
{
  PIN = SensorPin;
}
Photoresistor::~Photoresistor(){}

int Photoresistor::getCounShotsFromSensor()
{
  if (analogData >= maxPhotoSensor) 
  {
    countSignals += 1;
    duractionCurrent += 1;
  }
    
   if (duractionCurrent > 0) // продолжения 
   {
     duractionCurrent += 1;
     if (duractionCurrent >= duration)
     {
       duractionCurrent = 0;
       lastCountSignals = countSignals;
       countSignals = 0;
       
       return lastCountSignals;
     }
   }
  return 0;
}

/* 
IN HEAD
const int photoresPin = A0;
Photoresistor photoresistor(photoresPin);

in LOOP()
{
photoresistor.analogData = analogRead(photoresistor.PIN);
  int countShotsFromPhotoResistor = photoresistor.getCounShotsFromSensor();
  if (countShotsFromPhotoResistor > 0)
    Serial.println(countShotsFromPhotoResistor);
}
*/

