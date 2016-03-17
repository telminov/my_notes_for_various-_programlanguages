//
// SHARP IR sensor test distance calculation (cm)
//
// http://robocraft.ru
//

int IRpin = 0;                                    // analog pin for reading the IR sensor

// linear coefficients to calculate the distance
#define SHARP_GP2Y0A710K0F_K 137.5
#define SHARP_GP2Y0A710K0F_B 1.125

float get_distance_from_volts(float volts)
{
  return SHARP_GP2Y0A710K0F_K/(volts - SHARP_GP2Y0A710K0F_B);
}

void setup() {
  
  Serial.begin(9600);                             // start the serial port
}

void loop() {
  
  // 5v/1024 = 0.0048828125
  
  float volts = analogRead(IRpin)*0.0048828125;   // value from sensor * (5/1024) - if running 3.3.volts then change 5 to 3.3
  float dist_cm = get_distance_from_volts(volts);
  Serial.println(dist_cm);                       // print the distance
  delay(100);                                     // arbitary wait time.
}
