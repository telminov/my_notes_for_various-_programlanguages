# -*- coding:utf-8 -*-
import pygame
from pygame.constants import KEYDOWN


class GameEvents(object):
    def __init__(self, list_circles):
        self.list_circles = list_circles
        self.valid_list_circles() # some_validation
        for circle in list_circles: #TODO это если добавлять каждому цвету спец возможности
            setattr(self, circle.name, circle)


    def get_key_and_game(self):
        for event in pygame.event.get():
            if event.type == KEYDOWN:

                # first object
                if event.key == pygame.K_LEFT:
                    self.list_circles[0].change_position(x=-3)
                if event.key == pygame.K_RIGHT:
                    self.list_circles[0].change_position(x=+3)
                if event.key == pygame.K_UP:
                    self.list_circles[0].change_position(y=-3) #инверсия OY
                if event.key == pygame.K_DOWN:
                    self.list_circles[0].change_position(y=+3)

                # add keys for

    def valid_list_circles(self):
        if not len(self.list_circles):
            raise Exception('YOU MUST ADD OBJECTS TO list_circles')