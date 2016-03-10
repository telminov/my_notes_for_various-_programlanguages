# -*- coding: utf-8 -*-
from django.conf import settings


def global_context(request):
    """
    Adds additional context variables to the default context.
    """
    context = {
        'WITH_WS4REDIS': hasattr(settings, 'WEBSOCKET_URL'),
    }
#     if context['WITH_WS4REDIS']:
#         context.update({
#             'WEBSOCKET_URI': settings.WEBSOCKET_URI,
#             'WS4REDIS_HEARTBEAT': settings.WS4REDIS_HEARTBEAT,
#         })
    return context

#в настройках
TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'django.core.context_processors.tz',
    'django.core.context_processors.request',
    'django.contrib.messages.context_processors.messages',
    '*******.get_ws_url_context_processor.global_context',
)
