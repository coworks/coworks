 
package com.kh.coworks.pay.controller;
 
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.kh.coworks.employee.model.vo.Employee;
 
 
public class ExcelWrite {
    /*
    public void xlsWiter(List<Employee> list , HttpServletRequest request) {
        // 워크북 생성
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 워크시트 생성
        HSSFSheet sheet = workbook.createSheet();
        // 행 생성
        HSSFRow row = sheet.createRow(0);
        // 쎌 생성
        HSSFCell cell;
         
        // 헤더 정보 구성
        cell = row.createCell(0);
        cell.setCellValue("사원번호");
        
        cell = row.createCell(1);
        cell.setCellValue("사원이름");
        
        cell = row.createCell(2);
        cell.setCellValue("직책");
        
        cell = row.createCell(3);
        cell.setCellValue("기본급");

        
        cell = row.createCell(4);
        cell.setCellValue("직책수당");

        
        cell = row.createCell(5);
        cell.setCellValue("연장수당");

        
        cell = row.createCell(6);
        cell.setCellValue("휴일수당");

        
        cell = row.createCell(7);
        cell.setCellValue("상여금");

        
        cell = row.createCell(8);
        cell.setCellValue("식대");

        
        cell = row.createCell(9);
        cell.setCellValue("교통비");

        
        cell = row.createCell(10);
        cell.setCellValue("복지후생");

        
        cell = row.createCell(11);
        cell.setCellValue("급여계");

        
        cell = row.createCell(12);
        cell.setCellValue("소득세");

        
        cell = row.createCell(13);
        cell.setCellValue("주민세");

        
        cell = row.createCell(14);
        cell.setCellValue("고용보험");

        
        cell = row.createCell(15);
        cell.setCellValue("국민연금");

        
        cell = row.createCell(16);
        cell.setCellValue("건강보험");

        
        cell = row.createCell(17);
        cell.setCellValue("기타");

        
        cell = row.createCell(18);
        cell.setCellValue("공제계");

        
        cell = row.createCell(19);
        cell.setCellValue("차감 수령액");
        
        // 리스트의 size 만큼 row를 생성
        Employee emp;
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
        	emp = list.get(rowIdx);
            
            // 행 생성
            row = sheet.createRow(rowIdx+1);
            
            cell = row.createCell(0);
            cell.setCellValue(emp.getEmp_no());
            
            cell = row.createCell(1);
            cell.setCellValue(emp.getEmp_name());
            
            cell = row.createCell(2);
            cell.setCellValue(emp.getJob_title());
            
            
        }
        
        // 입력된 내용 파일로 쓰기
		HttpSession session = request.getSession();
        String saveDir = session.getServletContext().getRealPath("/resources/pay/payroll");
        File file = new File(saveDir+"/testWrite1.xls");
//        File file = new File("C:\\excel\\testWrite.xls");
        FileOutputStream fos = null;
        
        try {
            fos = new FileOutputStream(file);
            workbook.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(workbook!=null) workbook.close();
                if(fos!=null) fos.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }*/
    
    public String xlsxWiter(List<Employee> list, HttpServletRequest request,String paydate) {
        // 워크북 생성
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 워크시트 생성
        XSSFSheet sheet = workbook.createSheet();
        // 행 생성
        XSSFRow row = sheet.createRow(0);
        // 쎌 생성
        XSSFCell cell;

        String y = paydate.substring(0,4);
        String m = paydate.substring(5,7);
        String d = paydate.substring(8,10);
        cell = row.createCell(0);
        cell.setCellValue("급여 년도");

        cell = row.createCell(1);
        cell.setCellValue(y);
        
        cell = row.createCell(2);
        cell.setCellValue("급여 월");
        cell = row.createCell(3);
        cell.setCellValue(m);
        
        cell = row.createCell(4);
        cell.setCellValue("급여 일");
        cell = row.createCell(5);
        cell.setCellValue(d);

        row = sheet.createRow(1);
        // 헤더 정보 구성
        cell = row.createCell(0);
        cell.setCellValue("사원번호");
        
        cell = row.createCell(1);
        cell.setCellValue("사원이름");
        
        cell = row.createCell(2);
        cell.setCellValue("직책");
        
        cell = row.createCell(3);
        cell.setCellValue("기본급");

        
        cell = row.createCell(4);
        cell.setCellValue("직책수당");

        
        cell = row.createCell(5);
        cell.setCellValue("연장수당");

        
        cell = row.createCell(6);
        cell.setCellValue("휴일수당");

        
        cell = row.createCell(7);
        cell.setCellValue("상여금");

        
        cell = row.createCell(8);
        cell.setCellValue("식대");

        
        cell = row.createCell(9);
        cell.setCellValue("교통비");

        
        cell = row.createCell(10);
        cell.setCellValue("복지후생");

        
        cell = row.createCell(11);
        cell.setCellValue("급여계");

        
        cell = row.createCell(12);
        cell.setCellValue("소득세");

        
        cell = row.createCell(13);
        cell.setCellValue("주민세");

        
        cell = row.createCell(14);
        cell.setCellValue("고용보험");

        
        cell = row.createCell(15);
        cell.setCellValue("국민연금");

        
        cell = row.createCell(16);
        cell.setCellValue("건강보험");

        
        cell = row.createCell(17);
        cell.setCellValue("기타");

        
        cell = row.createCell(18);
        cell.setCellValue("공제계");

        
        cell = row.createCell(19);
        cell.setCellValue("차감 수령액");
        
        // 리스트의 size 만큼 row를 생성
        Employee emp;

        
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
            emp = list.get(rowIdx);
            
            // 행 생성
            row = sheet.createRow(rowIdx+2);
            cell = row.createCell(0);
            cell.setCellValue(emp.getEmp_no());
            
            cell = row.createCell(1);
            cell.setCellValue(emp.getEmp_name());
            
            cell = row.createCell(2);
            cell.setCellValue(emp.getDept_name());
            
            cell = row.createCell(3);
            cell.setCellValue(emp.getJob_title());

			/*
			  cell = row.createCell(11);
			  cell.setCellFormula("=SUM(D"+rowNum+":K"+rowNum+")");
			  cell = row.createCell(18);
			  cell.setCellFormula("=SUM(M"+rowNum+":R"+rowNum+")");
			  cell = row.createCell(19);
			  cell.setCellFormula("=SUM(D"+rowNum+":K"+rowNum+")-S"+rowNum);
			 */
        }
        row = sheet.createRow(list.size()+2);
        cell = row.createCell(0);
        cell.setCellValue("합계");
        
		HttpSession session = request.getSession();
        String saveDir = session.getServletContext().getRealPath("/resources/pay/payroll");
        File file = new File(saveDir+"/"+y+m+d+"_급여명세서.xls");
//        File file = new File("C:\\excel\\testWrite.xls");
        FileOutputStream fos = null;
        // 입력된 내용 파일로 쓰기
        
        try {
            fos = new FileOutputStream(file);
            workbook.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(workbook!=null) workbook.close();
                if(fos!=null) fos.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return file.getAbsolutePath();
    }
}


