# -*- coding:utf-8 -*-

from mock import Mock, patch

mock = Mock()
attrs = {'method.return_value': 3, 'other.side_effect': KeyError}
mock.configure_mock(**attrs)
print(mock.method())

cleaned_data = {'data': 2}
attrs = {'form.return_value': cleaned_data}
mock.configure_mock(**attrs)
print(mock.form()['data'])

# подмена данных (просто добавление)
cleaned_data = {'data': 2}
form = Mock(cleaned_data=cleaned_data)
print(form.cleaned_data)

##### более правильная
attrs = {'method.return_value': 3, 'other.side_effect': KeyError}
mock = Mock(some_attribute='eggs', **attrs)
print(mock.some_attribute) #'eggs'
print(mock.method()) #3
#mock.other()


# подменяем словарик на производный
from mock import patch
foo = {'key': 'value'}
original = foo.copy()
with patch.dict(foo, {'newkey': 'newvalue'}, clear=True):  #clear=False не будет сбрасвапть
    print foo
    assert foo == {'newkey': 'newvalue'}
assert foo == original