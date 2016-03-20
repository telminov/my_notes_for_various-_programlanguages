#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Импортируем библиотеку pygame
import pygame
from pygame import *
from camera import Camera
from class_mario import Player
#Объявляем переменные
from blocks import Platform, PLATFORM_HEIGHT, PLATFORM_WIDTH

WIN_WIDTH = 800 # Ширина создаваемого окна
WIN_HEIGHT = 640 # Высота
DISPLAY = (WIN_WIDTH, WIN_HEIGHT) # Группируем ширину и высоту в одну переменную
BACKGROUND_COLOR = "#004400"

######################## platform

level = [
       "----------------------------------",
       "-                                -",
       "-                       --       -",
       "-                                -",
       "-            --                  -",
       "-                                -",
       "--                               -",
       "-                                -",
       "-                   ----     --- -",
       "-                                -",
       "--                               -",
       "-                                -",
       "-                            --- -",
       "-                                -",
       "-                                -",
       "-      ---                       -",
       "-                                -",
       "-   -------         ----         -",
       "-                                -",
       "-                         -      -",
       "-                            --  -",
       "-                                -",
       "-                                -",
       "----------------------------------"]
############################################

def camera_configure(camera, target_rect):
    l, t, _, _ = target_rect
    _, _, w, h = camera
    l, t = -l+WIN_WIDTH / 2, -t+WIN_HEIGHT / 2

    l = min(0, l)                           # Не движемся дальше левой границы
    l = max(-(camera.width-WIN_WIDTH), l)   # Не движемся дальше правой границы
    t = max(-(camera.height-WIN_HEIGHT), t) # Не движемся дальше нижней границы
    t = min(0, t)                           # Не движемся дальше верхней границы

    return Rect(l, t, w, h)
# ---------------------------------------------------


def main():
    pygame.init() # Инициация PyGame, обязательная строчка

    screen = pygame.display.set_mode(DISPLAY) # Создаем окошко
    pygame.display.set_caption("Super Mario Boy") # Пишем в шапку
    bg = Surface((WIN_WIDTH,WIN_HEIGHT)) # Создание видимой поверхности bg
                                         # будем использовать как фон
    bg.fill(Color(BACKGROUND_COLOR))     # Заливаем поверхность сплошным цветом
    # ------------------------------ #

    # - add hero - #
    hero = Player(55, 55) # создаем героя по (x,y) координатам

    # ---- add block)---
    entities = pygame.sprite.Group() # Все объекты
    platforms = [] # то, во что мы будем врезаться или опираться
    entities.add(hero)

    #--------------- рисование ячеек
    x=y=0 # координаты
    for row in level: # по всем строкам
        for col in row: # каждый символ
            if col == "-":
                #создаем блок, заливаем его цветом и рисеум его
                pf = Platform(x,y)
                entities.add(pf)
                platforms.append(pf)

            x += PLATFORM_WIDTH # блоки платформы ставятся на ширине блоков
        y += PLATFORM_HEIGHT    # то же самое и с высотой
        x = 0
    #------------------END BACK END PLAT-------------------#

    total_level_width  = len(level[0])*PLATFORM_WIDTH # Высчитываем фактическую ширину уровня
    total_level_height = len(level)*PLATFORM_HEIGHT   # высоту

    camera = Camera(camera_configure, total_level_width, total_level_height)

    left = right = up = False    # по умолчанию
    timer = pygame.time.Clock()
    while 1: # Основной цикл программы'
        timer.tick(60) # урпавление скоростью

        # -----------------EVENT FOR MARIO-------------------#
        for e in pygame.event.get(): # Обрабатываем события

            # add EVENT FOR mario
            if e.type == KEYDOWN and e.key == K_LEFT:
               left = True
            if e.type == KEYDOWN and e.key == K_RIGHT:
               right = True

            if e.type == KEYUP and e.key == K_RIGHT:
               right = False
            if e.type == KEYUP and e.key == K_LEFT:
                left = False

            if e.type == KEYDOWN and e.key == K_UP:
                up = True
            if e.type == KEYUP and e.key == K_DOWN:
                up = False
            ####################

            if e.type == QUIT:
                raise SystemExit, "QUIT"

        screen.blit(bg, (0,0))      # Каждую итерацию необходимо всё перерисовывать

        hero.update(left, right, up, platforms) # передвижение
        camera.update(hero) # центризируем камеру относительно персонажа

        for e in entities:
            screen.blit(e.image, camera.apply(e))
        #---------------------end_event---------------------#
        pygame.display.update()     # обновление и вывод всех изменений на экран

if __name__ == "__main__":
    main()
