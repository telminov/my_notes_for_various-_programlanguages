# -*- coding:utf8 -*-
import pygame


class Draw:
    # window - экран, на котором рисуется
    # window = pygame.display.set_mode((640, 480))
    @staticmethod
    def draw_circle(self, window, color, x, y, radius, thickness):
        pygame.draw.circle(
            window,
            color,
            (x, y),
            radius,
            thickness
            )

    @staticmethod
    def draw_line(window, color, x_y_begin, x_y_end, thickness=1):
        '''

            pygame.draw.line(screen, (0, 0, 255), (0, 0), (639, 479))
        '''
        pygame.draw.line(window, color, x_y_begin, x_y_end, thickness)

    @staticmethod
    def draw_lines(window, color, list_lists_points, thickness=1, closed=False):
        '''
            Draw.draw_lines(game.window, (255,255,0), [[0, 80], [50, 90], [200, 80], [220, 30]], 5, False)
        '''
        pygame.draw.lines(window, color, closed, list_lists_points, thickness)

    @staticmethod
    def draw_image(window, image, x, y, width, height):
        window.blit(image, (x, y))





