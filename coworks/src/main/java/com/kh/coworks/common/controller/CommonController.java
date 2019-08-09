package com.kh.coworks.common.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.attendance.model.service.AttendanceService; 
import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.calendar.model.service.CalendarService;
import com.kh.coworks.employee.model.exception.EmployeeException;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class CommonController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value="/common/goLogin.do", method=RequestMethod.POST)
   public ModelAndView goLogin(HttpServletRequest request,Model model,@RequestParam int emp_no, HttpSession session,@RequestParam String emp_password) throws EmployeeException{
      
      ModelAndView mv=new ModelAndView();

      
      try {
      Employee e=employeeService.selectOneEmployee(emp_no);
      Authority au=employeeService.selectOneAuthority(emp_no);
      
      
      String rawPassword=emp_password;   // 암호화x 나중에 암호화 할것임돠
      
      
      //e.setEmp_password(bcryptPasswordEncoder.encode(rawPassword)); // 나중에~
      
      System.out.println("사용자 :"+e);
      
      //System.out.println("암호화 후 : "+e.getEmp_password());   // 나중에~~
      
      String loc="/";
      String msg="";
      
      
      if(e ==null) {
         msg="없는 사용자입니다.";
         
         loc="/";
      }else {
         // 3. 회원이 로그인에 사용한 비밀번호와 원래 저장되어있던 비밀번호확인
         if(e.getEmp_password().equals(emp_password)) {
         //if(bcryptPasswordEncoder.matches(emp_password, e.getEmp_password())) {   // 비밀번호 암호화 후 추가예정
            msg="로그인 성공!";
            session.setAttribute("employee",e);
            session.setAttribute("authority",au);
             
    		loc="/commonProcessing.do";
          }else {
             msg="비밀번호가 일치하지 않습니다!";
             loc="/";
          } 
      }    
      mv.addObject("loc",loc);
      mv.addObject("msg",msg);
       
      
      // 화면 전달을 위한 viewName 등록하기
      mv.setViewName("common/msg");
      }catch(Exception e) {
         throw new EmployeeException("로그인 에러 : "+e.getMessage());
       }
      
      
      
      return mv;
   }

	@RequestMapping("/logout.do")
	public String employeeLogout(HttpServletRequest request, SessionStatus sessionStatus) {

		request.getSession().removeAttribute("employee");
		// sessionStatus.setComplete(); // 세션끝내기

		return "redirect:/";
	}

	@RequestMapping("/common/gomain.do")
	public ModelAndView gomain(HttpServletRequest request, SessionStatus sessionStatus) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		ModelAndView mv = new ModelAndView();

		String loc = "/";
		String msg = "";

		if (employee != null) {
			mv.setViewName("redirect:/commonProcessing.do");
		} else {
			msg = "로그인 후 이용 가능합니다";
			mv.addObject("loc", loc);
			mv.addObject("msg", msg);
 

			// 화면 전달을 위한 viewName 등록하기
			mv.setViewName("common/msg");
		}

		return mv;
	}

}
