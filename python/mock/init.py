# -*- coding:utf-8 -*-

from mock import MagicMock, Mock

mock = Mock(side_effect=KeyError('foo'))
#mock() # raise effect KeyError: 'foo' #вызов ошибки


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

# подменяем словарик на производный
from mock import patch
foo = {'key': 'value'}
original = foo.copy()
with patch.dict(foo, {'newkey': 'newvalue'}, clear=True):
    print foo
    assert foo == {'newkey': 'newvalue'}

print foo
assert foo == original

#класс замена метода
from mock import MagicMock
class ProductionClass(object):
    def method(self):
        self.something(1, 2, 3)
    def something(self, a, b, c):
        print 100500

real = ProductionClass()
real.something(1,3,4)
real.something = MagicMock()
real.method()
real.something.assert_called_once_with(1, 2, 3) #ХЗ ЗАЧЕм

# классы
class ProductionClass(object):
    def closer(self, something):
        something.close()

real = ProductionClass()
mock = Mock()
real.closer(mock)
mock.close.assert_called_with()


def some_function():
    instance = module.Foo()
    return instance.method()

with patch('module.Foo') as mock:
    instance = mock.return_value
    instance.method.return_value = 'the result'
    result = some_function()
    assert result == 'the result'

    