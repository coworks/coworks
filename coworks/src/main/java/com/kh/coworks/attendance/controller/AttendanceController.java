package com.kh.coworks.attendance.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException; 
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coworks.attendance.model.service.AttendanceService;
import com.kh.coworks.attendance.model.vo.Attendance;
import com.kh.coworks.calendar.model.service.CalendarService;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class AttendanceController {
    
   @Autowired 
      private AttendanceService attendanceService;
   @Autowired 
   private CalendarService calendarSerivce;
   
   SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmmss");
   Calendar cal=new GregorianCalendar();
    Time time=new Time(cal.getTimeInMillis());
    Date date=new Date(cal.getTimeInMillis());
    
    //**** 지각 계산
    String str1 = new SimpleDateFormat("yyyyMMdd").format(date); 
    //System.out.println(str2);
    String reqDateStr1=str1+"090000";   //최소 출근시간 기준
    String reqDateStr2=str1+"180000";   //정규 퇴근시작시간
    String reqDateStr3=str1+"070000";   // 출근찍을수있는시간 7시~6시사이!
    

   @RequestMapping("/mypage/attendanceleave.do") 
   public void insertAttendaceLeave(HttpServletRequest request,HttpServletResponse response,@RequestParam() String atten_no,Model model) throws IOException, ParseException { 
      System.out.println("atten_no값 : "+atten_no);
      HttpSession session=request.getSession(false);
      Employee employee=(Employee) session.getAttribute("employee"); 
      ModelAndView mv=new ModelAndView();
      Calendar cal=new GregorianCalendar();
      Attendance attend=new Attendance();
       Time time=new Time(cal.getTimeInMillis());
       Date date=new Date(cal.getTimeInMillis());
        
       //** 조퇴 및 총근무시간 계산
       String str1 = new SimpleDateFormat("yyyyMMdd").format(date);
       String str2 = new SimpleDateFormat("HHmm").format(time);
       
       String reqDateStr=str1+"180000";   //최소 출근시간 기준
        
        
      //현재시간 Date
      java.util.Date curDate = new java.util.Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmmss");
      
      //요청시간을 Date로 parsing 후 time가져오기
      java.util.Date reqDate = dateFormat.parse(reqDateStr2);   // 18:00
      System.out.println("reqDate : "+reqDate);
      long reqDateTime = reqDate.getTime();
      System.out.println("longreqDate : "+reqDateTime);
      //현재시간을 요청시간의 형태로 format 후 time 가져오기
      curDate = dateFormat.parse(dateFormat.format(curDate));
      
      long curDateTime = curDate.getTime();
      System.out.println("curDate : "+curDateTime);
      //분으로 표현
      if(curDateTime<reqDateTime) {
      long hour= (reqDateTime-curDateTime) / (1000*60*60);
      long minute = (reqDateTime-curDateTime) / 60000-(hour*60);
      long second=(reqDateTime-curDateTime) / 1000-((hour*60*60)+(minute*60));
      String leaveEarly=String.format("%02d:%02d:%02d", hour,minute,second); 
         attend.setAtten_leaveEarly(leaveEarly);
      }else {
         attend.setAtten_leaveEarly(null);   
      }
       
       
      
       
      attend.setAtten_leaveIP(request.getRemoteAddr());   
      attend.setEmp_no(employee.getEmp_no());   //나중에 세션에서 받아오기
      attend.setAtten_leaveTime(time);    // 퇴근찍은 시간    
      int no=Integer.parseInt(atten_no);
      attend.setAtten_no(no); 
      Attendance list =attendanceService.selectOneAttendance(employee.getEmp_no());
      
      // 총 근무시간
      Date datee=new Date(cal.getTimeInMillis());
      
       //**** 지각 계산
       String hourstr = new SimpleDateFormat("yyyyMMdd").format(datee);
       
       System.out.println(reqDateStr);

       String all2 = new SimpleDateFormat("HHmmss").format(list.getAtten_attTime().getTime());
       String a= hourstr+all2;
        
         System.out.println("");
         //요청시간을 Date로 parsing 후 time가져오기
         java.util.Date hours = dateFormat.parse(a); 
         long atten_attTime = hours.getTime();
         //System.out.println("longatten_hours는??"+atten_hours);
         
         java.util.Date current = dateFormat.parse(dateFormat.format(curDate));
         long atten_leaveTime = current.getTime();
         
       
         //요청시간을 Date로 parsing 후 time가져오기
         java.util.Date reqDate1 = dateFormat.parse(reqDateStr1);
         java.util.Date reqDate2 = dateFormat.parse(reqDateStr2);
         java.util.Date reqDate3 = dateFormat.parse(reqDateStr3);
         System.out.println("reqDate : "+reqDate1);
         long reqDateTime1 = reqDate1.getTime();   // 9시
         long reqDateTime2 = reqDate2.getTime(); // 18시
         long reqDateTime3 = reqDate3.getTime(); // 7시   
         
         
      if(reqDateTime3<atten_leaveTime && reqDateTime1>atten_leaveTime) {   // 7시~9시이전 퇴근이면
         attend.setAtten_hours(null);   //총 근무시간 안찍힘!!!!!!
      }else if(atten_leaveTime-atten_attTime>0) {   // 출근시간-근무시간>0
         long hour= (atten_leaveTime-atten_attTime) / (1000*60*60);
         long minute = (atten_leaveTime-atten_attTime) / 60000-(hour*60);
         long second=(atten_leaveTime-atten_attTime) / 1000-((hour*60*60)+(minute*60));
          
         String hours2=String.format("%02d:%02d:%02d", hour,minute,second);
          
            attend.setAtten_hours(hours2);
      }
           
      int result=attendanceService.updateAttendanceLeave(attend); 
      
      response.getWriter().print(true);
      
   
   }
   
   @RequestMapping("/mypage/attendanceview.do")
   public ModelAndView selectListAttendance(HttpServletRequest request) {
       ModelAndView mv=new ModelAndView();
      HttpSession session=request.getSession(false);
      Employee employee=(Employee) session.getAttribute("employee");
      
      List<Attendance> list=attendanceService.selectListAttendance(employee.getEmp_no());
      
      mv.addObject("select_date","날짜 선택");
      mv.addObject("list",list);
      mv.setViewName("mypage/attendancetable");
      return mv;
   }
   
    
     @RequestMapping("/attendance/selectTypeAttendance.do") 
     public ModelAndView selectOneAttendance(HttpServletRequest request,@RequestParam("select_date") String select_date ) throws ParseException { 
        ModelAndView mv=new ModelAndView(); 
        HttpSession session=request.getSession(false); 
        Employee employee=(Employee) session.getAttribute("employee");
         
        
        String year=select_date.substring(2,4);
        int y=Integer.parseInt(year);
        String month=select_date.substring(6,8);
        int m=Integer.parseInt(month); 
        String date1="20"+year+month+"01";  
        Attendance attend=new Attendance();
        attend.setEmp_no(employee.getEmp_no());
        
        // uilt.Date를 sql.Date로 변경
        SimpleDateFormat dt = new SimpleDateFormat("yyyyMMdd"); 
        java.util.Date date = dt.parse(date1);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
       // DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
      //     System.out.println("dateFormated date is : " + df.format(utilDate));
        attend.setAtten_date(sqlDate); 
            
        List<Attendance> list=attendanceService.selectTypeAttendance(attend);
    mv.addObject("select_date",select_date);
     mv.addObject("list",list); 
     mv.setViewName("mypage/attendancetable");
     return mv; 
     
     }


 
}