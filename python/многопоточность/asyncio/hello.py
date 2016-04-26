import asyncio

async def hello(name, timeout):
    cnt = 0
    while True and cnt < 5:
        await asyncio.sleep(timeout)
        print("Hello, {}".format(name))
        cnt += 1

if __name__ == '__main__':

    tasks = [
        hello("friends", 2),
        hello("neighbours", 0.3),
    ]

    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.wait(tasks))
    loop.close()
