# -*- coding:utf-8 -*-

import pygame

width = 600
height = 600
radius=2; fill=1
pygame.init()

window = pygame.display.set_mode((width, height))
window.fill(pygame.Color(255, 255, 255))

while True:
    pygame.draw.circle(
        window,
        pygame.Color(255, 0, 0),
        (width/2, height/2),
        radius, fill
    )
    pygame.display.update()