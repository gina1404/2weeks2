package com.twoweeks.spring.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.twoweeks.spring.covid.report.model.vo.Center;

public class CovidCenterExcelRead {
	
	@SuppressWarnings("resource")
	public List<Center> xlsToCenterList(String filepath){
		List<Center> list=new ArrayList<Center>();
		
		FileInputStream fis=null;
		HSSFWorkbook workbook=null;
		
		try {
			fis=new FileInputStream(filepath);
			workbook=new HSSFWorkbook(fis);
			
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			Center c;
			
			for(int sheetIndex=0; sheetIndex<workbook.getNumberOfSheets(); sheetIndex++) {
				curSheet=workbook.getSheetAt(sheetIndex);
				for(int rowIndex=0; rowIndex<curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					if(rowIndex!=0) {
						curRow=curSheet.getRow(rowIndex);
						c=new Center();
						String value;
						
						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							for(int cellIndex=0; cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell=curRow.getCell(cellIndex);
								
								if(true) {
									value="";
									switch(curCell.getCellType()) {
										case FORMULA : value=curCell.getCellFormula(); break;
										case NUMERIC : value=curCell.getNumericCellValue()+""; break;
										case STRING : value=curCell.getStringCellValue()+""; break;
										case BLANK : value=curCell.getBooleanCellValue()+""; break;
										case ERROR : value=curCell.getErrorCellValue()+""; break; 
										default : value=new String(); break;										
									}
									switch(cellIndex) {
										case 1 : c.setSido(value); break;
										case 2 : c.setSigungu(value); break;
										case 3 : c.setCenterName(value); break;
										case 4 : c.setAddress(value); break;
										case 8 : c.setPhone(value); break;
										default : break;
									}
								}
							}
							list.add(c);
						}
					}
				}
			}
			
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(workbook!=null) workbook.close();
				if(fis!=null) fis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
}
