# -*- coding:utf-8 -*-
import pygame


def incr_count_exemplar_class(constructor):
    counter_name = 'index'
    def _constructor_wrapper_(self, *args, **kwargs):
        if not hasattr(self.__class__, counter_name):
            setattr(self.__class__, counter_name, 1)
        else:
            setattr(self.__class__, counter_name, getattr(self.__class__, counter_name) + 1)
        constructor(self, *args, **kwargs)
    return _constructor_wrapper_


class Man(object):

    @incr_count_exemplar_class
    def __init__(self, window, **qwargs):
        self.window = window #экран pygame

        self.height = qwargs.get('height', 20)
        self.hp = qwargs.get('hp', 100)
        self.color = qwargs.get('hp', (0, 0, 0)) #black
        self.turned_right = qwargs.get('turned_right', False)
        self.radius = qwargs.get('radius', 200)
        self.fill = qwargs.get('fill', 10)
        self.index = self.index #если не написать, то у всех инстансов будет одинаковый index
        #index получаю из incr_count_exemplar_class()
        self.get_init_position()

    def get_init_position(self):
        if self.turned_right:
            self.x = 5
            self.y = 5

    def draw_on_the_screen(self):
        pygame.draw.circle(
        self.window,
        pygame.Color(255, 0, 0),
        (self.x, self.y),
        self.radius,
        self.fill
        )


man1 = Man()
man2 = Man()

print(man1.index)
print(man2.index)
print(man2.index)
print(man1.index)
