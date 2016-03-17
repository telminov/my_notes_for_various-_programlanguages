#define LED_PIN             13  // Встроенный светодиод Arduino
#define LOUDNESS_SENSOR_PIN 9  // Датчик громкости подключён к А5
#define TRESHOLD            300 // Устанавливаем порог србатывания
 
void setup() {
  // Настроим ножку со светодиодом на выход
  pinMode(LED_PIN, OUTPUT);
  Serial.begin(9600); 
  pinMode(LOUDNESS_SENSOR_PIN, INPUT);


}
 
void loop() {
 
  // Считаем текущее значение громкости
  int loudness = analogRead(LOUDNESS_SENSOR_PIN);
 Serial.println(loudness);
  // Если громкость выше пороговой..
  if (loudness > TRESHOLD)
    // зажгём светодиод,
    digitalWrite(LED_PIN, HIGH);
  else
    // а если нет - погасим
    digitalWrite(LED_PIN, LOW);
}
