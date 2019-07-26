package com.kh.coworks.board.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.coworks.board.model.service.BoardService;
import com.kh.coworks.board.model.vo.Board;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class BoardController {
	//js, css, scss로 시작하는거는 ${pageContext.request.contextPath}/resources/templates/resources/ 붙여주면 됩니당!
	
	// BoardServiceImpl 아직 생성 안돼서  @Autowired가 불가능해서 페이지 실행이 안되서 일단 주석처리 했어요
	@Autowired 
	BoardService boardService;
	
	
	///////////////////////////////////////////////////////////(documentboard폴더)
	
	// (게시판 보기)
	@RequestMapping(value="/documentboard/{boardCode}",method=RequestMethod.GET)
	public String selectBusinessdoc(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@PathVariable("boardCode") String boardCode,
			Model model) {
		
		int limit = 10;
		
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(boardService.selectBusinessdoc(cPage, limit, boardCode));
		
		int totalContents = boardService.selectBusinessdocTotalContents(boardCode);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "businessdoclist.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar)
		.addAttribute("bo_code", boardCode);
		
		return "documentboard/businessdoclist";
	}
	
	// (글쓰기)
	@RequestMapping("documentboard/businessdocForm.do")
	public String insertBusinessdoc() {
		return "documentboard/businessdocForm";
	}
	
	// (글쓰기 등록)
	
	// (게시글 한 개 조회)
	@RequestMapping(value="/documentboard/{boardCode}/{boardNo}", method=RequestMethod.GET)
	public String selectOnebusinessdocdetail(
			@PathVariable("boardCode") String boardCode,
			@PathVariable("boardNo") int boardNo,
			Model model) {
		
		
		Board b = new Board();
		b.setBo_code(boardCode);
		b.setBo_no(boardNo);
		

		model.addAttribute("board", boardService.selectOnebusinessdocdetail(b))
		.addAttribute("attachmentList", boardService.selectBusinessdocAttachList(b))
		.addAttribute("bo_code", boardCode);
		
		
		return "documentboard/businessdocdetail";
	}
	
	// (수정 하기 위해 값 가져오기 - 수정 화면)
	@RequestMapping(value="/documentboard/{boardCode}/{boardNo}/{bo_emp_no}", method=RequestMethod.GET)
	public String updateBusinessdocview(
			@PathVariable("boardCode") String boardCode,
			@PathVariable("boardNo") int boardNo,
			@PathVariable("bo_emp_no") int bo_emp_no,
			Model model) {
		
		Board b = new Board();
		b.setBo_code(boardCode);
		b.setBo_no(boardNo);
		b.setEmp_no(bo_emp_no);
		
		model.addAttribute("board", boardService.selectOnebusinessdocdetail(b))
		.addAttribute("attachmentList", boardService.selectBusinessdocAttachList(b));
		
		
		return "documentboard/businessdocUpdateView";
	}
	
	// (수정 등록)
	
	// (게시글 삭제)
	
	// (파일 한 개 삭제)

	/*
	@RequestMapping("/mypage/attendanceview.do")
	   public ModelAndView selectListAttendance(HttpServletRequest request) {
	       ModelAndView mv=new ModelAndView();
	      HttpSession session=request.getSession(false);
	      Employee employee=(Employee) session.getAttribute("employee");
	      
	      List<Attendance> list=attendanceService.selectListAttendance(employee.getEmp_no());
	      
	      mv.addObject("list",list);
	      mv.setViewName("mypage/attendancetable");
	      return mv;
	   }
	*/

}
