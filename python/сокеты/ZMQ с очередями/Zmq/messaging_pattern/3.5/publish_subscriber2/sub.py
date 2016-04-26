import sys
import zmq

port = "5556"

context = zmq.Context()
socket = context.socket(zmq.SUB)
socket.bind("tcp://*:%s" % port)

print("Collecting updates from weather server...")

topicfilter = "10001"
socket.setsockopt_string(zmq.SUBSCRIBE, '')

total_value = 0
while True:
    string = socket.recv()
    topic, messagedata = string.split()
    total_value += int(messagedata)
    print(topic, messagedata)

print("Average messagedata value for topic '%s' was %dF" % (topicfilter, total_value / update_nbr))
