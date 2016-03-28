# -*- coding:utf-8 -*-
from mock import Mock, patch, PropertyMock


class FooEx:
    a = 32
    @property
    def foo(self):
        print('FooEx')
        return 'something'

    @foo.setter
    def foo(self, value):
        pass

    def return_data(self):
        return self.a

    def method(self):
        a = 43
        return a

    def print_data_from(self):
        print self.attribute.a

foo = FooEx()
form = Mock(a='its me')
foo.attribute = form
foo.print_data_from()
print foo.foo

with patch('__main__.FooEx.return_data', new_callable=PropertyMock) as mock_main_cl:
    mock_main_cl.return_value = 890
    this_foo = FooEx()
    print(this_foo.return_data) # он возвращает не как функция, а return_data становится атрибутом (

