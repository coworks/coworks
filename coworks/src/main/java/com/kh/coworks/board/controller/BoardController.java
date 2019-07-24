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
	
	
	///////////////////////////////////////////////////////////자료실(documentboard폴더)
	
	// 자료실 - 통합자료실 - 업무문서(게시판 보기)
	@RequestMapping("/documentboard/businessdoclist.do")
	public String selectBusinessdoc() {
		return "documentboard/businessdoclist";
	}
	
	// 자료실 - 통합자료실 - 업무문서(글쓰기)
	@RequestMapping("documentboard/businessdocForm.do")
	public String insertBusinessdoc() {
		return "documentboard/businessdocForm";
	}
	
	// 자료실 - 통합자료실 - 업무문서(글쓰기 등록)
	
	// 자료실 - 통합자료실 - 업무문서(게시글 한 개 조회)
	@RequestMapping("/documentboard/businessdocdetail.do")
	public String selectOnebusinessdocdetail() {
		return "documentboard/businessdocdetail";
	}
	
	// 자료실 - 통합자료실 - 업무문서(수정 화면)
	@RequestMapping("/documentboard/businessdocUpdateView.do")
	public String updateBusinessdocview() {
		return "documentboard/businessdocUpdateView";
	}
	
	// 자료실 - 통합자료실 - 업무문서(수정 등록)
	
	// 자료실 - 통합자료실 - 업무문서(게시글 삭제)
	
	// 자료실 - 통합자료실 - 업무문서(파일 한 개 삭제)

	
	
	
	
	
	
	// 자료실 - 사규(게시판 보기)
	@RequestMapping("/documentboard/companyruleslist.do")
	public String selectCompanyruleslist() {
		return "documentboard/companyruleslist";
	}
	
	// 자료실 - 사규(글쓰기)
	
	// 자료실 - 사규(글쓰기 등록)
	@RequestMapping("/documentboard/companyruleForm.do")
	public String insertCompanyrule() {
		return "/documentboard/companyruleForm";
	}
	
	// 자료실 - 사규(게시글 한 개 조회)
	@RequestMapping("/documentboard/companyruledetail.do")
	public String companyruledetail() {
		return "documentboard/companyruledetail";
	}
	
	// 자료실 - 사규(수정 화면)
	@RequestMapping("/documentboard/companyruleUpdateView.do")
	public String updateCompanyruleview() {
		return "documentboard/companyruleUpdateView";
	}
	
	// 자료실 - 사규(수정 등록)
	
	// 자료실 - 사규(게시글 삭제)
	
	// 자료실 - 사규(파일 한 개 삭제)
	
	

	
	
	
	
	
	// 자료실 - 부서별 자료실(게시판 보기)
	@RequestMapping("/documentboard/deptdoclist.do")
	public String selectDeptdoc() {
		return "documentboard/deptdoclist";
	}
	
	// 자료실 - 부서별 자료실(글쓰기)
	@RequestMapping("/documentboard/deptdocForm.do")
	public String insertDeptdoc() {
		return "/documentboard/deptdocForm";
	}
	
	// 자료실 - 부서별 자료실(글쓰기 등록)
	
	// 자료실 - 부서별 자료실(게시글 한 개 조회)
	@RequestMapping("/documentboard/deptdocdetail.do")
	public String selectOnedeptdocdetail() {
		return "documentboard/deptdocdetail";
	}
	
	// 자료실 - 부서별 자료실(수정 화면)
	@RequestMapping("/documentboard/deptdocUpdateView.do")
	public String updateDeptdocview() {
		return "documentboard/deptdocUpdateView";
	}
	
	// 자료실 - 부서별 자료실(수정 등록)
	
	// 자료실 - 부서별 자료실(게시글 삭제)
	
	// 자료실 - 부서별 자료실(파일 한 개 삭제)


	
	
	
	
	
	
	// 자료실 - 통합자료실 - 교육문서(게시판 보기)
	@RequestMapping("/documentboard/empedudoclist.do")
	public String selectEmpedudoc() {
		return "documentboard/empedudoclist";
	}
	
	// 자료실 - 통합자료실 - 교육문서(글쓰기)
	@RequestMapping("/documentboard/empedudoc.do")
	public String insertEmpedudoc() {
		return "/documentboard/empedudocForm";
	}
	
	// 자료실 - 통합자료실 - 교육문서(글쓰기 등록)
	
	// 자료실 - 통합자료실 - 교육문서(게시글 한 개 조회)
	@RequestMapping("/documentboard/empedudocdetail.do")
	public String selectOneempedudocdetail() {
		return "documentboard/empedudocdetail";
	}
	
	// 자료실 - 통합자료실 - 교육문서(수정 화면)
	@RequestMapping("/documentboard/empedudocUpdateView.do")
	public String updateEmpedudocview() {
		return "documentboard/empedudocUpdateView";
	}
	
	// 자료실 - 통합자료실 - 교육문서(수정 등록)
	
	// 자료실 - 통합자료실 - 교육문서(게시글 삭제)
	
	// 자료실 - 통합자료실 - 교육문서(파일 한 개 삭제)

	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////게시판(bulletinboard폴더)
	
	// 게시판 - 자유게시판 (게시판 보기)
	@RequestMapping("/bulletinboard/bulletinboardlist.do")
	public String selectBulletinboardlist() {
		return "bulletinboard/bulletinboardlist";
	}
	
	// 게시판 - 자유게시판 (글쓰기)
	@RequestMapping("bulletinboard/bulletinboardForm.do")
	public String insertBulletinboard() {
		return "bulletinboard/bulletinboardForm";
	}
	
	// 게시판 - 자유게시판 (글쓰기 등록)
	
	// 게시판 - 자유게시판 (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/bulletinboarddetail.do")
	public String selectOneBulletinboarddetail() {
		return "bulletinboard/bulletinboarddetail";
	}
	
	// 게시판 - 자유게시판 (수정 화면)
	@RequestMapping("/bulletinboard/bulletinboardUpdateView.do")
	public String updateBulletinboardview() {
		return "bulletinboard/bulletinboardUpdateView";
	}
	
	// 게시판 - 자유게시판 (수정 등록)
	
	// 게시판 - 자유게시판 (게시글 삭제)
	
	// 게시판 - 자유게시판 (파일 한 개 삭제)
	
	
	
	
	
	
	
	// 게시판 - 부서별 게시판 (게시판 보기)
	@RequestMapping("/bulletinboard/deptboardlist.do")
	public String selectDeptboardlist() {
		return "bulletinboard/deptboardlist";
	}
	
	// 게시판 - 부서별 게시판 (글쓰기)
	@RequestMapping("bulletinboard/deptboardForm.do")
	public String insertDeptboard() {
		return "bulletinboard/deptboardForm";
	}
	
	// 게시판 - 부서별 게시판 (글쓰기 등록)
	
	// 게시판 - 부서별 게시판 (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/deptboarddetail.do")
	public String selectOneDeptboarddetail() {
		return "bulletinboard/deptboarddetail";
	}
	
	// 게시판 - 부서별 게시판 (수정 화면)
	@RequestMapping("/bulletinboard/deptboardUpdateView.do")
	public String updateDeptboardview() {
		return "bulletinboard/deptboardUpdateView";
	}
	
	// 게시판 - 부서별 게시판 (수정 등록)
	
	// 게시판 - 부서별 게시판 (게시글 삭제)
	
	// 게시판 - 부서별 게시판 (파일 한 개 삭제)
	
	
	
	
	
	
	
	// 게시판 - 경조사 (게시판 보기)
	@RequestMapping("/bulletinboard/familyeventlist.do")
	public String selectFamilyeventlist() {
		return "bulletinboard/familyeventlist";
	}
	
	// 게시판 - 경조사 (글쓰기)
	@RequestMapping("bulletinboard/familyeventForm.do")
	public String insertFamilyevent() {
		return "bulletinboard/familyeventForm";
	}
	
	// 게시판 - 경조사 (글쓰기 등록)
	
	// 게시판 - 경조사 (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/familyeventdetail.do")
	public String selectOneFamilyeventdetail() {
		return "bulletinboard/familyeventdetail";
	}
	
	// 게시판 - 경조사 (수정 화면)
	@RequestMapping("/bulletinboard/familyeventUpdateView.do")
	public String updateFamilyeventview() {
		return "bulletinboard/familyeventUpdateView";
	}
	
	// 게시판 - 경조사 (수정 등록)
	
	// 게시판 - 경조사 (게시글 삭제)
	
	// 게시판 - 경조사 (파일 한 개 삭제)
	
	
	
	
	
	
	
	
	
	
	// 게시판 - News (게시판 보기)
	@RequestMapping("/bulletinboard/newsboardlist.do")
	public String selectNewsboardlist() {
		return "bulletinboard/newsboardlist";
	}
	
	// 게시판 - News (글쓰기)
	@RequestMapping("bulletinboard/newsboardForm.do")
	public String insertNewsboard() {
		return "bulletinboard/newsboardForm";
	}
	
	// 게시판 - News (글쓰기 등록)
	
	// 게시판 - News (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/newsboarddetail.do")
	public String selectOneNewsboarddetail() {
		return "bulletinboard/newsboarddetail";
	}
	
	// 게시판 - News (수정 화면)
	@RequestMapping("/bulletinboard/newsboardUpdateView.do")
	public String updateNewsboardview() {
		return "bulletinboard/newsboardUpdateView";
	}
	
	// 게시판 - News (수정 등록)
	
	// 게시판 - News (게시글 삭제)
	
	// 게시판 - News (파일 한 개 삭제)
	
	
	
	
	
	
	
	
	
	
	// 게시판 - 공지사항 (게시판 보기)
	@RequestMapping("/bulletinboard/noticelist.do")
	public String selectNoticelist() {
		return "bulletinboard/noticelist";
	}
	
	// 게시판 - 공지사항 (글쓰기)
	@RequestMapping("bulletinboard/noticeForm.do")
	public String insertNoticeform() {
		return "bulletinboard/noticeForm";
	}
	
	// 게시판 - 공지사항 (글쓰기 등록)
	
	// 게시판 - 공지사항 (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/noticedetail.do")
	public String selectOneNoticedetail() {
		return "bulletinboard/noticedetail";
	}
	
	// 게시판 - 공지사항 (수정 화면)
	@RequestMapping("/bulletinboard/noticeUpdateView.do")
	public String updateNoticeview() {
		return "bulletinboard/noticeUpdateView";
	}
	
	// 게시판 - 공지사항 (수정 등록)
	
	// 게시판 - 공지사항 (게시글 삭제)
	
	// 게시판 - 공지사항 (파일 한 개 삭제)
	
	
	
	
	
	
	// 게시판 - 조직개편 및 인사발령 (게시판 보기)
	@RequestMapping("/bulletinboard/reorganizationlist.do")
	public String selectReorganizationlist() {
		return "bulletinboard/reorganizationlist";
	}
	
	// 게시판 - 조직개편 및 인사발령 (글쓰기)
	@RequestMapping("bulletinboard/reorganizationForm.do")
	public String insertReorganizationform() {
		return "bulletinboard/reorganizationForm";
	}
	
	// 게시판 - 조직개편 및 인사발령 (글쓰기 등록)
	
	// 게시판 - 조직개편 및 인사발령 (게시글 한 개 조회)
	@RequestMapping("/bulletinboard/reorganizationdetail.do")
	public String selectOneReorganizationdetail() {
		return "bulletinboard/reorganizationdetail";
	}
	
	// 게시판 - 조직개편 및 인사발령 (수정 화면)
	@RequestMapping("/bulletinboard/reorganizationUpdateView.do")
	public String updateReorganizationview() {
		return "bulletinboard/reorganizationUpdateView";
	}
	
	// 게시판 - 조직개편 및 인사발령 (수정 등록)
	
	// 게시판 - 조직개편 및 인사발령 (게시글 삭제)
	
	// 게시판 - 조직개편 및 인사발령 (파일 한 개 삭제)
	
	
	
	
	
	
	
	
	




}
