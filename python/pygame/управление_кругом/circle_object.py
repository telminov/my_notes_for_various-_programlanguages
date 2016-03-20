# -*- coding:utf-8 -*-
import pygame


color = { # color - global for created CirlceObject
            'red': (255, 0, 0),
            'black': (0, 0, 0),
            'green': (0, 255, 0),
            'blue': (0, 0, 255)
        }


class CircleObject(object):
    list_name = []

    def __init__(self, window, name, **qwargs):
        self.window = window #экран pygame

        self.name = name
        self.get_valid_name()
        self.color = color[self.name]

        self.height = qwargs.get('height', 20)
        self.hp = qwargs.get('hp', 100)
        self.radius = qwargs.get('radius', 100)
        self.fill = qwargs.get('fill', 3)
        self.get_init_position()

    def get_init_position(self): #TODO потом поправить
        self.x = 5
        self.y = 5

    def draw_on_the_screen(self):
        pygame.draw.circle(
            self.window,
            self.color,
            (self.x, self.y),
            self.radius,
            self.fill
            )

    def change_position(self, x=0, y=0):
        self.x += x
        self.y += y

    def get_valid_name(self):
        if self.name in CircleObject.list_name:
            raise Exception('create class with another color name')
        if not color.get(self.name, None):
            raise Exception('create class with color name in colors')