package com.kh.coworks.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

public interface BoardDao {
	
	
	/////////////////////////////////////////////////////////////////////////자료실
	// 자료실 - 업무문서----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectBusinessdocList(int cPage, int limit, String boardCode);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectBusinessdocTotalContents(String boardCode);
	
	// 게시글 추가
	int insertBusinessdoc(Board board);
	
	// 첨부파일 넣기
	int insertBusinessdocAttach(Attach att);
	
	// 게시글 내용 조회
	Board selectOnebusinessdocdetail(Board b);
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectBusinessdocAttachList(Board b);
	
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

	

	

	

}
