
def get_page(request, qs, objects_count=20):
    '''
    Функция для пагинации (разбиения списка по страницам).
    qs - query set объектов в списке;
    objects_count - число объектов на странице;
    Возвращается объект класса Page.
    '''

    per_page = request.GET.get('per_page', objects_count)
    if per_page == 'all':
        from mongoengine.base.datastructures import BaseList
        objects_count = qs.count() if not isinstance(qs, (BaseList, list)) else len(qs)
    else:
        objects_count = int(per_page)
    paginator = Paginator(qs, objects_count)              # Количество объектов на странице
    if type(qs) is RawQuerySet:
        paginator._count = len(set(qs))

    page_number = request.GET.get('page', 1)                  # Если не передали GET -- показываем page=1

    try:
        page = paginator.page(page_number)
    except PageNotAnInteger:
        # Если передали не целое число -- показываем первую страницу
        page = paginator.page(1)
    except EmptyPage:
        # Если запросили страницу с номером около 100500 -- показываем последнюю страницу
        page = paginator.page(paginator.num_pages)

    # навесим доп атрибут с начальным номером выводимого на странице элемента
    page.counter_start = page.paginator.per_page * (page.number - 1)

    return page
