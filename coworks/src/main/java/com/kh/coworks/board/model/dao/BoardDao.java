package com.kh.coworks.board.model.dao;

public interface BoardDao {

}
package com.kh.coworks.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

public interface BoardDao {

	List<Map<String, String>> selectBoardList(int cPage, int limit);
	
	int selectBoardTotalContents();
	
	int insertBoard(Board board);
	
	int insertAttachment(Attach att);
	
	Board selectOneBoard(int boardNo);
	
	List<Attach> selectAttachList(int boardNo);
	
	int updateBoard(Board board);
	
	int updateAttachment(Attach att);
	
	int deleteBoard(int boardNo);
	
	int deleteAttachment(int boardNo);
	
	int deleteFile(int attNo);
	
	
}
