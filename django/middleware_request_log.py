# coding: utf-8
import datetime
from .models import Log

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[-1].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


class RequestLogging(object):
    def process_response(self, request, response):
        url = request.path

        excluded_path = ['/bower_components', '/static']
        for path in excluded_path:
            if url.startswith(path):
                return response

        request_data = {}

        request_data['time'] = datetime.datetime.now()
        request_data['method'] = request.method
        request_data['get_params'] = request.GET
        request_data['post_params'] = request.POST
        request_data['ajax'] = request.is_ajax()

        if hasattr(request, 'user'):
            request_data['user_id'] = request.user.id # TODO можно fk
            request_data['user_name'] = request.user.username
            request_data['user_ip'] = get_client_ip(request)

        request_data['status_code'] = response.status_code
        if response.status_code == 302:
            request_data['redirect_url'] = response.url

        Log.objects.create(request=request_data)
        return response
