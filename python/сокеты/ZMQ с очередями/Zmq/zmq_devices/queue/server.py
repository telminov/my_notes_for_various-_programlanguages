import zmq
import time
import sys
import random

port = "5560"
context = zmq.Context()
socket = context.socket(zmq.REP)
socket.connect("tcp://localhost:%s" % port)
server_id = random.randrange(1,10005)
print('my_server_id {}'.format(server_id))

while True:
    #  Wait for next request from client
    message = socket.recv()
    print("Received request: ", message)
    time.sleep(1)
    socket.send_string("World from server %s" % server_id) # send