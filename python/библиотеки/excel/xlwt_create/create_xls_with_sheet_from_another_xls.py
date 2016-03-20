from tempfile import TemporaryFile
from xlwt import Workbook


# add sheets
book = Workbook() # Workbook(encoding='utf-8')
sheet1 = book.add_sheet('Sheet1')
book.add_sheet('Sheet 2')

sheet1.write(0,0,'A1')
sheet1.write(0,1,'B1')

# add text for row
row1 = sheet1.row(1)
row1.write(0,'A2')
row1.write(1,'B2')


# work with next sheet
sheet2 = book.get_sheet(1)
sheet2.row(0).write(0, 'Sheet 2 A1')

# print book.__worksheets

# print dir(sheet1)
# print sheet1.row
# for i in sheet1
#
# # ----------------------------------------------------------ADDDDING
book2 = Workbook() # Workbook(encoding='utf-8')

book2.add_sheet_reference(sheet1)

book2.save('simple2.xls')
book2.save(TemporaryFile())


# import xlrd
# _book = xlrd.open_workbook(book, 'rb')
