#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pygame import *
import os
from draw_wrapper import Draw

PLATFORM_WIDTH = 32
PLATFORM_HEIGHT = 32
PLATFORM_COLOR = "#FF6262"
ICON_DIR = os.path.dirname(__file__) #  Полный путь к каталогу с файлами

load_block_jpg = '{0}/blocks/platform.png'.format(ICON_DIR)

print 0 * PLATFORM_WIDTH

class Platform(object):
    def __init__(self, window, x, y):
        print x
        print PLATFORM_WIDTH
        self.x = x * PLATFORM_WIDTH # TODO уточнить
        self.y = y * PLATFORM_HEIGHT
        self.window = window
        self.color = PLATFORM_COLOR
        self.width, self.height = PLATFORM_WIDTH, PLATFORM_HEIGHT

        self.loaded_image = load_block_jpg # возможно при использовании с др библ нужно переопределять


    def draw(self):
        Draw.draw_image(self.window, self.loaded_image, self.x, self.y, self.width, self.height)

    @staticmethod
    def draw_platforms(list_platforms):
        for platform in list_platforms:
            platform.draw()


