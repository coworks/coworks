package com.kh.coworks.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.board.model.service.BoardService;
import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;
import com.kh.coworks.board.model.vo.BoardGroup;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class BoardController {
	// js, css, scss로 시작하는거는
	// ${pageContext.request.contextPath}/resources/templates/resources/ 붙여주면 됩니당!

	// BoardServiceImpl 아직 생성 안돼서 @Autowired가 불가능해서 페이지 실행이 안되서 일단 주석처리 했어요
	@Autowired
	BoardService boardService;

	@Autowired
	EmployeeService employeeService;

	/////////////////////////////////////////////////////////// (documentboard폴더)

	// (게시판 보기) ★
	@RequestMapping(value = "/documentboard/{boardCode}", method = RequestMethod.GET)
	public String selectBusinessdoc(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@PathVariable("boardCode") String boardCode, Model model, Board board) {
		System.out.println("check : "+cPage);
		int limit = 10;

		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>(
				boardService.selectBusinessdoc(cPage, limit, boardCode));

		int totalContents = boardService.selectBusinessdocTotalContents(boardCode);

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "/coworks/documentboard/"+boardCode);
		

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar).addAttribute("bo_code", boardCode).addAttribute(board);

		return "documentboard/businessdoclist";
	}

	// (글쓰기) ★
	@RequestMapping("/documentboard/businessdocForm.do")
	public String insertBusinessdocForm(Model model) {

		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());

		model.addAttribute("departmentList", departmentList);

		return "documentboard/businessdocForm";
	}

	// (글쓰기 등록) ★
	@RequestMapping(value = "/documentboard/insert", method = RequestMethod.POST)
	public String insertBusinessdoc(Board board, Model model, HttpServletRequest request,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFiles,
			@RequestParam(value = "dep_code") String dep_code) {

		if (board.getBo_code().equals("DD")) {
			board.setBo_code(dep_code);

		}

		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		String saveDir = session.getServletContext().getRealPath("/resources/board/attach");

		System.out.println("파일 길이 " + upFiles.length);

		List<Attach> list = new ArrayList<>();
		String savePath = "";

		if (new File(saveDir).exists()) {
			for (MultipartFile f : upFiles) {
				if (!f.isEmpty()) {
					String originalName = f.getOriginalFilename();
					String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
					int rndNum = (int) (Math.random() * 1000);
					String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
					try {
						f.transferTo(new File(saveDir + "/" + renamedName));
						System.out.println(f.getName());
						System.out.println(saveDir + "/" + renamedName);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					Attach at = new Attach();
					at.setAttach_path(saveDir);
					at.setAttach_oriname(originalName);
					at.setAttach_rename(renamedName);

					list.add(at);
				}
			}
		}

		int result = boardService.insertBusinessdoc(board, list);
		System.out.println("list size : " + list.size());
		board.setFiles(list);
		board.setFileCount(list.size());

		if (result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}

		model.addAttribute("bo_code", board.getBo_code()).addAttribute(board);

		System.out.println(" 완료된 BOARD : " + board);

		return "redirect:/documentboard/" + board.getBo_code() + "/" + board.getBo_no();
	}

	// (게시글 한 개 조회) ★
	@RequestMapping(value = "/documentboard/{boardCode}/{boardNo}", method = RequestMethod.GET)
	public String selectOnebusinessdocdetail(@PathVariable("boardCode") String boardCode,
			@PathVariable("boardNo") int boardNo, Model model) {

		Board b = new Board();
		b.setBo_code(boardCode);
		b.setBo_no(boardNo);
		b.setBg_code(boardCode);

		model.addAttribute("board", boardService.selectOnebusinessdocdetail(b))
				.addAttribute("attachmentList", boardService.selectBusinessdocAttachList(b))
				.addAttribute("bo_code", boardCode);

		return "documentboard/businessdocdetail";
	}

	// (수정 하기 위해 값 가져오기 - 수정 화면) ★
	@RequestMapping(value = "/documentboard/{boardCode}/{boardNo}/{bo_emp_no}", method = RequestMethod.GET)
	public String updateBusinessdocview(@PathVariable("boardCode") String boardCode,
			@PathVariable("boardNo") int boardNo, @PathVariable("bo_emp_no") int bo_emp_no, Model model) {

		Board b = new Board();
		b.setBo_code(boardCode);
		b.setBo_no(boardNo);
		b.setEmp_no(bo_emp_no);
		b.setBo_content(b.getBo_content());

		model.addAttribute("board", boardService.selectOnebusinessdocdetail(b)).addAttribute("attachmentList",
				boardService.selectBusinessdocAttachList(b));

		System.out.println("bbbbbbb : " + b);
		return "documentboard/businessdocUpdateView";
	}

	// (수정 등록) ★
	@RequestMapping(value = "/documentboard/edit", method = RequestMethod.POST)
	public String updateBusinessdoc(HttpSession session, Board board, Model model,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFiles) {
		int bo_no = board.getBo_no();

		String saveDir_bo = session.getServletContext().getRealPath("/resources/board/attach");

		List<Attach> list = boardService.selectBusinessdocAttachList(board);
		if (list == null)
			list = new ArrayList<Attach>();

		File dir = new File(saveDir_bo);

		if (dir.exists() == false)
			dir.mkdirs();

		int idx = 0;
		for (MultipartFile f : upFiles) {
			Attach at = new Attach();

			if (!f.isEmpty()) {
				/*
				 * if (list.size() > idx) { boolean idDeleted = new File(saveDir_bo + "/" +
				 * list.get(idx).getAttach_rename()).delete();
				 * 
				 * at = list.get(idx); } else { at = new Attach(); at.setBo_no(bo_no);
				 * 
				 * list.add(at); }
				 */
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				int rndNum = (int) (Math.random() * 1000);

				String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				try {
					f.transferTo(new File(saveDir_bo + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				at.setBo_no(bo_no);
				at.setAttach_oriname(originName);
				at.setAttach_rename(renamedName);

				list.add(at);
			}
			idx++;
		}

		int result = boardService.updateBusinessdocview(board, list);

		return "redirect:/documentboard/" + board.getBo_code() + "/" + board.getBo_no();

	}

	// (게시글 삭제)
	@RequestMapping(value = "/documentboard/delboard.do")
	public String deletebusinessdocboard(Board board, @RequestParam int bo_no, @RequestParam String bo_code,
			HttpSession session, Model model) {

		System.out.println("board : " + board);
		System.out.println("삭제 bo_code : " + bo_code);
		System.out.println("삭제 bo_no : " + bo_no);

		Board b = new Board();

		b.setBo_code(board.getBo_code());
		b.setBo_no(board.getBo_no());

		System.out.println("bbbbbbb : " + b);

		List<Attach> list = boardService.selectBusinessdocAttachList(b);

		String saveDir = session.getServletContext().getRealPath("/resources/board/attach");

		if (list != null) {
			for (Attach at : list) { // 첨부파일 하나씩 꺼내서

				new File(saveDir + "/" + at.getAttach_rename()).delete();
				// 이 저장경로에 있는 파일을 삭제한다.
			}
		}

		int result = boardService.deleteBusinessdoc(b);

		if (result > 0)
			System.out.println("게시글 삭제 성공");
		else
			System.out.println("게시글 삭제 실패");

		return "redirect:/documentboard/" + b.getBo_code();

	}

	// (파일 한 개 삭제) ★
	@RequestMapping("/documentboard/fileDelete.do")
	@ResponseBody // ajax로 구현. 파일 하나만 삭제할거면 굳이 새로고침할 필요가 없다. (id 중복체크 했던 것과 구조가 동일하다.)
	public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName, HttpSession session) { // session :
																											// 파일 삭제를 위해
																											// 필요 /
																											// rName :
																											// 파일이름

		// 저장 경로 가져오기
		String saveDir = session.getServletContext().getRealPath("/resources/board/attach");

		// 파일 삭제와 실행 여부
		boolean check = boardService.deleteBusinessdocFile(attNo) != 0 ? true : false;
		// 삭제한 것이 0이 아니면? 참: 거짓;

		if (check)
			new File(saveDir + "/" + rName).delete();
		// 파일 이름 가져와서 삭제

		return check;

	}

	// 부서별 게시판 목록 ★
	@RequestMapping("/documentboard/deptdocSelect.do")
	public String deptdocSelect(Model model) {
		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());

		model.addAttribute("departmentList", departmentList);

		return "documentboard/deptdoclist";
	}

	// 부서별 게시판 목록
//	@RequestMapping("/board/deptboardSelect.do")
//	public String deptboardSelect(Model model) {
//		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());
//
//		model.addAttribute("departmentList", departmentList);
//
//		return "documentboard/deptdoclist";
//	}

	// ※첨부파일 다운로드!※ ★
	// download 태그로 대체 가능하나
	// 만약을 위해 구현하는 방법도 익히고 있어야 한다.
	@RequestMapping("/documentboard/fileDownload.do")
	public void fileDownload(@RequestParam String oName, @RequestParam String rName, HttpServletRequest request,
			HttpServletResponse response) {

		// 파일저장디렉토리
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/board/attach");

		BufferedInputStream bis = null;
		ServletOutputStream sos = null;

		try {
			sos = response.getOutputStream();
			File savedFile = new File(saveDirectory + "/" + rName);
			response.setContentType("application/octet-stream; charset=utf-8");

			// 한글 파일 명 처리 : 브라우져에 따른 인코딩 처리 선택
			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			System.out.println("isMSIE=" + isMSIE);
			if (isMSIE) {
				// ie는 utf-8 인코딩을 명시적으로 선언 해줘야 한다.
				// 또한 공백을 의미하는 ' '기호가 +로 변하기 때문에, 이를 %20로 치환해준다.
				// 그럼 '+'는...?? ==> '+'기호는 그에 맞는 유니코드로 치환되기 때문에 상관 X
				resFilename = URLEncoder.encode(oName, "UTF-8"); // java.net import~
				System.out.println("ie : " + resFilename);// ie :
															// %EC%97%AC%EB%9F%AC%EB%B6%84+%ED%99%94%EC%9D%B4%ED%8C%85.txt

				resFilename = resFilename.replaceAll("\\+", "%20");
				System.out.println("ie : " + resFilename);// ie :
															// %EC%97%AC%EB%9F%AC%EB%B6%84+%ED%99%94%EC%9D%B4%ED%8C%85.txt
			} else {
				// 다른 웹 브라우저 중 ISO-8859-1(EUC-KR)로 되어 있는 경우 인코딩 진행
				resFilename = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
				System.out.println("not ie : " + resFilename);

			}
			response.addHeader("Content-Disposition", "attachment; filename=\"" + resFilename + "\"");

			// 파일크기지정
			response.setContentLength((int) savedFile.length());

			FileInputStream fis = new FileInputStream(savedFile);
			bis = new BufferedInputStream(fis);
			int read = 0;

			while ((read = bis.read()) != -1) {
				sos.write(read);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}
}
