class Moisture
{
public: //открытые переменные , иначе закрытые

	int frequency = 60000 * 5 * 60; // частота проверки   60 000 * 5 * 60 - 5 часов
	int delta_frequency = 60000 * 30; // приращение частоты

	int maxFrequency = 60000 * 5 * 60 * 2; // 10 часов
	int minFrequency = 60000 * 60; // 1 час

	int moistureValue; // знач влажности
	int moistThresh; // порог влажности

	void frequencyMoisture(int millis)
};

void Moisture::frequencyMoisture(int millis) // ЗАПЕХНИ МЕНЯ В КЛАСС moisture
{
  if (millis % frequency == 0) 
  {
    // проверка влажности
    moistureValue = analogRead(MoistureSnsPin);
    
    if (moistureValue > moistThresh)
    {
      if (frequency <= maxFrequency)
        frequency += delta_frequency; // частота стала реже
    }
    else
    {
     if (frequency >= minFrequency)
        frequency -= delta_frequency; // частота стала реже 
    } 
  }
}
