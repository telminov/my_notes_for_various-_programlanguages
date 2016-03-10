import RPi.GPIO as GPIO

#GPIO.setwarnings(False) иногда нужно

GPIO.setmode(GPIO.BCM)
GPIO.setup(25, GPIO.OUT) #устанавливаем поведение контакта 25


GPIO.output(25, GPIO.HIGH)
GPIO.output(25, GPIO.LOW)

