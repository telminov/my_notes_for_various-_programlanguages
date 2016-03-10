const int micPin = A0;
const int gPin = 12;
const int yPin = 11;
const int rPin = 10;

void setup() {
    Serial.begin(9600); 
    pinMode(gPin, OUTPUT);
    pinMode(yPin, OUTPUT);
    pinMode(rPin, OUTPUT);
}

void loop() {  
    int mv = analogRead(micPin) * 5.0 / 1024.0 * 1000.0; // значения в милливольтах
    Serial.println(mv); // выводим в порт
    /* Пороги срабатывания светодиодов настраиваются
       вами экспериментальным методом: */
    if (mv < 2100) { // порог срабатывания зелёного светодиода, мВ
      digitalWrite(gPin, HIGH);
      digitalWrite(yPin, LOW);
      digitalWrite(rPin, LOW);
    }
    else if (mv < 2125) { // порог срабатывания жёлтого светодиода, мВ
      digitalWrite(gPin, HIGH);
      digitalWrite(yPin, HIGH);
      digitalWrite(rPin, LOW);
    }
    else if (mv < 2150) { // порог срабатывания красного светодиода, мВ
      digitalWrite(gPin, HIGH);
      digitalWrite(yPin, HIGH);
      digitalWrite(rPin, HIGH);    
    }
    delay(500);
}
