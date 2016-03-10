# coding: utf-8
from django.core.urlresolvers import reverse

import lib.menu


class MenuItem(lib.menu.MenuItem):

    TEMPLATE_LIST = 'mobil/menu_list.html'
    TEMPLATE_MENU = 'mobil/menu.html'
    TEMPLATE_BREADCRUMBS = ''


nav_list = MenuItem('mobil', 'Общее', icon='icon-gear', color='green', children=(
    MenuItem('reports', u'Отчеты', icon='icon-table', children=(
        MenuItem('request_loging', u'Журнал запросов', icon=' icon-book', children=(
            MenuItem('request_loging', u'По времени', icon='icon-time', target=reverse('mobil.views.report.request_logging'), perm='mobil.request_logging'),
            MenuItem('request_loging', u'По пользователям', icon='icon-user', target=reverse('mobil.views.report.request_logging'), perm='mobil.request_logging'),
        )),
        MenuItem('time_logger', u'Журнал времени', children=(
            MenuItem('time_views_log', u'Интерфейсы', target=reverse('mobil.views.time_log_reports.views_log'), perm='mobil.time_logger', icon='icon-time'),
            MenuItem('bin_log', u'Бинарный лог', target=reverse('mobil.views.time_log_reports.bin_log'), perm='mobil.time_logger', icon='icon-time'),
            MenuItem('slow_queries_log', u'Медленные запросы', target=reverse('mobil.views.time_log_reports.slow_queries_log'), perm='mobil.time_logger', icon='icon-time'),
        )),
        MenuItem('work_time', u'Время пользователей', target=reverse('mobil.views.report.stat_work_time_by_month'), perm='mobil.report_stat_work_time', icon='icon-time'),
    )),
    MenuItem('services', u'Услуги', icon='icon-book', children=(
        MenuItem('base_services', u'Базовые услуги', target=reverse('mobil.views.service.search'), perm='mobil.service_search', icon='icon-search'),
        MenuItem('prof_services', u'ПРОФ услуги', target=reverse('mobil.views.service.search_prof_service'), perm='mobil.service_search', icon='icon-search'),
        MenuItem('lmk_services', u'ЛМК услуги', target=reverse('mobil.views.service.search_lmk_service'), perm='mobil.service_search', icon='icon-search'),
    )),
))
