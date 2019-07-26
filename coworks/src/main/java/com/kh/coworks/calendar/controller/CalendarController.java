package com.kh.coworks.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import com.kh.coworks.calendar.model.exception.CalendarException;
import com.kh.coworks.calendar.model.service.CalendarService;
import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.employee.model.vo.Employee; 

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calService;
	
	
	@RequestMapping("/calendar/calendarview.do")
	public ModelAndView selectListAllCalendar(ModelAndView mv,HttpServletRequest request) {
		
		
		Employee employee=(Employee) request.getSession().getAttribute("employee");
		System.out.println("세션값 : "+employee);
		System.out.println("아이디 : "+employee.getEmp_no());
		
		 
		System.out.println("넘어가나?");
		List<Calendar> list = calService.selectListAllCalendar(employee.getEmp_no());	
		
		System.out.println("select 확인" +list);
		mv.addObject("list", list);
		mv.setViewName("calendar/app-calendar");
		return mv;
	}
	
	 
	@RequestMapping("/calendar/selectListCalendar.do")
	public ModelAndView selectListAllCalendar(HttpServletRequest request ,@RequestParam String cal_type,ModelAndView mv, HttpSession session) {
		Employee employee=(Employee) request.getSession().getAttribute("employee");
		String emp_no= Integer.toString(employee.getEmp_no());
		
		System.out.println("cal_Type 검색 : "+cal_type);
		Calendar cal=new Calendar();
		// 나중에 11에  emp_no 세션받아서 보내야함
		if(cal_type.equals("부서")) {
			cal.setCal_holder("1");	// 부서코드 넣기 나중에수정
		}else {
			cal.setCal_holder(emp_no);	 
		}
		cal.setCal_type(cal_type);
		
		
		List<Calendar> list=calService.selectListCalendar(cal);
		System.out.println("받아온 list확인 : "+list);
		
		mv.addObject("list", list);
		mv.setViewName("calendar/app-calendar");
		return mv;
	}
	
	 
	
	// delete insert update -> ajax로 할건지는 나중에생각하기
	
	@RequestMapping("/calendar/insertCalendar.do")
	public ModelAndView insertCalendar(Calendar calendar,ModelAndView mv,HttpServletRequest request) throws CalendarException {
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸듯..
		 
		// 나중에 11에  emp_no 세션받아서 보내야함
		if((calendar.getCal_type()).equals("부서")) {
			calendar.setCal_holder("1");	// 부서코드 넣기 나중에수정
		}else {
			calendar.setCal_holder(Integer.toString(employee.getEmp_no()));	// 사용자 고유 번호 넣기
		}
		
		System.out.println("Calendar 확인 : "+calendar);
			
		 
				int insertCalendar = calService.insertCalendar(calendar);
			
		

		System.out.println("insert 캘린더 결과 : "+calendar);
		
		mv.setViewName("redirect:/calendar/calendarview.do");
		
			 
		return mv;
	}
	
	@RequestMapping("/calendar/deleteCalendar.do")
	public void deleteCalendar(@RequestParam("cal_no") int cal_no, HttpServletResponse resp,HttpServletRequest request) throws IOException{
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘..
		
		//if(employee!=null) 
			boolean result = calService.deleteCalendar(cal_no)>0?true:false;
		
		System.out.println("delete 캘린더 결과 : "+result);
		
		
		resp.getWriter().print(result);
		
	}
	
 
	 
	@RequestMapping("/calendar/updateCalendar.do")
	public void updateCalendar(@RequestParam(value="cal_no",  required = true) int cal_no,  
			@RequestParam(value="cal_begindate",  required = true) String cal_beginDate, 
			@RequestParam(value="cal_enddate",  required = true) String cal_endDate, HttpServletRequest request,HttpServletResponse resp) throws IOException {
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘
		
		
		 Timestamp ts1=java.sql.Timestamp.valueOf(cal_beginDate);	 
		 Timestamp ts2=java.sql.Timestamp.valueOf(cal_endDate);
		 
		 System.out.println("시작 : " + ts1);
		 System.out.println("끝 : " + ts2);
		 
		
			 
			 
		Calendar cal=new Calendar();
		 cal.setCal_no(cal_no);
		 cal.setCal_beginDate(ts1);
		 cal.setCal_endDate(ts2);
		 
		 System.out.println("cal : "+cal);
		 
		int result=calService.updateCalendar(cal);
		  
			
		 
			
			
			resp.getWriter().print(true);
		
		 
	}
	
	@RequestMapping("/calendar/updateCalendar2.do")
	@ResponseBody
	public void updateCalendar2(@ModelAttribute Calendar calendar, HttpServletRequest request,HttpServletResponse resp) throws IOException {

		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘
		 
		 //업데이트할 자료 확인
		System.out.println("업데이트할자료 2 : "+calendar);
		int result=calService.updateCalendar2(calendar);
		  
	
			resp.getWriter().print(false);
		
		 
	}
	

	
}