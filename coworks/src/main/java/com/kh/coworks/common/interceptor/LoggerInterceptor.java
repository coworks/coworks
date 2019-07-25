package com.kh.coworks.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * interceptor클래스는 다른 메소드가 수행하기 전에 먼저 동작하여 특정 코드를 수행하는 클래스이다.
 * 
 * 따라서 특정 요소를 미리 수행하거나, 특정 요소가 수행된 뒤에 
 * 어떠한 행동을 추가로 하고자 할 경우 선언하여 사용할 수 있다.
 * 
 * interceptor를 구현하기 위해 HandlerInterceptorAdapter 클래스를 상속받아
 * 3개의 메소드를 선택하여 구현해야 한다.
 * 
 * 1. preHandle : 원래 수행될 기능 전에 동작할 내용
 * 2. postHandle : 원래 수행할 기능 이후에 동작할 내용
 * 3. afterHandle : 원래 수행될 기능이 완료된 뒤에 동작할 내용
 * 
 * @author cptsu
 *
 */

public class LoggerInterceptor extends HandlerInterceptorAdapter {

	//Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 일반적으로 logger의 기능을 명시하면 레벨에 관련없이 무조건 수행한다.
		// like System.out.println();
		// 하지만, debug 모드가 아닐 경우 debug와 관련된 log는 수행할 필요가 없기 때문에
		// isDebugEnabled()로 디버그 모드인지 확인하여
		// debug모드일 때만 수행하도록 조건을 처리함으로써 
		// log를 남길때 발생하는 시간을 절약할 수 있다.
		//if(logger.isDebugEnabled()) {
		//	logger.debug("=== START ===");
		//	logger.debug(request.getRequestURI());
		//	logger.debug("--------------");
		//}
		
		// 얘를 통해서 실제 처리할 기능이 연결되기때문에  따로 수정하지 않는다.
		// 따라서, 반드시 결과는 true만 나온다.
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//if(logger.isDebugEnabled()) {
		//	logger.debug("--------- view --------");
		//}
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		//if(logger.isDebugEnabled()) {
		//	logger.debug("===== END =====\n");
					
	//	}
		
		super.afterCompletion(request, response, handler, ex);
	}

}
