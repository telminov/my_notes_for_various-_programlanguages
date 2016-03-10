
const int LED = 13; //лампочка
const int BUTTON = 2;

boolean lastButton = LOW; //прошлое состояние кнопки
boolean currentButton = HIGH; //
boolean ledON = false; //текущее состояние светодиода   вкл/выкл светодиода

void setup() {
  pinMode(LED, OUTPUT); //как выход
  pinMode(BUTTON, INPUT); //как вход
}

//функция сглаживания дребезга
boolean debounce(boolean last)
{
  /*принимает прошлое значение нажатия кнопки
  если состояние кнопки изменилось - то ждет еще 5мс, для проверки
  на состояние кнопки, вдруг это было ошибкой
  */
  boolean current = digitalRead(BUTTON);
  if (last != current)
  {
    delay(5);
    current = digitalRead(BUTTON);
    return current;
  }
  //мне вот стало интересно, а что будет, если не вернет?)
}

void loop() {
  currentButton = debounce(lastButton); //если сюда не вернется релузьтат функции???
  
  if (lastButton == LOW && currentButton == HIGH)
  {
  	ledON = !ledON; 
    //digitalWrite(LED, ledON); //возможно если будет тут, то гореть будет не часто т.е. 
    //загорится и в след лупе не будет гореть (т.к. иф не пройдет)
  }
  
  lastButton = currentButton;
  digitalWrite(LED, ledON); // хотел  переместим кусок в if, но (продолжение в самом ифе)
}


//ДОПОЛНЕНИЕ
//чтоб напряжение не колебалось (пока кнопка не нажата) чтение значения может дать неожид результат
// нужен стягивающий резистор
