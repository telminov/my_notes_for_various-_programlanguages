// sensor connected to:
const int analog2 = A2;
const int analog1 = 9;

void setup()
{
  Serial.begin(9600);                           // start the serial port
  pinMode(analog1, INPUT);
  pinMode(analog2, INPUT);
}

void loop()
{
  Serial.print(" 1: ");
  int analog_data1 = analogRead(analog1);       // get distance
  Serial.print(analog_data1);
  Serial.print(" 2: ");
  int analog_data2 = analogRead(analog2);       // get distance
  Serial.println(analog_data2);                      // print the distance
  
  delay(100);                                   // arbitary wait time.
}
