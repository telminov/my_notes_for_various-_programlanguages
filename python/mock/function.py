# -*- coding:utf-8 -*-
from mock import Mock, MagicMock


def f(a, b, c): print(a)

#вызов нашей функии TODO уточнить что происходит
mock = Mock(spec=f)
mock(1, 2, c=3) #<Mock name='mock()' id='140161580456576'>
mock.assert_called_with(1, 2, 3)
mock.assert_called_with(a=1, b=2, c=3)
print(dir(mock))

#вызов нашей функции
def my_func(value):
    return value + 1
m = MagicMock(side_effect=my_func)
print(m(1)) #2   вызов функции
print(m(2)) #3
print(m.mock_calls) #[call(1), call(2)]


#выхываем функцию через мок
values = {'a': 1, 'b': 2, 'c': 3}
def side_effect(arg):
     return values[arg]

mock.side_effect = side_effect
print mock('a'), mock('b'), mock('c')
#(1, 2, 3)

#итерируемся
mock.side_effect = [5, 4, 3, 2, 1]
print mock(), mock(), mock()
#(5, 4, 3)