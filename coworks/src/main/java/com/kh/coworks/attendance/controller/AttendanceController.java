package com.kh.coworks.attendance.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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


   
   @RequestMapping("/attendancecome.do") 
   public ModelAndView insertAttendaceCome( HttpServletRequest request,Model model) { 
      HttpSession session=request.getSession(false);
      Employee employee=(Employee) session.getAttribute("employee");
       ModelAndView mv=new ModelAndView();
      System.out.println("세션값 : "+session);
      System.out.println("세션객체 : "+employee);
      Calendar cal=new GregorianCalendar();
      Attendance attend=new Attendance();
       Time time=new Time(cal.getTimeInMillis());
       Date date=new Date(cal.getTimeInMillis());
      //2019-07-03 19:30:00.0
       String ip = request.getHeader("Proxy-Client-IP");
           if (ip == null)
               ip = request.getRemoteAddr();
           
       
       System.out.println("ip :" +ip);
      attend.setAtten_attIP(ip);   //나중에 세션 ip 받아오기
      attend.setEmp_no(employee.getEmp_no());   //나중에 세션에서 받아오기
      attend.setAtten_attTime(time);
       attend.setAtten_date(date);
       
      int result=attendanceService.insertAttendanceCome(attend);

      List<com.kh.coworks.calendar.model.vo.Calendar> calendar=calendarSerivce.selectListAllCalendar(employee.getEmp_no());
       
      mv.addObject("atten",attend);   // index에 출근시간, ip시간 보여주기!!!! 나중에~~~
      mv.addObject("calendar",calendar); 
      
      mv.setViewName("../index");
     return mv;
   
   }
   
   
   
   @RequestMapping("/mypage/attendanceleave.do") 
   public String insertAttendaceLeave(HttpServletRequest request,Model model) { 
      Calendar cal=new GregorianCalendar();
      Attendance attend=new Attendance();
       Time time=new Time(cal.getTimeInMillis());
       Date date=new Date(cal.getTimeInMillis());
      //2019-07-03 19:30:00.0 -->형식
      attend.setAtten_attIP("192.111.333");   //나중에 세션 ip 받아오기
      attend.setEmp_no(1);   //나중에 세션에서 받아오기
      attend.setAtten_leaveTime(time);    // 퇴근찍은 시간
       
      int result=attendanceService.updateAttendanceLeave(attend);
      
      
     return "common/index";
   
   }
    

}