int pin = A2;
int duration = 0;
int value = 0;

void setup()
{
  pinMode(pin, INPUT);
  Serial.begin(9600);
}
 
void loop()
{
  value = digitalRead(pin);
  if (value==1){
    duration += 1;
  }
  else{
    if (duration > 0){
      Serial.println(duration);
    }
    duration = 0;
  }
}

