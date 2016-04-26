import time

import random
import zmq

consumer_id = random.randrange(1,10005)
print("I am consumer #%s" % (consumer_id))
context = zmq.Context()
# recieve work
consumer_receiver = context.socket(zmq.PULL)
consumer_receiver.connect("tcp://127.0.0.1:5557")

while True:
    work = consumer_receiver.recv_json()
    print(work)