import zmq
import sys
import random

port = "5559"
context = zmq.Context()
print("Connecting to server...")
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:%s" % port)
client_id = random.randrange(1,10005)
#  Do 10 requests, waiting each time for a response
print('my_client_id = {}'.format(client_id))

for request in range(1,10):
    print("Sending request ", request,"...")
    socket.send_string("Hello from %s" % client_id) # send
    #  Get the reply.
    message = socket.recv()
    print("Received reply ", request, "[", message, "]")