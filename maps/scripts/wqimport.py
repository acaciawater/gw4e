'''
import wq data from lab spreadheet
'''

import xlrd, xlwt

XLFILE='/media/projdirs/Ethiopia Unicef/inventory/Inventory Data and WQ Results/PHASE - II/WQ/UNICEF ChemData.xlsx'

headers1 = [      
    'Lab No.',      
    'Client/Project',    
    'Client ID',                                                                          
    'Location',      
    'Reported Date',      
]

headers2 = [      
    'Client Ref',
    'Date of Collection',
    'Source of Sample',
    'Date of Received',
]

params = [
    'pH',    
    'Electrical Conductivity (µS/cm)',    
    'Sodium (mg/L Na+)',    
    'Potassium (mg/L K+)',    
    'Total Iron (mg/L Fe2+ & Fe3+)',    
    'Manganese (mg/L Mn)',    
    'Ammonia (mg/L NH3-N)',    
    'Total Hardness (mg/L Ca CO3)',    
    'Calcium (mg/L Ca2+)',    
    'Magnesium (mg/L Mg2+)',    
    'Alkalinity (mg/L CaCO3)',    
    'Carbonate (mg/LCO32-)',    
    'Bicarbonate (mg/L HCO3-)',    
    'Chloride (mg/L Cl-)',    
    'Sulphate (mg/L SO2-4)',    
    'Nitrate (mg/L NO3-N)',    
    'Fluoride (mg/L F-)',    
    ]

def read_header(sheet, row):
    result = {}
    for i, h in enumerate(headers1):
        result[h] = sheet.cell_value(row+i, 2)
    for i, h in enumerate(headers2):
        result[h] = sheet.cell_value(row+i, 6)
    return result

def load_page(sheet, row):
    result = read_header(sheet, row)
    row += 6
    for i, h in enumerate(params):
        result[h] = sheet.cell_value(row+i, 3)
    return result

def importwq(filename=XLFILE):
 
    wb = xlrd.open_workbook(filename) 
    sheet = wb.sheet_by_index(0) 
    row = 0
    page = load_page(sheet, row)
    while page:
        yield page
        row += 24
        while row < sheet.nrows and 'Lab' not in sheet.cell_value(row,0):
            row += 1
        if row + 24 > sheet.nrows:
            break
        page = load_page(sheet, row)        
     
     
if __name__ == '__main__':
    
    fieldnames = headers1 + headers2 + params
    book = xlwt.Workbook(encoding='utf-8')
    sheet = book.add_sheet('Sheet1')
    for i, name in enumerate(fieldnames):
        sheet.write(0,i,name)
    
    for i, row in enumerate(importwq()):
        for j, name in enumerate(fieldnames):
            sheet.write(i+1,j,row[name])
    book.save('wq.xls')
    
