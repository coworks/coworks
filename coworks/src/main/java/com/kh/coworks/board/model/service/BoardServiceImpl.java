package com.kh.coworks.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.board.model.dao.BoardDao;
import com.kh.coworks.board.model.exception.BoardException;
import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Map<String, String>> selectBusinessdoc(int cPage, int limit, String boardCode) {
		return boardDao.selectBusinessdocList(cPage, limit, boardCode);
	}

	@Override
	public int selectBusinessdocTotalContents(String boardCode) {
		return boardDao.selectBusinessdocTotalContents(boardCode);
	}

	@Override
	public int insertBusinessdoc(Board board, List<Attach> attachList) {

		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertBusinessdoc(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("자료실 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				at.setBo_no(board.getBo_no());
				result = boardDao.insertBusinessdocAttach(at);
				if(result == BOARD_SRV_ERROR)
				throw new BoardException("게시판 첨부파일 처리 에러");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOnebusinessdocdetail(Board b) {
		
		return boardDao.selectOnebusinessdocdetail(b);
	}
	
	@Override
	public List<Attach> selectBusinessdocAttachList(Board b) {
		return boardDao.selectBusinessdocAttachList(b);
	}

	@Override
	public int updateBusinessdocview(Board board, List<Attach> attachList) {
		
		int result = BOARD_SRV_ERROR;
		
		List<Attach> originList = boardDao.selectBusinessdocAttachList(board);
		
		result = boardDao.updateBusinessdocview(board);
		
		if(result == BOARD_SRV_ERROR) throw new BoardException();
		
		if(originList.size() > 0) {
			result = boardDao.deleteBusinessdocAttach(board.getBo_no());
			
			if(result == BOARD_SRV_ERROR) throw new BoardException();
		}
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.updateBusinessdocAttach(at);
				if(result == BOARD_SRV_ERROR) throw new BoardException();
			}
		}
		
		return result;
	}

	@Override
	public int deleteBusinessdoc(Board b) {
		int result = boardDao.deleteBusinessdoc(b);
//		
//		if(result > BOARD_SRV_ERROR && boardDao.selectBusinessdocAttachList(boardNo).size()>0) {
//			result = boardDao.deleteBusinessdocAttach(boardNo);
//		} else if(result > BOARD_SRV_ERROR) {
//			result = BOARD_SRV_COMP;
//		} else {
//			throw new BoardException("게시글 삭제 실패!");
//		}
		return result;
	}

	@Override
	public int deleteBusinessdocFile(int attNo) {
		return boardDao.deleteBusinessdocFile(attNo);
	}

	
	
	// 부서 리스트
	@Override
	public List<String> selectDeptList(){
		return boardDao.selectDeptList();
	}


}
