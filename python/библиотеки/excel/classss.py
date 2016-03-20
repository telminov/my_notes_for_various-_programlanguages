class A(object):
    def a(self):
        return 123

    def _c(self):
        return 12

    def __d(self):
        return 124

a = A()
print a.a()
print a._c()
