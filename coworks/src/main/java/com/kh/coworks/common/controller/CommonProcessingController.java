package com.kh.coworks.common.controller;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coworks.attendance.model.service.AttendanceService;
import com.kh.coworks.attendance.model.vo.Attendance;
import com.kh.coworks.calendar.model.service.CalendarService;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.survey.model.service.SurveyServiceImpl;
import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;
import com.kh.coworks.survey.model.vo.SurveyApply;
import com.kh.coworks.todo.model.service.TodoService;
import com.kh.coworks.todo.model.vo.Todo;

@Controller
public class CommonProcessingController {

	@Autowired
	private CalendarService calendarservice;

	@Autowired
	private AttendanceService attendanceService;

	@Autowired
	private CalendarService calendarService;

	@Autowired
	TodoService todoService;

	@Autowired
	private SurveyServiceImpl surveyService;

	@RequestMapping("/commonProcessing.do")
	public ModelAndView indexProcessing(HttpServletRequest request, Model model)
			throws ParseException, UnknownHostException {

		Employee employee = (Employee) request.getSession().getAttribute("employee");
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmmss");
		Calendar cal = new GregorianCalendar();
		Time time = new Time(cal.getTimeInMillis());
		Date date = new Date(cal.getTimeInMillis());

		ModelAndView mv = new ModelAndView();
		Attendance attend = new Attendance();

		// todo부분 →
		Todo todo = new Todo();
		todo.setEmp_no(employee.getEmp_no());
		todo.setTodo_status(0);

		ArrayList<Map<String, String>> todolist = new ArrayList<Map<String, String>>(todoService.selectTodolist(todo));
		mv.addObject("todoList", todolist);
		// ← todo부분

		// 현재시간 Date
		java.util.Date curDate = new java.util.Date();

		// 요청시간을 Date로 parsing 후 time가져오기
		java.util.Date reqDate1 = dateFormat.parse(new SimpleDateFormat("yyyyMMdd").format(date) + "090000");
		java.util.Date reqDate2 = dateFormat.parse(new SimpleDateFormat("yyyyMMdd").format(date) + "180000");
		java.util.Date reqDate3 = dateFormat.parse(new SimpleDateFormat("yyyyMMdd").format(date) + "070000");

		long reqDateTime1 = reqDate1.getTime(); // 9시
		long reqDateTime2 = reqDate2.getTime(); // 18시
		long reqDateTime3 = reqDate3.getTime(); // 7시

		// 현재시간을 요청시간의 형태로 format 후 time 가져오기
		curDate = dateFormat.parse(dateFormat.format(curDate));
		long curDateTime = curDate.getTime();

		// 분으로 표현 (직원이 출근한 시간대는 07:00~ 18:00 사이어야함)
		if (curDateTime > reqDateTime1 && curDateTime < reqDateTime2) {
			long hour = (curDateTime - reqDateTime1) / (1000 * 60 * 60);
			long minute = (curDateTime - reqDateTime1) / 60000 - (hour * 60);
			long second = (curDateTime - reqDateTime1) / 1000 - ((hour * 60 * 60) + (minute * 60));
			String attLate = String.format("%02d:%02d:%02d", hour, minute, second);

			attend.setAtten_attLate(attLate);
			attend.setAtten_attTime(time);

		} else if (reqDateTime3 < curDateTime) {
			attend.setAtten_attLate(null);
			attend.setAtten_attTime(time);
		} else {

			attend.setAtten_attLate(null);
			attend.setAtten_attTime(null);
		}
		// ************

		// ip받아오기

		attend.setAtten_attIP(request.getRemoteAddr()); // 나중에 세션 ip 받아오기
		attend.setEmp_no(employee.getEmp_no()); // 나중에 세션에서 받아오기
		// attend.setAtten_attTime(time);
		attend.setAtten_date(date);
		int result = 0;
		if (reqDateTime3 < curDateTime && reqDateTime2 > curDateTime) {
			result = attendanceService.insertAttendanceCome(attend);
		}
		Attendance list = attendanceService.selectOneAttendance(employee.getEmp_no());

		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("emp_no", Integer.toString(employee.getEmp_no()));
		hmap.put("dept_code", employee.getDept_code());
		// 나중에 수정해야함 꼮!!! calendar list뽑기
		hmap.put("company","회사");

		List<com.kh.coworks.calendar.model.vo.Calendar> calendar = calendarService.selectListAllCalendar(hmap);

		// index page 설문가져오기
		Survey survey = surveyService.selectOneSurvey();
		mv.addObject("survey", survey);
		if (survey != null) {
			List<SurveyAnswer> surveyAnswerList = surveyService.selectOneSurveyAnswer(survey.getSurvey_no());
			Map<String, String> surhmap = new HashMap<>();
			surhmap.put("emp_no", Integer.toString(employee.getEmp_no()));
			surhmap.put("survey_no", Integer.toString(survey.getSurvey_no()));

			SurveyApply surveyApply = surveyService.selectOneSurveyApply(surhmap);
			mv.addObject("salist", surveyAnswerList);
			mv.addObject("surveyApply", surveyApply);
		}
		
		mv.addObject("atten", list); // index에 출근시간, ip시간 보여주기!!!! 나중에~~~
		mv.addObject("list", calendar);

		
		mv.setViewName("../index");

		return mv;
	}

}
