int pin = A2;
unsigned long duration;
 
void setup()
{
  pinMode(pin, INPUT);
  Serial.begin(9600);
}
 
void loop()
{
  duration = pulseIn(pin, LOW);
  Serial.println(duration);
}

