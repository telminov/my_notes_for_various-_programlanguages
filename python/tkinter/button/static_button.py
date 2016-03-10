# -*- coding:utf-8 -*-
from Tkinter import *
def button_clicked():
    print u"Клик!"
root=Tk()
# кнопка по умолчанию
button1 = Button()
button1.pack()
# кнопка с указанием родительского виджета и несколькими аргументами
button2 = Button(root, bg="red", text=u"Кликни меня!", command=button_clicked)
button2.pack()
root.mainloop()
