package com.kh.coworks.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBusinessdocList(int cPage, int limit, String boardCode) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectBusinessdocList",boardCode, rows);
	}

	@Override
	public int selectBusinessdocTotalContents(String boardCode) {
		return sqlSession.selectOne("board.selectBusinessdocTotalContents", boardCode);
	}

	@Override
	public int insertBusinessdoc(Board board) {
		return sqlSession.insert("board.insertBusinessdoc", board);
	}

	@Override
	public int insertBusinessdocAttach(Attach att) {
		return sqlSession.insert("board.insertBusinessdocAttach", att);
	}

	@Override
	public Board selectOnebusinessdocdetail(Board b) {
		return sqlSession.selectOne("board.selectOneBusinessdocdetail", b);
	}

	@Override
	public List<Attach> selectBusinessdocAttachList(Board b) {
		return sqlSession.selectList("board.selectBusinessdocAttachList", b);
		
	}

	@Override
	public int updateBusinessdocview(Board board) {
		return sqlSession.update("board.updateBusinessdocview", board);
	}

	@Override
	public int updateBusinessdocAttach(Attach att) {
		return sqlSession.insert("board.updateBusinessdocAttach", att);
	}

	@Override
	public int deleteBusinessdoc(Board b) {
		return sqlSession.delete("board.deleteBusinessdoc", b);
	}

	@Override
	public int deleteBusinessdocAttach(int boardNo) {
		return sqlSession.delete("board.deleteBusinessdocAttachment", boardNo);
	}

	@Override
	public int deleteBusinessdocFile(int attNo) {
		return sqlSession.delete("board.deleteBusinessdocFile", attNo);
	}

	



	//////////////////////////////////////////////////////////////
	// 부서 리스트
	@Override
	public List<String> selectDeptList() {
		return sqlSession.selectList("approval.selectApprovalFormFolderList");
	}
	
	
}
