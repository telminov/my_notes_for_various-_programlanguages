const int analogInPin = A0; // аналоговый вход А0
const int digitalInPin = 2; // цифровой вход D2
int dValue;
void setup() {
  pinMode(digitalInPin, INPUT);
  Serial.begin(9600);
}
void loop() {
  int analog = analogRead(analogInPin);
  Serial.println(analogRead(analog));
  dValue = digitalRead(digitalInPin);
  if (dValue == HIGH)
    Serial.println(13);
  delay(1000);
}
