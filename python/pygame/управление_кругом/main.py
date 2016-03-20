# -*- coding:utf-8 -*-
from circle_object import CircleObject
import pygame

from events_game import GameEvents

width = 600; height = 600

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

    game_events.set_pushed_keys()
    game_events.get_position_by_pushed_keys()
    pygame.display.update()


