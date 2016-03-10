# -*- coding:utf-8 -*-
import pygame

#######################настройки
width = 640
height = 480

pygame.init()

screen = pygame.display.set_mode((width, height))
background = pygame.image.load('6.jpg')
background.convert_alpha() # изменяет формат поверхности чтоб тот совпал с форматом текущего окна

next_jpg = pygame.image.load('5.jpg').convert_alpha()

#########################начало
screen.blit(background, (0, 0)) # объединяет поверхность-фон с черной поверхностью экрана
screen.blit(next_jpg, (150, 50))
while True:
    pygame.display.update()

# pygame.transform - позволяет вращать картинки
# pygame.surfarray - доступ к отдельному пикселю