import time
import zmq
import pprint


def result_collector():
    context = zmq.Context()
    results_receiver = context.socket(zmq.PULL)
    results_receiver.bind("tcp://127.0.0.1:5558")
    collecter_data = {}

    for x in range(1000):
        result = results_receiver.recv_json()
        print(result)
        if collecter_data.get(result['consumer']): # has_key instead get
            collecter_data[result['consumer']] = collecter_data[result['consumer']] + 1
        else:
            collecter_data[result['consumer']] = 1

        if x == 30:
            pprint.pprint(collecter_data)

result_collector()