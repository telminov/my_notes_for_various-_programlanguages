# -*- coding:utf-8 -*-

import os
import cv2

# CURRENT_DIR = os.path.dirname(__file__)
# print(CURRENT_DIR)
CURRENT_DIR = '/home/nicking/пригодится/python/всякое/work_with_picture'
from IPython.display import Image
# Image(filename=CURRENT_DIR +'/cursor.png')


#Use the following function when reading an image through OpenCV and displaying through plt.
def showfig(image, ucmap):
    #There is a difference in pixel ordering in OpenCV and Matplotlib.
    #OpenCV follows BGR order, while matplotlib follows RGB order.
    print image
    print dir(image)
    if len(image.shape)==3 :
        b,g,r = cv2.split(image)       # get b,g,r
        image = cv2.merge([r,g,b])     # switch it to rgb
    imgplot=plt.imshow(image, ucmap)
    imgplot.axes.get_xaxis().set_visible(False)
    imgplot.axes.get_yaxis().set_visible(False)

#import Opencv library
try:
    import cv2
except ImportError:
    print "You must have OpenCV installed"
import matplotlib.pyplot as plt
import numpy as np


plt.rcParams['figure.figsize'] = 10, 10
# Actual Code starts here
plt.title('Sample Car')
image_path=CURRENT_DIR
carsample=cv2.imread(image_path)
showfig(carsample,None)