# -*- coding: utf-8 -*-
import socket


#порт выбираем с от 1024-65535
sock = socket.socket()
sock.bind(('0.0.0.0', 9090))
sock.listen(1) #кол-во слушателей

conn, addr = sock.accept() #принимаем подключение

print 'connected:', addr

#получаем данные
while True:
    data = conn.recv(1024) #кол-во байт для чтения
    if not data:
        break
    conn.send(data.upper())

#Закрытие соединения
conn.close()


/////////////////////или
import SocketServer

port = 9090
def get_socket(port):
    socket_server = SocketServer(port)
    socket_server.accept() #подключается
    return socket_server

socket_server = get_socket(port)
socket_server.send_data('hello WOrlD')