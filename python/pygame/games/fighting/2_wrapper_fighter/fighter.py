# -*- coding:utf-8 -*-
import pygame
from draw_wrapper import Draw

color = { # color - global for created CirlceObject
            'red': (255, 0, 0),
            'black': (0, 0, 0),
            'green': (0, 255, 0),
            'blue': (0, 0, 255)
        }

LINE_THICKNESS = 5
LENGHT_PART_BODY = 35
HEAD_RADIUS = 25

class Man(object):
    list_name = []

    def __init__(self, window, name, **qwargs):
        self.window = window #экран pygame

        self.name = name
        self.get_valid_name()
        self.color = color[self.name]

        self.hp = qwargs.get('hp', 100)
        self.head_radius = HEAD_RADIUS
        self.thickness = LINE_THICKNESS
        self.get_init_position()
        self.set_points_skelet()

    def get_init_position(self): #TODO потом поправить
        self.x = 5
        self.y = 5

    def set_points_skelet(self):
        # правка точек
        self.x_y_head = (self.x, self.y)

         # туловище
        start_x_tunk, start_y_tunk = self.x, self.y + self.head_radius
        self.trunk = [[start_x_tunk, start_y_tunk], [start_x_tunk, start_y_tunk+LENGHT_PART_BODY]] # + потому что инверсия

        start_x_arm, start_y_leg = self.trunk[0]
        self.left_arm = [[start_x_arm, start_y_leg],
                         [start_x_arm+LENGHT_PART_BODY, start_y_leg+LENGHT_PART_BODY],
                         [start_x_arm+LENGHT_PART_BODY*2, start_y_leg]]
        self.right_arm = [[start_x_arm, start_y_leg],
                          [start_x_arm+LENGHT_PART_BODY-5, start_y_leg+LENGHT_PART_BODY-5],
                          [start_x_arm+LENGHT_PART_BODY*2-5, start_y_leg-5]]

        start_x_leg, start_y_leg = self.trunk[-1] # конечный список
        self.left_leg = [[start_x_leg, start_y_leg],
                         [start_x_leg+LENGHT_PART_BODY/2, start_y_leg+LENGHT_PART_BODY],
                         [start_x_leg, start_y_leg+LENGHT_PART_BODY*2],
        ]
        self.right_leg = [[start_x_leg, start_y_leg],
                         [start_x_leg+LENGHT_PART_BODY/2+5, start_y_leg+LENGHT_PART_BODY+5],
                         [start_x_leg+5, start_y_leg+LENGHT_PART_BODY*2+5],
        ]

    def draw_skelet(self): # TODO DRAW ME
        self.set_points_skelet()
        # туловище
        Draw.draw_lines(self.window, self.color, self.trunk, self.thickness)

        # руки
        Draw.draw_lines(self.window, self.color, self.left_arm, self.thickness)
        Draw.draw_lines(self.window, self.color, self.right_arm, self.thickness)

        # ноги
        Draw.draw_lines(self.window, self.color, self.left_leg, self.thickness)
        Draw.draw_lines(self.window, self.color, self.right_leg, self.thickness)

        # голова
        x_head, y_head = self.x_y_head
        Draw.draw_circle(self.window,
                            self.window,
                            self.color,
                            x_head, y_head,
                            self.head_radius,
                            self.thickness
                         )

    def draw_on_the_screen(self):

        self.draw_skelet()



    def change_position(self, x=0, y=0):
        self.x += x
        self.y += y

    def get_valid_name(self):
        if self.name in Man.list_name:
            raise Exception('create class with another color name')
        if not color.get(self.name, None):
            raise Exception('create class with color name in colors')