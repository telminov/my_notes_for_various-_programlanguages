#define LED1 13
#define LED2 12
#define LED3 11
#define LED4 10


void setup()
{
  for (int i=10; i<=13; i++)
    pinMode(i, OUTPUT);
}

void loop ()
{
  for (int i=10; i<=13; i++)
  {
    digitalWrite(i, 1);
    delay(1000);
    digitalWrite(i, 0);
  }  

}

