package com.kh.coworks.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

public interface BoardDao {
	
	
	/////////////////////////////////////////////////////////////////////////자료실
	// 자료실 - 업무문서----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectBusinessdocList(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectBusinessdocTotalContents();
	
	// 게시글 추가
	int insertBusinessdoc(Board board);
	
	// 첨부파일 넣기
	int insertBusinessdocAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOnebusinessdocdetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectBusinessdocAttachList(int boardNo);
	
	// 게시글 수정
	int updateBusinessdocview(Board board);
	
	// 첨부파일 수정
	int updateBusinessdocAttach(Attach att);
	
	// 게시글 삭제
	int deleteBusinessdoc(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteBusinessdocAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteBusinessdocFile(int attNo);

	
	
	
	
	
	// 자료실 - 사규----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectCompanyruleslist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectCompanyrulesTotalContents();
	
	// 게시글 추가
	int insertCompanyrule(Board board);
	
	// 첨부파일 추가
	int insertCompanyruleAttach(Attach att);
	
	// 게시글 내용 조회
	Board SelectOnecompanyruledetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectCompanyruleAttachList(int boardNo);
	
	// 게시글 수정
	int updateCompanyruleview(Board board, List<Attach> attachList);
	
	// 게시글 첨부파일 수정
	int updateCompanyruleAttach(Attach att);
	
	// 게시글 삭제
	int deleteCompanyrule(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteCompanyruleAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteCompanyruleFile(int attNo);
	
	
	
	
	
	
	
	// 자료실 - 부서별 자료실----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectDeptdoc(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectDeptdocTotalContents();
	
	// 게시글 추가
	int insertDeptdoc(Board board);
	
	// 첨부파일 추가
	int insertDeptdocAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOnedeptdocdetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectDeptdocAttachList(int boardNo);
	
	// 게시글 수정
	int updateDeptdocview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateDeptdocAttach(Attach att);
	
	// 게시글 삭제
	int deleteDeptdoc(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteDeptdocAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteDeptdocFile(int attNo);
	
	
	
	
	
	
	
	
	// 자료실 - 교육 자료실----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectEmpedudoc(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectEmpedudocTotalContents();
	
	// 게시글 추가
	int insertEmpedudoc(Board board);
	
	// 첨부파일 추가
	int insertEmpedudocAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneempedudocdetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectEmpedudocAttachList(int boardNo);
	
	// 게시글 수정
	int updateEmpedudocview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateEmpedudocAttach(Attach att);
	
	// 게시글 삭제
	int deleteEmpedudoc(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteEmpedudocAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteEmpedudocFile(int attNo);
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////게시판
	// 게시판 - 자유게시판----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectBulletinboardlist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectBulletinboardTotalContents();
	
	// 게시글 추가
	int insertBulletinboard(Board board);
	
	// 첨부파일 추가
	int insertBulletinboardAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneBulletinboarddetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectBulletinboardAttachList(int boardNo);
	
	// 게시글 수정
	int updateBulletinboardview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateBulletinboardAttach(Attach att);
	
	// 게시글 삭제
	int deleteBulletinboard(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteBulletinboardAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteBulletinboardFile(int attNo);
	
	
	
	
	
	
	
	
	
	// 게시판 - 부서게시판----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectDeptboardlist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectDeptboardTotalContents();
	
	// 게시글 추가
	int insertDeptboard(Board board);
	
	// 첨부파일 추가
	int insertDeptboardAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneDeptboarddetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectDeptboardAttachList(int boardNo);
	
	// 게시글 수정
	int updateDeptboardview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateDeptboardAttach(Attach att);
	
	// 게시글 삭제
	int deleteDeptboard(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteDeptboardAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteDeptboardFile(int attNo);
	
	
	
	
	
	
	
	
	// 게시판 - 경조사게시판----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectFamilyeventlist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectFamilyeventTotalContents();
	
	// 게시글 추가
	int insertFamilyevent(Board board);
	
	// 첨부파일 추가
	int insertFamilyeventAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneFamilyeventdetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectFamilyeventAttachList(int boardNo);
	
	// 게시글 수정
	int updateFamilyeventview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateFamilyeventAttach(Attach att);
	
	// 게시글 삭제
	int deleteFamilyevent(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteFamilyeventAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteFamilyeventFile(int attNo);
	
	
	
	
	
	
	
	
	// 게시판 - News게시판----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectNewsboardlist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectNewsboardTotalContents();
	
	// 게시글 추가
	int insertNewsboard(Board board);
	
	// 첨부파일 추가
	int insertNewsboardAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneNewsboarddetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectNewsboardAttachList(int boardNo);
	
	// 게시글 수정
	int updateNewsboardview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateNewsboardAttach(Attach att);
	
	// 게시글 삭제
	int deleteNewsboard(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteNewsboardAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteNewsboardFile(int attNo);
	
	
	
	
	
	
	
	
	// 게시판 - 공지사항----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectNoticelist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectNoticeTotalContents();
	
	// 게시글 추가
	int insertNoticeform(Board board);
	
	// 첨부파일 추가
	int insertNoticeAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneNoticedetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectNoticeAttachList(int boardNo);
	
	// 게시글 수정
	int updateNoticeview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateNoticeAttach(Attach att);
	
	// 게시글 삭제
	int deleteNotice(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteNoticeAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteNoticeFile(int attNo);
	
	
	
	
	
	
	
	
	// 게시판 - 조직개편 및 인사이동----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectReorganizationlist(int cPage, int limit);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectReorganizationTotalContents();
	
	// 게시글 추가
	int insertReorganizationform(Board board);
	
	// 첨부파일 추가
	int insertReorganizationAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOneReorganizationdetail(int boardNo); 
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectReorganizationAttachList(int boardNo);
	
	// 게시글 수정
	int updateReorganizationview(Board board, List<Attach> attachList);
	
	// 첨부파일 수정
	int updateReorganizationAttach(Attach att);
	
	// 게시글 삭제
	int deleteReorganization(int boardNo);
	
	// 첨부파일 전체 삭제
	int deleteReorganizationAttach(int boardNo);
	
	// 파일 한 개 삭제
	int deleteReorganizationFile(int attNo);

}
