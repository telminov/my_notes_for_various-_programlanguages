// sensor connected to:
#include "shots.h"
#include "photoresistor.h"


const int photoresPin = A0;
Photoresistor photoresistor(photoresPin);

const int laserpin = 11;
LaserShot laser(laserpin);

void setup()
{
  Serial.begin(9600);  
  pinMode(laser.PIN, OUTPUT);
}

void loop()
{  
  photoresistor.analogData = analogRead(photoresistor.PIN);
  int countShotsFromPhotoResistor = photoresistor.getCounShotsFromSensor();
  if (countShotsFromPhotoResistor > 0)
    Serial.println(countShotsFromPhotoResistor);
  
  if (Serial.available() > 0)
  {
    char portData = Serial.read();
    int countShotsByLaser = laser.getCountShotsFromPortData(portData); // по case сравню полученные данные с базой выстрелов
    laser.addQueue(countShotsByLaser); 
  }
  bool canLaserFire = laser.laserFireFromFire();
  digitalWrite(laser.PIN, canLaserFire);
  
}


//int getCountShots()
//{
//  if (Serial.available() > 0) // если что-то пришло с com порта
// {    
//    int count = 0;
//    cur_data_port = Serial.read();
//    Serial.print(last_data_port);
//    Serial.print(cur_data_port);
//    if (last_data_port != cur_data_port ) 
//    { 
//      char last_data_port = cur_data_port;
//      switch (cur_data_port) //читаем переменную (по 1 символу) с порта
//      { 
//        case 'w':
//        {
//          int count = 123;
//           break;
//        }
//      }
//    } 
//  return count;
//  }
//}
