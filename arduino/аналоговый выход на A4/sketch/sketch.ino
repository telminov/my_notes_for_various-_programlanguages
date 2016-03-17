const int red = A4;
const int green = A5;
const int blue = A6;

void setup(){

  pinMode(red, OUTPUT); 
  pinMode(green, OUTPUT); 
  pinMode(blue, OUTPUT); 
}

void loop(){
  
  for (int i=0; i<=255; i++){
    analogWrite(red, i);
    analogWrite(green, i);
    analogWrite(blue, i);
  }
      delay(1000);
  
    for (int i=255; i>=0; i--){
      analogWrite(red, i);
      analogWrite(green, i);
      analogWrite(blue, i);
    }
    delay(1000);
}


