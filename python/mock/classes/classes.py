# -*- coding:utf-8 -*-
from mock import PropertyMock
from mock import patch

from mock import Mock

class Foo:
    a = 6
    @property
    def foo(self):
        return 'something'
    @foo.setter
    def foo(self, value):
        pass

# подмена функции класса
with patch('__main__.Foo.foo', new_callable=PropertyMock) as mock_foo:
    mock_foo.return_value = 'mockity-mock'
    this_foo = Foo()
    print(this_foo.foo)
    this_foo.foo = 6
    print(this_foo.a)

# подмена атрибута
with patch('__main__.Foo.a', new_callable=PropertyMock) as mock_foo_a:
    mock_foo_a.return_value = 12
    this_foo = Foo()
    print(this_foo.a)

#замена в другом модуле у класса метода
import example_for_mock
def some_function():
    instance = example_for_mock.FooEx()
    return instance.method()

with patch('module.Foo') as mock:
    instance = mock.return_value
    instance.method.return_value = 'the result'
    result = some_function()
    assert result == 'the result'


# удаление атрибута

# подмена атрибута из класса другого модуля
# from example_for_mock import FooEx TODO
# a = example_for_mock.FooEx()
# a.foo()
# with patch('__main__.FooEx.foo', new_callable=PropertyMock) as mock_foo:
#     mock_foo.return_value = 'mockity-mock'
#     this_foo = Foo()
#     print(this_foo.foo)
#     this_foo.foo = 6
#     print(this_foo.a)

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


#создание класса с такими атрибутами
 #########смотри в podmena.py




