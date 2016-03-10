# -*- coding: utf-8 -*-
import cv

capture = cv.CaptureFromCAM(0) #-1 - любая доступная
#или другая
frame = cv.QueryFrame(capture)
cv.SaveImage("capture.jpg", frame)

#то бишь был 1 кадр, а теперь

capture = cv.CaptureFromCAM(-1)
cv.NamedWindow("capture", cv.CV_WINDOW_AUTOSIZE)

i = 0
while True:
    frame = cv.QueryFrame(capture)
    cv.ShowImage("capture", frame)
    #NamedWindows - создает и отображает окно
    cv.WaitKey(10)
    path = "capture%.4d.jpg" % i # Уникальное имя для каждого кадра
    cv.SaveImage(path, frame)
    i += 1


