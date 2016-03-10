import RPi.GPIO as GPIO         #импорт библиотеки GPIO

GPIO.setmode(GPIO.BOARD)        #"включение GPIO"

GPIO.setup(7, GPIO.OUT)         #объявление порта 7 как выход

GPIO.setup(3, GPIO.IN)          #объявление порта 3 как вход

while True:                     #бесконечный цикл

    if GPIO.input(3) == False:  #если кнопка зажата

        GPIO.output(7, 1)       #включаем светодиод

    else:                       #иначе

        GPIO.output(7, 0)       #выключаем