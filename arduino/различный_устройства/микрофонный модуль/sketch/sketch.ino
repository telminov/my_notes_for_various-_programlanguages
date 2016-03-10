const int analogInPin = A2; 
//int buttonpin = 3; // define D0 Sensor Interface
int sensorValue = 0;
int lamp_pin = 10;

void setup() { 
  Serial.begin(9600); 
  Serial.println("Microphone Test" ); 
  //pinMode (buttonpin, INPUT) ;// output interface D0 is defined sensor

  pinMode(lamp_pin, OUTPUT);
}

void loop() { 
  //  val = digitalRead(buttonpin);
  // digital interface will be assigned a value of pin 3 to read val

  sensorValue = analogRead(analogInPin);  
  int lamp_value = map(sensorValue, 0, 1023, 0, 170); 
  analogWrite(lamp_pin, lamp_value); 
  Serial.print("lamp_value= "); 
  Serial.print(lamp_value);         
  Serial.print("Microphone value= ");                       
  Serial.println(sensorValue);   
  delay(1000);                     
}
