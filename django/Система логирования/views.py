@permission_required('mobil.request_logging', '/mobil/403/')
def request_logging(request):
    c = {}
    request_log = RequestLog.objects.order_by('-dc')
    form = RequestLoggingForm(request.GET or None)
    if form.is_valid():
        if form.cleaned_data.get('username'):
            request_log = request_log.filter(user__username=form.cleaned_data['username'].username)
        if form.cleaned_data['min_dc']:
            request_log = request_log.filter(dc__gte=form.cleaned_data['min_dc'])
        if form.cleaned_data['max_dc']:
            request_log = request_log.filter(dc__lte=form.cleaned_data['max_dc']) #не знаю почему, не включает последнюю дату
    c['form'] = form
    c['object_list'] = request_log[:50]
    return render(request, 'mobil/report/logging/request_login.html', c)


@permission_required('mobil.request_logging', '/mobil/403/')
def logging_users(request):
    c = {}
    form = DateTimeForm(request.GET or None)
    request_log = RequestLog.objects.all().order_by('-dc')
    c['form'] = form
    if form.is_valid():
        if form.cleaned_data['min_dc']:
            request_log = request_log.filter(dc__gte=form.cleaned_data['min_dc'])
        if form.cleaned_data['max_dc']:
            request_log = request_log.filter(dc__lte=form.cleaned_data['max_dc']) #не знаю почему, не включает последнюю дату
    print list(set([obj.user.username for obj in request_log]))
    names = list(set([obj.user.username for obj in request_log])) #получаем МНОЖЕСТВО различных имен юзеров
    print names
    if '' in names:
        names.remove('')
    list_users = [request_log.filter(user__username=obj)[0].user for obj in names] #получае юзеров из множества
    print list_users
    print list_users[0]
    c['object_list'] = list_users
    return render(request, 'mobil/report/logging/users.html', c)

# только имена персонала
@permission_required('mobil.request_logging', '/mobil/403/')
def logging_for_username(request, id):
    c = {}
    request_log = RequestLog.objects.filter(user__id=id).order_by('-dc')
    form = DateTimeForm(request.GET or None)
    if form.is_valid():
        if form.cleaned_data['min_dc']:
            request_log = request_log.filter(dc__gte=form.cleaned_data['min_dc'])
        if form.cleaned_data['max_dc']:
            request_log = request_log.filter(dc__lte=form.cleaned_data['max_dc']) #не знаю почему, не включает последнюю дату

    #TODO погуглить как получить дистинкт урлы из монго

    #получение только разных урлов
    uniq_list_urls = list(set(request_log.values_list('url')))
    # for obj in list_urls:
    uniq_logs = [request_log.filter(url=url)[0] for url in uniq_list_urls]

    sort_url = sorted([log.dc for log in uniq_logs])
    sort_request_log = []
    for i in range(len(uniq_logs)):
        for obj in uniq_logs:
            if obj.dc == sort_url[i]:
                sort_request_log.append(obj)

    uniq_sorted_logs = []
    #список в обратном порядке
    for i in range(len(sort_request_log)):
        uniq_sorted_logs.append(sort_request_log[-i-1])
    # reversed_log = [sort_request_log[-i-1] for i in range(len(sort_request_log))]
    sort_request_log = uniq_sorted_logs

    c['user_id'] = id
    c['form'] = form
    c['object_list'] = sort_request_log[:50]
    return render(request, 'mobil/report/logging/logging_username.html', c)

#штучка для построения графика!!! идут только различные запросы, высчитывается их кол-во
@permission_required('mobil.request_logging', '/mobil/403/')
def logging_for_username_graf(request, id):
    c = {}
    request_log = RequestLog.objects.filter(user__id=id).order_by('-dc')
    form = DateTimeForm(request.GET or None)
    if form.is_valid():
        if form.cleaned_data['min_dc']:
            request_log = request_log.filter(dc__gte=form.cleaned_data['min_dc'])
        if form.cleaned_data['max_dc']:
            request_log = request_log.filter(dc__lte=form.cleaned_data['max_dc']) #не знаю почему, не включает последнюю дату

    #должен быть последнем ифом,т.к. кварисет будет списком
    #получение только разных урлов
    uniq_logs = []
    uniq_list_urls = list(set(request_log.values_list('url')))
    for obj in uniq_list_urls:
        #1 - получаю только первый урл , 2 получаю кол-во одинаковых урлов
        uniq_logs.append([request_log.filter(url=obj)[0], request_log.filter(url=obj).count()])

    #RequestLog object
    #[[<RequestLog: RequestLog object>, 1], [<RequestLog: RequestLog object>, 3],
    #1
    #Сортировка по кол-ву кликов на урл
    sort_uniq_count = sorted(list(set([log[1] for log in uniq_logs]))) #сортирует уни
    sort_uniq_count.reverse()
    sort_request_log = []
    k = 0
    for i in range(len(sort_uniq_count)):
        for obj in uniq_logs[k:]: #k - кол-во отсортированных
            if obj[1] == sort_uniq_count[i]:
                k += 1
                sort_request_log.append(obj)

    uniq_list_log = [log[0] for log in sort_request_log]

    print uniq_list_log

    list_count_log = [log[1] for log in sort_request_log]
    canvas_len = 200
    sorted_min = False # TODO добавить в форму сортировку по минимуму
    if sorted_min:
        column_length = (canvas_len-10)/float(list_count_log[-1])  #получаю коэф, - от максимальной длины канваса
        dy_len = list_count_log[-1]*column_length  #получаю самый высокий столбец
    else:
        column_length = (canvas_len-10)/float(list_count_log[0])
        dy_len = list_count_log[0]*column_length
        print column_length

    print len(list_count_log)
    if len(list_count_log) < 15:
        column_width = 80
    elif len(list_count_log) < 25:
        column_width = 40
    elif len(list_count_log) < 35:
        column_width = 30
    elif len(list_count_log) < 55:
        column_width = 20
    canvas_width = (column_width) * len(list_count_log)
    if request.is_ajax():
        data = {
            'count': list_count_log,
            'dy_len':dy_len,
            'column_width': column_width,
            'column_length': column_length,
            'max':sum(list_count_log)
        }
        return JsonResponse(data)
    else:
        c['canvas_len'] = canvas_len
        c['canvas_width'] = canvas_width
        c['username'] = uniq_list_log[0].user.username
        c['form'] = form
        c['object_list'] = uniq_list_log
        return render(request, 'mobil/report/logging/logging_username_graf.html', c)


#выводит все время, когда чел пытался получить доступ к урлу
@permission_required('mobil.request_logging', '/mobil/403/')
def logging_for_url_and_user(request, id):
    c = {}
    print 'Poluchil'
    print id
    print request
    url = request.GET['url']
    user_id = id
    request_log = RequestLog.objects.filter(user__id=user_id).filter(url=url).order_by('-dc')
    c['url'] = url
    c['object_list'] = request_log
    return render(request, 'mobil/report/logging/loggin_for_url_and_user.html', c)
