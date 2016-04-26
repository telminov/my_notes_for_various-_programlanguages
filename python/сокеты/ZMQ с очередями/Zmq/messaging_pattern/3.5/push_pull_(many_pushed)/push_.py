import time
import random
import zmq


context = zmq.Context()
zmq_socket = context.socket(zmq.PUSH)
zmq_socket.connect("tcp://127.0.0.1:5557")
# Start your result manager and workers before you start your producers

consumer_id = random.randrange(1,10005)
print("I am consumer #%s" % (consumer_id))
for num in range(20000):
    work_message = { 'num' : num }
    zmq_socket.send_json({'id': consumer_id})
    time.sleep(1)