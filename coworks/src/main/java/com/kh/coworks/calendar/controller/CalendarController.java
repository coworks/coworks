package com.kh.coworks.calendar.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

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

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calService;
	
	
	@RequestMapping("/calendar/calendarview.do")
	public ModelAndView selectListAllCalendar(ModelAndView mv, HttpSession session) {
		// 나중에 세션으로 사용자 아이디 받아서 검색... => 현재는 1로 고정(임시)
		System.out.println("넘어가나?");
		List<Calendar> list = calService.selectListAllCalendar(1);	
		
		System.out.println("select 확인" +list);
		mv.addObject("list", list);
		mv.setViewName("calendar/app-calendar");
		return mv;
	}
	
	 
	@RequestMapping("/calendar/selectListCalendar.do")
	public ModelAndView selectListAllCalendar(@RequestParam String cal_type,ModelAndView mv, HttpSession session) {
		// 세션 아이디와 사내,부서,개인인지 선택받은것 불러오기
		
		System.out.println("cal_Type 검색 : "+cal_type);
		Calendar cal=new Calendar();
		// 나중에 11에  emp_no 세션받아서 보내야함
		if(cal_type.equals("부서")) {
			cal.setCal_holder("a1");	// 부서코드 넣기
		}else {
			cal.setCal_holder("1");	// 사용자 고유 번호 넣기
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
	public ModelAndView insertCalendar(Calendar calendar,ModelAndView mv,HttpSession session) throws CalendarException {
		System.out.println("Calendar 확인 : "+calendar);
			
		/*
		 * if(calendar.getCal_type().equals("부서")) { int
		 * selectOne=calService.selectOneCalendar(1); // 부서번호 }
		 */ 
				int insertCalendar = calService.insertCalendar(calendar);
			
		

		System.out.println("insert 캘린더 결과 : "+calendar);
		
		mv.setViewName("redirect:/calendar/calendarview.do");
		
			 
		return mv;
	}
	
	@RequestMapping("/calendar/deleteCalendar.do")
	public void deleteCalendar(@RequestParam("cal_no") int cal_no, HttpServletResponse resp) throws IOException{
		boolean result = calService.deleteCalendar(cal_no)>0?true:false;
		
		System.out.println("delete 캘린더 결과 : "+result);
		
		
		resp.getWriter().print(result);
		 
	}
	
 
	 
	@RequestMapping("/calendar/updateCalendar.do")
	public void updateCalendar(@RequestParam(value="cal_no",  required = true) int cal_no,  
			@RequestParam(value="cal_begindate",  required = true) String cal_beginDate, 
			@RequestParam(value="cal_enddate",  required = true) String cal_endDate, HttpSession session,HttpServletResponse resp) throws IOException {
		
		
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
	public void updateCalendar2(@ModelAttribute Calendar calendar, HttpSession session,HttpServletResponse resp) throws IOException {

		 
		 
	 int result=calService.updateCalendar2(calendar);
		  
	
			resp.getWriter().print(false);
		
		 
	}
	

	
}