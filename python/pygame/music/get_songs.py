import pygame.mixer
from time import sleep

pygame.init()

sound = pygame.mixer.Sound("LilJontheEas.wav")
channelA = pygame.mixer.Channel(1)
channelA.play(sound)
sleep(15)