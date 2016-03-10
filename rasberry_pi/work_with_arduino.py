 # -*- coding: utf-8 -*-
import serial, sys

#python work_with_arduino.py /dev/ttyACM0
#теперь так запускаем

if (len(sys.argv) != 2):
	print "Usage: arduinko_port chetne to"
	sys.exit()
port = sys.argv[1]

# port = "/dev/ttyACM0"
serial_port = serial.Serial(port,9600)
serial_port.flushInput() #выбрасывает все данные из буфера 
		#входящего потока
while True:
	if (serial_port.inWaiting()>0):
		input = serial_port.read()
		print(input)