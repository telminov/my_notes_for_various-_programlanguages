# -*- coding:utf-8 -*-

import pygame
from pygame import *

WINDOW_WIDTH = 600; WINDOW_HEIGHT = 600
WINDOW_COLOR = 255, 255, 255

class Game(object):

    def __init__(self):
        self.window = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
        a = 255, 255, 255
        self.window.fill(pygame.Color(*WINDOW_COLOR))

        pygame.init()

    def clear_screen(self):
        self.window.fill(pygame.Color(*WINDOW_COLOR)) # clear_screen

    def update(self):
        pygame.display.update()


