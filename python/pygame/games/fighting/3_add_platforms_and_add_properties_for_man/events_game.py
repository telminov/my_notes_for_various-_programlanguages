# -*- coding:utf-8 -*-
import pygame
from pygame import *


class GameEvents(object):
    def __init__(self, list_fighters):
        self.list_fighters = list_fighters
        self.valid_list_circles() # some_validation
        for fighter in list_fighters: # TODO мб в буд убрать
            setattr(self, fighter.name, fighter)

    pushed_keys = []
    def set_pushed_keys(self):
        for event in pygame.event.get():
            if event.type == KEYDOWN:
                self.pushed_keys.append(event.key)
            if event.type == KEYUP:
                self.pushed_keys.remove(event.key)

    def get_action_by_pushed_keys(self):
        keys = self.pushed_keys

        # -------- first ----------
        if pygame.K_LEFT in keys:
            self.list_fighters[0].change_position(x=-3)
        if pygame.K_RIGHT in keys:
            self.list_fighters[0].change_position(x=+3)
        if pygame.K_UP in keys:
            self.list_fighters[0].change_position(y=-3) #инверсия OY
        if pygame.K_DOWN in keys:
            self.list_fighters[0].change_position(y=+3)


    def valid_list_circles(self):
        if not len(self.list_fighters):
            raise Exception('YOU MUST ADD OBJECTS TO list_circles')