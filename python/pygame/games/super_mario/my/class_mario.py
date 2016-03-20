#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pygame import *

MOVE_SPEED = 7
WIDTH = 22
HEIGHT = 32
COLOR =  "#888888"

JUMP_POWER = 10
GRAVITY = 0.35 # Сила, которая будет тянуть нас вниз

class Player(sprite.Sprite):
    def __init__(self, x, y):
        print 'IM CREATED'
        sprite.Sprite.__init__(self)
        self.xvel = 0   #скорость перемещения. 0 - стоять на месте
        self.startX = x # Начальная позиция Х, пригодится когда будем переигрывать уровень
        self.startY = y
        self.image = Surface((WIDTH,HEIGHT))
        self.image.fill(Color(COLOR))
        self.rect = Rect(x, y, WIDTH, HEIGHT) # прямоугольный объект

        self.yvel = 0 # скорость вертикального перемещения #
        self.onGround = False # На земле ли я?

    def update(self,  left, right, up):

        # ------left-right
        if left:
            self.xvel = -MOVE_SPEED # Лево = x- n

        if right:
            self.xvel = MOVE_SPEED # Право = x + n

        if not(left or right): # стоим, когда нет указаний идти
            self.xvel = 0

        self.rect.x += self.xvel # переносим свои положение на xvel
        # ---------------------------------------------

        # --------up-down
        if up:
           if self.onGround: # прыгаем, только когда можем оттолкнуться от земли
               self.yvel = -JUMP_POWER

        if not self.onGround:
            self.yvel += GRAVITY

        self.rect.y += self.yvel
        # ---------------------------------

    def draw(self, screen): # Выводим себя на экран
        screen.blit(self.image, (self.rect.x,self.rect.y))