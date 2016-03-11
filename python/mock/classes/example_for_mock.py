class FooEx:
    @property
    def foo(self):
        print('FooEx')
        return 'something'
    @foo.setter
    def foo(self, value):
        pass

    def method(self):
        a = 43
        return a