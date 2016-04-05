# -*- coding:utf-8 -*-
# режисер, производитель,      (для примера запускать после consumer)


import time
import zmq

def producer(port):
    context = zmq.Context()
    zmq_socket = context.socket(zmq.PUSH)
    zmq_socket.bind("tcp://127.0.0.1:%d" % port)
    # Start your result manager and workers before you start your producers
    for num in range(100):
        work_message = {'num': num}
        zmq_socket.send_json(work_message)

        # --------- #
        if num == 99:
            print('PRODUCER SUCCESS')

port = 5557
producer(port)

