# -*- coding:utf-8 -*-
from fighter import Man
import pygame

from events_game import GameEvents
import game_settings


def main():

    game = game_settings.Game() # инициализирует игру

    black_man = Man(window=game.window, name='black')
    red_man = Man(window=game.window, name='red')
    list_fighters = [black_man, red_man]

    game_events = GameEvents(list_fighters)

    pygame.draw.line(game.window, (0, 0, 255), (0, 0), (639, 479))

    while True:

        game.clear_screen() #clear_screen
        for fighter in list_fighters:
            fighter.draw_on_the_screen()

        game_events.set_pushed_keys()
        game_events.get_action_by_pushed_keys()

        game.update()


if __name__ == '__main__':
    main()