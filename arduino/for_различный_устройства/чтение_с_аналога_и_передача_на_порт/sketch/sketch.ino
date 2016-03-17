int analod_pin = A2;

void setup() {
    pinMode(analod_pin, INPUT);
    Serial.begin(9600);// opens serial port, sets data rate to 9600 bps
}

void loop() {
      
    int datchik = analogRead(analod_pin);
   Serial.println(datchik);
  
   delay(100);
}  
