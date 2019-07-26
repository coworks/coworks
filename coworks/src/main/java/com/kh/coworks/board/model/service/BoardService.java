package com.kh.coworks.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

public interface BoardService {

	static final int BOARD_SRV_ERROR = 0;
	static final int BOARD_SRV_COMP = 1;
	
	/////////////////////////////////////////////////////////////////////////자료실
	// 자료실 - 업무문서----------------------------------------------------------------
	// 게시글 목록 조회용
	List<Map<String, String>> selectBusinessdoc(int cPage, int limit, String boardCode);
	
	// 페이지 처리를 위한 게시글 총 개수
	int selectBusinessdocTotalContents(String boardCode);
	
	// 게시글 추가
	int insertBusinessdoc(Board board, List<Attach> attachList);
	
	// 게시글 내용 조회
	Board selectOnebusinessdocdetail(Board b);
	
	// 해당 게시글 첨부파일 목록 조회
	List<Attach> selectBusinessdocAttachList(Board b);
	
	// 게시글 수정
	int updateBusinessdocview(Board board, List<Attach> attachList);
	
	// 게시글 삭제
	int deleteBusinessdoc(int boardNo);
	
	// 파일 한 개 삭제
	int deleteBusinessdocFile(int attNo);


	

	
	
	

}
