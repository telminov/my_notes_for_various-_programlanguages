# -*- coding:utf-8 -*-
import cherrypy                 # Импортирование кода модуля сервера CherryPy в код проекта
# Импортирование кода модулей плагинов CherryPy в код проекта
from ws4py.server.cherrypyserver  import WebSocketPlugin, WebSocketTool
from ws4py.websocket import WebSocket   # Импортирование кода модулей 
                                        # плагина ws4py.
from ws4py.messaging import TextMessage

class ChatWebSocketHandler(WebSocket):
        def received_message(self, m):
                msg=m.data.decode("utf-8")
                print msg
                cherrypy.engine.publish('websocket-broadcast', 
                  "Широковещательное сообщение: принято")

        def closed(self, code, reason=u"Клиент покинул интерфейс без корректного описания причины."):
                cherrypy.engine.publish('websocket-broadcast', 
                  TextMessage(reason))

class Root(object):
    @cherrypy.expose
    def index(self):
        return "index"

    @cherrypy.expose
    def ws(self):
        print "Обработчик создан: %s" % repr(cherrypy.request.ws_handler)


if __name__ == '__main__':
    WebSocketPlugin(cherrypy.engine).subscribe()   # инициализация плагина
                                                   # для поддержки протокола WebSocket
    cherrypy.tools.websocket = WebSocketTool()          #
    cherrypy.config.update({'server.socket_host': '0.0.0.0',
        'server.socket_port': 9003,
        'tools.staticdir.root': '/home/pi'})
    cherrypy.quickstart(Root(), '', config={
             '/ws': {
                     'tools.websocket.on': True,
                     'tools.websocket.handler_cls': ChatWebSocketHandler
               }
        });

