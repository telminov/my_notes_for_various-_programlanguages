# #!/usr/bin/env python
#
# import asyncio
# import websockets
#
#
# async def hello(websocket):
#     name = input("What's your name? ")
#     await websocket.send(name)
#     print("> {}".format(name))
#
#     greeting = await websocket.recv()
#     print("< {}".format(greeting))
#
# websocket = websockets.connect('ws://localhost:8765')
# asyncio.get_event_loop().run_until_complete(hello(websocket))
# # asyncio.get_event_loop().run_forever()

#!/usr/bin/env python

import asyncio
import websockets

@asyncio.coroutine
def hello():
    websocket = yield from websockets.connect('ws://localhost:8765/')

    try:
        name = input("What's your name? ")
        yield from websocket.send(name)
        print("> {}".format(name))

        greeting = yield from websocket.recv()
        print("< {}".format(greeting))
    #
    finally:
        pass
        yield from websocket.close()

asyncio.get_event_loop().run_until_complete(hello())