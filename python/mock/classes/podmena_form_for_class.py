# -*- coding:utf-8 -*-
from mock import Mock, patch, PropertyMock


class MainClassMixin(object):
    def form(self):
        print('hello')

    def get_form_data(self):
        get_data = {}
        get_data['date'] = self.form.cleaned_data.get('date')
        return get_data

# нужно подставлять в форм нужные нам данные


cleaned_data = {'date': 2}
form = Mock(cleaned_data=cleaned_data)
with patch('__main__.MainClassMixin.form', new_callable=PropertyMock) as mock_main_cl:
    mock_main_cl.return_value = form
    this_foo = MainClassMixin()
    print(dir(this_foo))
    print(this_foo.get_form_data())

form = Mock(cleaned_data=cleaned_data)
with patch('__main__.MainClassMixin.form', new_callable=PropertyMock) as mock_main_cl:
    mock_main_cl.return_value = form
    this_foo = MainClassMixin()
    print(dir(this_foo))
    print(this_foo.get_form_data())

a = MainClassMixin()
print(dir(a))
