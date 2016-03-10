#!/usr/bin/python
import os
os.rename("/home/user/testfile.txt", "/home/user/test.txt")


myfile = open("/home/user/testfile.txt", "w") #a - added to end file, r - read, w-write
print>>myfile, "I want to drink some beer with Guido"
myfile.close()


with open("/home/user/testfile.txt", "w") as myfile:
    print>>myfile, "I want to drink some beer with Guido"


for line in reversed(open("/var/log/messages").readlines()):
    print line


#А чтобы прочесть строку под определенным номером — можно воспользоваться как
#стандартным чтением файла в лист, так и использовать модуль linecache:
line = linecache.getline("C:\\test.txt", 2)
print line
# or
line = open("C:\\test.txt").readlines()[1]
print line


#бинарный файл
pic = open("C:\\Pictures\\V4erashnaya_pyanka.bmp", "rb")
buf = pic.read(5) # считываем первые 5 байт
print buf


import glob
for filename in glob.glob("../plugins/*.zip"):
    print filename


print os.path.dirname("/home/user/test.txt")   #имя каталога
print os.path.basename("/home/user/test.txt")   #имя файла


import webbrowser
webbrowser.open('http://www.habrahabr.ru/')
webbrowser.open(u'file://home/user/mysite.html')
webbrowser.open(u'mailto:foo@bar.com?subject=Feedback%20message')


import chardet
str = open("/home/user/myfile.txt","r").readline()
enc = chardet.detect(str)
print enc['confidence']
print enc['encoding']
# Для определения кодировки строки или файла можно воспользоваться удобным 
# модулем chardet, причем возвращается не только кодировка, но и «уверенность» 
# в том, что она определена правильно, в красивом словарике:
