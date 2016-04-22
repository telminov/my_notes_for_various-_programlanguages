# -*- coding:utf-8 -*-
import math


class RSA(object):
    def __init__(self, p, q, m, e):
        '''
        Выбираются два простых числа p и q
        m - число для шифрования
        e - произвольное простое число - для (p-1)(q-1)
        e, n - открытый ключ
        d - хранится в секрете  {d, n} - позволит расшифровать сообщение
        '''
        self.p, self.q, self.m, self.e = p, q, m, e
        self.n = p*q

    def get_d_and_Y(self):
        ''' Методом Евклида получаем множество пар d,y
        e*d + (p-1)(q-1)*y = 1
        d = (1 - (p-1)(q-1)*y)/e   - тогда можно сделать итерацию по y и найти ему пару d
        d = (1 - pq_*y)/e '''
        pq_ = (self.p - 1) * (self.q - 1); e = self.e

        Y = 0
        while True:
            d = float(1 - pq_*Y) / float(e)

            if d == int(d):
                # print('d={0} , y={1}'.format(d, Y))
                return (d, Y)

            Y -= 1

    def get_k(self):
        "блоки равные размеру  i_to = pow(2, k) - 1 - длин сообщения"
        return int(math.log(self.n, 2))

    def get_c(self):
        ''' Шифруем сообщение
        ci = ((mi) в степени e) % n  в диапозоне от 0 до (2 в степ k -1)
        k = self.get_k() # разбивать сообщения на блоки
         '''
        c = pow(self.m, self.e) % self.n
        return c

    def get_m_from_c(self):
        " Расшифрование"
        c = self.get_c() # штука которая шифрует нашу m
        d = self.get_d_and_Y()[0] # т.к. функция возвращает список [d, Y]
        m = long(pow(c, d)) % self.n
        print m

    def print_values(self):
        d, Y = self.get_d_and_Y()
        print("d={0}, y={1}".format(d, Y))
        print("c={0}".format(self.get_c()))
        print("KU  e={0} : n={1}".format(self.e, self.n))
        print("KR  d={0} : n={1}".format(d, self.n))


#######################################################################################
print('Корольков Вариант 9')
# RSA(p, q, m, e)
korol_rsa = RSA(3329, 3499, 1289, 181)
korol_rsa.print_values()

golo = RSA(3361, 3533, 1307, 211)
golo.print_values()

dim = RSA(3343, 3517, 1297, 191)
dim.print_values()
# Корольков Варинат 9
# d=707485.0, y=-11
# c=4342983
# KU  e=181 : n=11648171
# KR  d=707485.0 : n=11648171
