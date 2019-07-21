package com.kh.coworks.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.ClassPathResource;

import com.kh.coworks.approve.model.vo.ApprovDoc;

public class ExcelWrite {
	XSSFWorkbook swb;
	File fromFile;

	public ExcelWrite() {
		FileOutputStream fileOut = null;
		String sample = "/excel/sample3.xlsx";// 클래스패스에 있는 Resource 경로

		// tamplate 가져오기
		ClassPathResource resource = new ClassPathResource(sample);

		try {
			File fromFile = resource.getFile();
			swb = new XSSFWorkbook(new FileInputStream(fromFile));
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public void xlsxWiter(ApprovDoc doc) {
		if (swb == null) {
			System.out.println("파일 에러");
			return;
		}

		// cell 스타일 적용
		XSSFCellStyle style = swb.createCellStyle();
//			XSSFDataFormat format = swb.createDataFormat();
		Font font = swb.createFont();
		font.setFontHeightInPoints((short) 11);
		font.setFontName("맑은고딕");
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setVerticalAlignment((CellStyle.VERTICAL_CENTER));
		style.setFont(font);
//			style.setDataFormat(format.getFormat("0.0"));

		XSSFRow orgRow = null;
		XSSFRow newRow = null;
		XSSFSheet sheet = null;

		sheet.getRow(6).getCell(2).setCellValue(doc.getWriterDept());
		sheet.getRow(7).getCell(2).setCellValue(doc.getWriterName());
		sheet.getRow(8).getCell(2).setCellValue(doc.getWriterJobTitle());

		for (int i = 0; i < Math.min(6, doc.getAdoc_content().length); i++) {
			sheet.getRow(9 + i).getCell(2).setCellValue(doc.getAdoc_content()[i]);
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		sheet.getRow(17).getCell(4).setCellValue(sdf.format(doc.getAdoc_uploadDate()));
		sheet.getRow(18).getCell(5).setCellValue(doc.getWriterName());

		FileOutputStream fileOut = new FileOutputStream("existing-spreadsheet.xlsx");
	    swb.write(fileOut);
	    fileOut.close();

	    // Closing the workbook
	    swb.close();
	}

	}
}
