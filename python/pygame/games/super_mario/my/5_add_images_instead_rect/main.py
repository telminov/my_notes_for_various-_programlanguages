#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Импортируем библиотеку pygame
import pygame
from pygame import *

#Объявляем переменные
from blocks import Platform
from class_mario import Player

WIN_WIDTH = 800 # Ширина создаваемого окна
WIN_HEIGHT = 640 # Высота
DISPLAY = (WIN_WIDTH, WIN_HEIGHT) # Группируем ширину и высоту в одну переменную
BACKGROUND_COLOR = "#004400"

######################## platform
PLATFORM_WIDTH = 32
PLATFORM_HEIGHT = 32
PLATFORM_COLOR = "#FF6262"
#############################

level = [
       "-------------------------",
       "-                       -",
       "-                       -",
       "-                       -",
       "-            --         -",
       "-                       -",
       "--                      -",
       "-                       -",
       "-                   --- -",
       "-                       -",
       "-                       -",
       "-      ---              -",
       "-                       -",
       "-   -----------        -",
       "-                       -",
       "-                -      -",
       "-                   --  -",
       "-                       -",
       "-                       -",
       "-------------------------"]


############################################


def main():
    pygame.init() # Инициация PyGame, обязательная строчка

    timer = pygame.time.Clock() # таймер для упр скоростью игры
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

    while 1: # Основной цикл программы'
        timer.tick(600) # урпавление скоростью

        #---------------------BACKGROUND AND PLATFORT--------------

        x = y = 0 # координаты
                     #на каждой новой строчке начинаем с нуля

        #####################рисование фона
        screen.blit(bg, (0,0))      # Каждую итерацию необходимо всё перерисовывать

        #--------------- рисование ячеек
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

        #-----------------EVENT FOR MARIO-------------------#
        left = right = up= False    # по умолчанию
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

        hero.update(left, right, up, platforms) # передвижение

        entities.draw(screen) # отображение
        #---------------------end_event---------------------#

        pygame.display.update()     # обновление и вывод всех изменений на экран



if __name__ == "__main__":
    main()
