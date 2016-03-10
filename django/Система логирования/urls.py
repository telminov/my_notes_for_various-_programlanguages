
    url(r'^report/request_loging/$', 'report.request_logging'),
    url(r'^report/request_users/$', 'report.logging_users'),
    url(r'^report/request_loging/(\d+)/$', 'report.logging_for_username'),
    url(r'^report/request_loging/(\d+)/url/$', 'report.logging_for_url_and_user'),
    url(r'^report/request_loging/(\d+)/graf/$', 'report.logging_for_username_graf'),
