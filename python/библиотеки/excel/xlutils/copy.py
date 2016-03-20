# -*- coding:utf-8 -*-
import xlrd
import xlwt
from xlutils.copy import copy

dir = '/home/nicking/пригодится/python/библиотеки/excel/'
name_file = 'example.xls'

rb = xlrd.open_workbook(dir+name_file, on_demand=True, formatting_info=True)
wb = copy(rb)
wb.save("final_complete.xls")