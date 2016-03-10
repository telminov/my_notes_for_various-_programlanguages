# -*- coding:utf-8 -*-	
import cv


capture = cv.CaptureFromCAM(-1)
fourcc = cv.CV_FOURCC('M','J','P','G')
#fourcc — это кодек, целое число, результат отображения 
#четырехсимвольного имени кодека в числовой индекс. 
#Например, CV_FOURCC('P','I','M,'1') — это сжатие MPEG-1

#todo полный список кодеков http://www.fourcc.org/codecs.php
fps = 16
# или fps можно задачть 
# fps = cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FPS)
# параметры записи должны устанавливаться не на глазок, а точным образом

w, h = 640, 480
# или  эти параметры можно получить прям с камеры
# w = cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FRAME_WIDTH)
# h = cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FRAME_HEIGHT)
# w, h = int(w), int(h) # По умолчанию возвращаются как float

#если качество видео съемки не устравиает
# config = {
# 	cv.CV_CAP_PROP_BRIGHTNESS: 50,
# 	cv.CV_CAP_PROP_CONTRAST: 50,
# 	cv.CV_CAP_PROP_SATURATION: 50, #насыщенность
# }
# for param, value in config.iteritems():
# 	cv.SetCaptureProperty(capture, param, value)


stream = cv.CreateVideoWriter("test.avi", fourcc, fps, (w, h))
while True:
    frame = cv.QueryFrame(capture)
    cv.WriteFrame(stream, frame)