# -*- coding:utf-8 -*-

import lxml.html as html
from pandas import DataFrame


main_domain_stat = 'http://hosteddb.fightmetric.com'

page = html.parse('%s/events/index/date/desc/1/all' % (main_domain_stat))
table_class = page.getroot().\
        find_class('b-statistics__table-events').\
        pop()

for item in page.getroot().\
        find_class('b-statistics__table-events'):
    print item
    print dir(item)

# getroot() мы получаем корневой элемент нашего документа
# find_class() мы находим все элементы с указанными классами
# т.к. у нас только 1 класс, то его попим в нашу переменную
print('----table-class')
print(table_class)
print('----table-div')

table_div = table_class.getchildren().pop()
# getchildren(), который возвращает список подчерненных объектов текущего элемента.
#И потому, что у нас только один такой объект, ты мы извлекаем этот его из списка.

# table_div содержит таблицу с необходимой для нас информацией

events_tabl = DataFrame([{'EVENT':i[0].text, 'LINK':i[2]} for i in table_div.iterlinks()][5:]) #мы исключаем первые 5 записей.
#iterlinks(), который возвращает список котрежей (элемент, атрибут,
#адрес ссылки, позиция ) внутри заданного элемента
print table_div
print('----table-div  iterlinks')

print table_div.iterlinks()

event_date = DataFrame([{'EVENT': evt.getchildren()[0].text_content(),
                         'DATE':evt.getchildren()[1].text_content()}
                        for evt in table_div][2:])
print('---event date')

print(event_date)

# ест ссылки можно получить обративший к свойству .text соответсвующего элемента
