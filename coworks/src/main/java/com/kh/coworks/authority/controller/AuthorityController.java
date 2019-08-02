package com.kh.coworks.authority.controller;

import java.util.ArrayList ;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.coworks.authority.model.service.AuthorityService;
import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Job;

@SessionAttributes(value= {"authority"})
@Controller
public class AuthorityController {
	
	@Autowired
	AuthorityService authorityService;
	
	@RequestMapping("/authority/authorityList.do")
	public String selectList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {
		
		int limit = 5; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(authorityService.selectAuthorityList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = authorityService.selectAuthorityTotalContents();

		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "authorityList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		
		
		return "authority/authorityList";
	}
	
	
	@RequestMapping("/authority/authoritySearch.do")
	public String selectEmployeeSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") 
	int cPage, String con, String keyword, Model model) {

		int limit = 5; // 한 페이지 당 게시글 수
		
		HashMap<String, String> hmap = new HashMap<>();
		
		
		hmap.put("con", con); 
		hmap.put("keyword", keyword);
		
				
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(authorityService.searchAuthority(cPage, limit, hmap));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = authorityService.selectSearchEmployeeTotalContents(con,hmap);
	

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "authorityList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		
		return "authority/authorityList";
	}
	
	
	@RequestMapping("/authority/authorityUpdate.do")
	public String authorityUpdate(Authority authority) {
		
		if(authority.getAuth_personnal().equals("인사")) {
			authority.setAuth_personnal("Y");
		}else
			authority.setAuth_personnal("N");
		
		if(authority.getAuth_data().equals("자료실")) {
			authority.setAuth_data("Y");
		}else
			authority.setAuth_data("N");
		
		if(authority.getAuth_cal().equals("회사일정")) {
			authority.setAuth_cal("Y");
		}else
			authority.setAuth_cal("N");
		
		if(authority.getAuth_board().equals("게시판")) {
			authority.setAuth_board("Y");
		}else
			authority.setAuth_board("N");
		
		if(authority.getAuth_approval().equals("결재서류")) {
			authority.setAuth_approval("Y");
		}else
			authority.setAuth_approval("N");
		
		if(authority.getAuth_authority().equals("권한관리")) {
			authority.setAuth_authority("Y");
		}else
			authority.setAuth_authority("N");
		
		if(authority.getAuth_pay().equals("급여")) {
			authority.setAuth_pay("Y");
		}else
			authority.setAuth_pay("N");
		
		int result = authorityService.authorityUpdate(authority);
		
		return "redirect:authorityList.do";
	}
	
}
