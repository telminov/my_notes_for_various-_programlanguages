# -*- coding:utf-8 -*-

import pygame

#pygame.gfxdraw

pygame.init()

screen = pygame.display.set_mode((725, 92))
font = pygame.font.SysFont('muktinarrow', 72, bold=1)
textSurface = font.render("1 Child!", 1, pygame.Color(255,255,255))
screen.blit(textSurface, (10, 10))

while True:
    pygame.display.update()