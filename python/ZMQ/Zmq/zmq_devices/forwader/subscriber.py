import sys
import zmq

port = "5560" #5560
# Socket to talk to server
context = zmq.Context()
socket = context.socket(zmq.SUB)
print("Collecting updates from server...")

socket.connect ("tcp://localhost:%s" % port)
topicfilter = "9"

# socket.setsockopt(zmq.SUBSCRIBE, topicfilter) # TODO  не робит
for update_nbr in range(10):
    string = socket.recv()
    print(string)
    topic, messagedata = string.split()
    print(topic, messagedata)