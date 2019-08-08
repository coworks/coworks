package com.kh.coworks.calendar.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		

		HttpSession session = request.getSession(false);
		Employee employee=(Employee) session.getAttribute("employee");
	
		Calendar cal=new Calendar();
		HashMap<String,String> hmap=new HashMap<>();
		hmap.put("emp_no",Integer.toString(employee.getEmp_no()));
		hmap.put("dept_code",employee.getDept_code());
		
		 
		List<Calendar> list = calService.selectListAllCalendar(hmap);	
		
		 
		mv.addObject("list", list);
		mv.setViewName("calendar/app-calendar");
		return mv;
	}
	
	 
	@RequestMapping("/calendar/selectListCalendar.do")
	public ModelAndView selectListAllCalendar(HttpServletRequest request ,@RequestParam String cal_type,ModelAndView mv, HttpSession session) {
		Employee employee=(Employee) request.getSession().getAttribute("employee");
		String emp_no= Integer.toString(employee.getEmp_no());
		
		 
		Calendar cal=new Calendar();
		// 나중에 11에  emp_no 세션받아서 보내야함
		if(cal_type.equals("부서")) {
			cal.setCal_holder(employee.getDept_code());	// 부서코드 넣기 나중에수정
		}else {
			cal.setCal_holder(emp_no);	 
		}
		cal.setCal_type(cal_type);
		
		
		List<Calendar> list=calService.selectListCalendar(cal);
		 
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
			calendar.setCal_holder(employee.getDept_code());	// 부서코드 넣기 나중에수정
		}else {
			calendar.setCal_holder(Integer.toString(employee.getEmp_no()));	// 사용자 고유 번호 넣기
		}
		
		 
		int insertCalendar = calService.insertCalendar(calendar);
			
		
 
		
		mv.setViewName("redirect:/calendar/calendarview.do");
		
			 
		return mv;
	}
	
	@RequestMapping("/calendar/insertCalendar2.do")
	public void insertCalendar2(@ModelAttribute Calendar calendar, HttpServletResponse resp,HttpServletRequest request) throws IOException {
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘..
		
		
		
 
		calendar.setCal_content("내용없음");
		
		calendar.setCal_type("개인");
		calendar.setCal_holder(Integer.toString(employee.getEmp_no()));// 아직 부서 설정안했기때문에  null값이라 emp_no넣어줘야함
		//if(employee!=null) 
			boolean result = calService.insertCalendar(calendar)>0?true:false;
		
		 
		
		
		resp.getWriter().print(result);
	}
	
	@RequestMapping("/calendar/deleteCalendar.do")
	public void deleteCalendar(@RequestParam("cal_no") int cal_no, HttpServletResponse resp,HttpServletRequest request) throws IOException{
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘..
		
		boolean result = calService.deleteCalendar(cal_no)>0?true:false;
		
		 
		resp.getWriter().print(result);
		
	}
	
 
	 
	@RequestMapping("/calendar/updateCalendar.do")
	public void updateCalendar(@RequestParam(value="cal_no",  required = true) int cal_no,  
			@RequestParam(value="cal_begindate",  required = true) String cal_beginDate, 
			@RequestParam(value="cal_enddate",  required = true) String cal_endDate, HttpServletRequest request,HttpServletResponse resp) throws IOException {
		
		Employee employee=(Employee) request.getSession().getAttribute("employee"); //안쓸삘
		
		
		 Timestamp ts1=java.sql.Timestamp.valueOf(cal_beginDate);	 
		 Timestamp ts2=java.sql.Timestamp.valueOf(cal_endDate);
		 
		 
		 
		
			 
			 
		Calendar cal=new Calendar();
		 cal.setCal_no(cal_no);
		 cal.setCal_beginDate(ts1);
		 cal.setCal_endDate(ts2);
		  
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