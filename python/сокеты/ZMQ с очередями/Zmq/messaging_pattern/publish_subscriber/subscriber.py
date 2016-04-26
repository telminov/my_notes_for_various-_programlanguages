import sys
import zmq

port = "5556"
if len(sys.argv) > 1:
    port = sys.argv[1]
    int(port)

# Socket to talk to server
context = zmq.Context()
socket = context.socket(zmq.SUB)

print("Collecting updates from weather server...")
socket.connect("tcp://localhost:%s" % port)

total_value = 0
for update_nbr in range(5):
    string = socket.recv_string()
    topic, messagedata = string.split()
    total_value += int(messagedata)
    print(topic, messagedata)
