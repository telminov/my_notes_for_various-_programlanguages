import zmq
import random
import sys
import time

port = "5556"
context = zmq.Context()
socket = context.socket(zmq.PAIR)
socket.connect("tcp://localhost:%s" % port)

my_rand = random.randint(1, 10000)
print(my_rand)
while True:

    # socket.send_string("client message to server1") # send
    socket.send_json(my_rand)
    time.sleep(7)
    msg = socket.recv()
    print(msg)
