# -*- coding:utf-8 -*-
import os
from platform import Platform


CURENT_DIR = os.path.dirname(__file__)


def processing_level_and_get_list_platforms(number_level, window):
    '''
    :param number_level:
    :param окно, на котором будут отображаться платформы:
    :return: список платформ
    '''
    levelFile = open('{0}/levels/{1}.txt'.format(CURENT_DIR, number_level), 'r')
    list_platforms = []
    for y, line in enumerate(levelFile.readlines()):
        for x, symbol in enumerate(line):

            if symbol == '-': # создаем платформу
                new_platform = Platform(window, x, y)
                list_platforms.append(new_platform)

    return list_platforms

