package com.kh.coworks.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.coworks.board.model.service.BoardService;

@Controller
public class BoardController {
	//js, css, scss로 시작하는거는 ${pageContext.request.contextPath}/resources/templates/resources/ 붙여주면 됩니당!
	
	// BoardServiceImpl 아직 생성 안돼서  @Autowired가 불가능해서 페이지 실행이 안되서 일단 주석처리 했어요
	//@Autowired 
	BoardService boardService;
	
	// 자료실 - 사규(게시판 보기)
	@RequestMapping("/board/companyrulesdatalist.do")
	public String selectCompanyruleslist() {
		return "board/companyruleslist";
	}
	
	// 자료실 - 사규(글쓰기)
	
	// 자료실 - 사규(글쓰기 등록 화면)
	
	// 자료실 - 사규(게시글 한 개 조회)
	
	// 자료실 - 사규(수정 화면)
	
	// 자료실 - 사규(수정 등록)
	
	// 자료실 - 사규(게시글 삭제)
	
	// 자료실 - 사규(파일 한 개 삭제)
	
	

	// 자료실 - 통합자료실 - 업무문서(게시판 보기)
	@RequestMapping("/board/businessdocdatalist.do")
	public String selectBusinessdoc() {
		return "board/businessdoclist";
	}
	
	// 자료실 - 통합자료실 - 업무문서(글쓰기)
	
	// 자료실 - 통합자료실 - 업무문서(글쓰기 등록 화면)
	
	// 자료실 - 통합자료실 - 업무문서(게시글 한 개 조회)
	
	// 자료실 - 통합자료실 - 업무문서(수정 화면)
	
	// 자료실 - 통합자료실 - 업무문서(수정 등록)
	
	// 자료실 - 통합자료실 - 업무문서(게시글 삭제)
	
	// 자료실 - 통합자료실 - 업무문서(파일 한 개 삭제)

	
	
	
	// 자료실 - 통합자료실 - 교육문서(게시판 보기)
	@RequestMapping("/board/empedudocdatalist.do")
	public String selectEmpedudoc() {
		return "board/empedudoclist";
	}
	
	// 자료실 - 통합자료실 - 교육문서(글쓰기)
	
	// 자료실 - 통합자료실 - 교육문서(글쓰기 등록 화면)
	
	// 자료실 - 통합자료실 - 교육문서(게시글 한 개 조회)
	
	// 자료실 - 통합자료실 - 교육문서(수정 화면)
	
	// 자료실 - 통합자료실 - 교육문서(수정 등록)
	
	// 자료실 - 통합자료실 - 교육문서(게시글 삭제)
	
	// 자료실 - 통합자료실 - 교육문서(파일 한 개 삭제)

	
	
	
	// 자료실 - 부서별 자료실(게시판 보기)
	@RequestMapping("/board/deptdocdatalist.do")
	public String selectDeptdoc() {
		return "board/deptdocdatalist";
	}
	
	// 자료실 - 부서별 자료실(글쓰기)
	
	// 자료실 - 부서별 자료실(글쓰기 등록 화면)
	
	// 자료실 - 부서별 자료실(게시글 한 개 조회)
	
	// 자료실 - 부서별 자료실(수정 화면)
	
	// 자료실 - 부서별 자료실(수정 등록)
	
	// 자료실 - 부서별 자료실(게시글 삭제)
	
	// 자료실 - 부서별 자료실(파일 한 개 삭제)

}
