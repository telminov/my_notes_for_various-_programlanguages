# -*- coding:utf -*-

class RSA(object):
    def __init__(self, p, q, m, e):
        self.p = p
        self.e = e
        self.m = m
        self.q = q

        self.n = p*q
        self.n2 = (p-1) * (q-1)
        self.d, self.y = self.get_d_y()

        self.c = self.get_c()

    def get_d_y(self):

        for y in range(1, 1000):
            d = (self.n2*y + 1) / e

            if e*d == 1 + y*self.n2:
                break
        return d, y

    def get_c(self):
        return pow(self.m, self.e) % self.n

    def print_values(self):
        print("d={0}, y={1}".format(self.d, self.y))
        print("c={0}".format(self.c))

        print("KU {0} : {1}".format(self.n, self.e))
        print("KR {0} : {1}".format(self.d, self.e))


print 'Korolkov'
p = 3331
q = 3511
m = 1291
e = 181
rsa_nicking = RSA(p,q,m,e)
rsa_nicking.print_values()

print 'Golovin'
rsa_Golovin = RSA(3361,3533, 1307, 211)
rsa_Golovin.print_values()