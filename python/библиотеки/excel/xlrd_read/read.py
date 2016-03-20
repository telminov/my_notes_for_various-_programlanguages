from xlrd import open_workbook


# open sheet in excel  by index or name
book = open_workbook('example.xls')
print book.nsheets
for sheet_index in range(book.nsheets):
    print book.sheet_by_index(sheet_index)
print book.sheet_names()
for sheet_name in book.sheet_names():
    print book.sheet_by_name(sheet_name)
for sheet in book.sheets():
    print sheet



# read xls by index sheet
from xlrd import open_workbook, cellname

book = open_workbook('example.xls')
sheet = book.sheet_by_index(0)
print sheet.name
print sheet.nrows
print sheet.ncols
for row_index in range(sheet.nrows):
    for col_index in range(sheet.ncols):
        print cellname(row_index,col_index),'-',
        print sheet.cell(row_index,col_index).value

# open with encoding
# book = open_workbook('dodgy.xls', encoding='cp1252')


# xlrd.Book ____________________________________
# colour_map
# font_list
# format_list
# format_map
# palette_record
# style_name_map
# xf_list

# xlrd.sheet.Sheet ________________________________
# cell_xf_index
# rowinfo_map
# colinfo_map
# computed_column_width
# default_additional_space_above
# default_additional_space_below
# default_row_height
# default_row_height_mismatch
# default_row_hidden
# defcolwidth
# gcw
# merged_cells
# standard_width

# xlrd.sheet.Cell ______________________________________
# xf_index

# Other Classes ______________________________________
# In addition, the following classes are solely used to represent formatting information:
# xlrd.sheet.Rowinfo
# xlrd.sheet.Colinfo
# xlrd.formatting.Font
# xlrd.formatting.Format
# xlrd.formatting.XF
# xlrd.formatting.XFAlignment
# xlrd.formatting.XFBackground
# xlrd.formatting.XFBorder
# xlrd.formatting.XFProtection