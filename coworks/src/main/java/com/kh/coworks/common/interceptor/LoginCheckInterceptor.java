package com.kh.coworks.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.coworks.employee.model.vo.Employee;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	// 이 클래스를 통해서 사용자가 로그인한 사용자인지 확인하는
	// 인터셉터를 구현한다. 
	
	//Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		Employee e=(Employee)session.getAttribute("employee");
		
		if(e==null) {	//로그인 안했다면
			//logger.info("비 로그인 상태에서 ["+request.getRequestURI()+"] 경로에 접속 시도하였음!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후 이용하세요.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
			
		}
		

		
		return super.preHandle(request, response, handler);
	}

	
	
}
