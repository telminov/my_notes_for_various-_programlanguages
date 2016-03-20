# -*- coding:utf-8 -*-
from fighter import Man
import pygame

from events_game import GameEvents

width = 600; height = 600

pygame.init()

window = pygame.display.set_mode((width, height)) #get_height   get_height
window.fill(pygame.Color(255, 255, 255))

black_man = Man(window=window, name='black')
list_fighters = [black_man, ]

game_events = GameEvents(list_fighters)

while True:

    window.fill(pygame.Color(255, 255, 255)) #clear_screen
    for fighter in list_fighters:
        fighter.draw_on_the_screen()

    game_events.set_pushed_keys()
    game_events.get_action_by_pushed_keys()
    pygame.display.update()


