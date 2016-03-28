# -*- coding:utf-8 -*-
from fighter import Man
import pygame

from events_game import GameEvents
import parse_level
import game_settings
from platform import Platform


def main():

    game = game_settings.Game() # инициализирует игру

    black_man = Man(window=game.window, name='black')
    red_man = Man(window=game.window, name='red')
    list_fighters = [black_man, red_man]

    game_events = GameEvents(list_fighters)

    # number_level = random.randrange(1, 1) # -кол-во уровней
    # list_platforms = parse_level.processing_level_and_get_list_platforms(1, game.window) # TODO вместо единицы передавай number_level

    while True:

        game.clear_screen() #clear_screen
        # Platform.draw_platforms(list_platforms) # перерисовываем платформы

        for fighter in list_fighters:
            fighter.draw_on_the_screen()

        game_events.set_pushed_keys()
        game_events.get_action_by_pushed_keys()
        game.update()


if __name__ == '__main__':
    main()