import zmq
import random
import sys
import time

port = "5556"
context = zmq.Context()
socket = context.socket(zmq.PAIR)
socket.bind("tcp://*:%s" % port)
# bind = "tcp://{0}:{1}".format('localhost', port)
# socket.bind(bind)

while True:
    # socket.send_string("Server message to client3") # send
    msg = socket.recv()

    socket.send(msg)
    print(msg)
    # time.sleep(5)