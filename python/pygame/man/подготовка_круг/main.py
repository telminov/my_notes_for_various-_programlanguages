# -*- coding:utf-8 -*-
from pygame.constants import KEYDOWN

from circle_object import CircleObject
import pygame
from pygame.locals import *

from events_game import GameEvents

width = 600; height = 600
radius=2; fill=1

pygame.init()

window = pygame.display.set_mode((width, height)) #get_height   get_height
window.fill(pygame.Color(255, 255, 255))

black_circle = CircleObject(window=window, name='black')
list_circles = [black_circle, ]

game_events = GameEvents(list_circles)
while True:

    window.fill(pygame.Color(255, 255, 255)) #clear_screen
    for circle in list_circles:
        circle.draw_on_the_screen()
    pygame.display.update()

    game_events.get_key_and_game()


