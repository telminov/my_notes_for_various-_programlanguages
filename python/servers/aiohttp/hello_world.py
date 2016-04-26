import asyncio
from aiohttp import web

async def hello(request):
    return web.Response(body=b"Hello, world")

async def handler(request):
    return web.Response()

app = web.Application()
app.router.add_route('GET', '/', hello)
app.router.add_route('GET', '/path', handler)

web.run_app(app)

