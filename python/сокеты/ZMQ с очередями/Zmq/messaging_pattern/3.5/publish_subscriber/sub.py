import sys
import zmq

port = "5556"

context = zmq.Context()
socket = context.socket(zmq.SUB)

print("Collecting updates from weather server...")
socket.connect ("tcp://localhost:%s" % port)

topicfilter = "10001"
socket.setsockopt_string(zmq.SUBSCRIBE, '')

total_value = 0
for update_nbr in range(5):
    string = socket.recv()
    topic, messagedata = string.split()
    total_value += int(messagedata)
    print(topic, messagedata)

print("Average messagedata value for topic '%s' was %dF" % (topicfilter, total_value / update_nbr))
