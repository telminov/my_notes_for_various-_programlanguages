// sensor connected to:
const int analog = A0;

void setup()
{
  Serial.begin(9600);                           // start the serial port
  pinMode(analog, INPUT);
}

void loop()
{
  int analog_data = analogRead(analog);       // get distance
  Serial.println(analog_data);                      // print the distance
  
  delay(100);                                   // arbitary wait time.
}
