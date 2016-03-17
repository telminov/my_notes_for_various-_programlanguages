#include <Servo.h>
#include <IRremote.h>

IRrecv irrecv(11);
decode_results results;
Servo servoMain;

int servPoz = 90; //Начальное положение сервы
int lastPoz = 0;

void setup()
{
  irrecv.enableIRIn();
  servoMain.attach(10); // Servo присоединен к 10 выводу
  servoMain.write(servPoz);
}

void loop() {
  if (irrecv.decode(&results)) 
  {
    int res = results.value;
    Serial.println(res, HEX);
    if(res==0xFFFF906F)// Если нажата кнопка "+"
    {
      lastPoz=res;
      servPoz++;  
      servoMain.write(servPoz);
    }
    else if(res==0xFFFFA857)// Если нажата кнопка "-" 
    {
      servPoz--;
      lastPoz=res;
      servoMain.write(servPoz);
    }
    else if(res==0xFFFFFFFF)// Если кнопку удерживают
    {
      if(lastPoz==0xFFFF906F) servPoz++;// Удерживают "+"
      if(lastPoz==0xFFFFA857) servPoz--;// Удерживают "-"   
      servoMain.write(servPoz);
    }

    irrecv.resume();
    delay(100);
  }
}





