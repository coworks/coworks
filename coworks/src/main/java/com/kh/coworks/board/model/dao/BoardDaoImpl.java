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
	public List<Map<String, String>> selectBusinessdocList(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectBusinessdocList",null, rows);
	}

	@Override
	public int selectBusinessdocTotalContents() {
		return sqlSession.selectOne("board.selectBusinessdocTotalContents");
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
	public Board selectOnebusinessdocdetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneBusinessdocdetail", boardNo);
	}

	@Override
	public List<Attach> selectBusinessdocAttachList(int boardNo) {
		return sqlSession.selectList("board.selectBusinessdocAttachList", boardNo);
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
	public int deleteBusinessdoc(int boardNo) {
		return sqlSession.delete("board.deleteBusinessdoc", boardNo);
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
	
	@Override
	public List<Map<String, String>> selectCompanyruleslist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectCompanyrulesList",null, rows);
	}

	@Override
	public int selectCompanyrulesTotalContents() {
		return sqlSession.selectOne("board.selectCompanyrulesTotalContents");
	}

	@Override
	public int insertCompanyrule(Board board) {
		return sqlSession.insert("board.insertCompanyrule", board);
	}

	@Override
	public int insertCompanyruleAttach(Attach att) {
		return sqlSession.insert("board.insertCompanyruleAttach", att);
	}

	@Override
	public Board SelectOnecompanyruledetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneCompanyruledetail", boardNo);
	}

	@Override
	public List<Attach> selectCompanyruleAttachList(int boardNo) {
		return sqlSession.selectList("board.selectCompanyruleAttachList", boardNo);
	}

	@Override
	public int updateCompanyruleview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateCompanyruleview", board);
	}

	@Override
	public int updateCompanyruleAttach(Attach att) {
		return sqlSession.insert("board.updateCompanyruleAttach", att);
	}

	@Override
	public int deleteCompanyrule(int boardNo) {
		return sqlSession.delete("board.deleteCompanyrule", boardNo);
	}

	@Override
	public int deleteCompanyruleAttach(int boardNo) {
		return sqlSession.delete("board.deleteCompanyruleAttachment", boardNo);
	}

	@Override
	public int deleteCompanyruleFile(int attNo) {
		return sqlSession.delete("board.deleteCompanyruleFile", attNo);
	}
	
	////////////////////////////////////////////////////////////

	@Override
	public List<Map<String, String>> selectDeptdoc(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectDeptdocList",null, rows);
	}

	@Override
	public int selectDeptdocTotalContents() {
		return sqlSession.selectOne("board.selectBusinessdocTotalContents");
	}

	@Override
	public int insertDeptdoc(Board board) {
		return sqlSession.insert("board.insertDeptdoc", board);
	}

	@Override
	public int insertDeptdocAttach(Attach att) {
		return sqlSession.insert("board.insertDeptdocAttach", att);
	}

	@Override
	public Board selectOnedeptdocdetail(int boardNo) {
		return sqlSession.selectOne("board.selectOnedeptdocdetail", boardNo);
	}

	@Override
	public List<Attach> selectDeptdocAttachList(int boardNo) {
		return sqlSession.selectList("board.selectDeptdocAttachList", boardNo);
	}

	@Override
	public int updateDeptdocview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateDeptdocview", board);
	}

	@Override
	public int updateDeptdocAttach(Attach att) {
		return sqlSession.insert("board.updateDeptdocAttach", att);
	}

	@Override
	public int deleteDeptdoc(int boardNo) {
		return sqlSession.delete("board.deleteDeptdoc", boardNo);
	}

	@Override
	public int deleteDeptdocAttach(int boardNo) {
		return sqlSession.delete("board.deleteDeptdocAttachment", boardNo);
	}

	@Override
	public int deleteDeptdocFile(int attNo) {
		return sqlSession.delete("board.deleteDeptdocFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectEmpedudoc(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectEmpedudocList",null, rows);
	}

	@Override
	public int selectEmpedudocTotalContents() {
		return sqlSession.selectOne("board.selectEmpedudocTotalContents");
	}

	@Override
	public int insertEmpedudoc(Board board) {
		return sqlSession.insert("board.insertEmpedudoc", board);
	}

	@Override
	public int insertEmpedudocAttach(Attach att) {
		return sqlSession.insert("board.insertEmpedudocAttach", att);
	}

	@Override
	public Board selectOneempedudocdetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneempedudocdetail", boardNo);
	}

	@Override
	public List<Attach> selectEmpedudocAttachList(int boardNo) {
		return sqlSession.selectList("board.selectEmpedudocAttachList", boardNo);
	}

	@Override
	public int updateEmpedudocview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateEmpedudocview", board);
	}

	@Override
	public int updateEmpedudocAttach(Attach att) {
		return sqlSession.insert("board.updateEmpedudocAttach", att);
	}

	@Override
	public int deleteEmpedudoc(int boardNo) {
		return sqlSession.delete("board.deleteEmpedudoc", boardNo);
	}

	@Override
	public int deleteEmpedudocAttach(int boardNo) {
		return sqlSession.delete("board.deleteEmpedudocAttachment", boardNo);
	}

	@Override
	public int deleteEmpedudocFile(int attNo) {
		return sqlSession.delete("board.deleteEmpedudocFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectBulletinboardlist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectBulletinboardList",null, rows);
	}

	@Override
	public int selectBulletinboardTotalContents() {
		return sqlSession.selectOne("board.selectBulletinboardTotalContents");
	}

	@Override
	public int insertBulletinboard(Board board) {
		return sqlSession.insert("board.insertBulletinboard", board);
	}

	@Override
	public int insertBulletinboardAttach(Attach att) {
		return sqlSession.insert("board.insertBulletinboardAttach", att);
	}

	@Override
	public Board selectOneBulletinboarddetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneBulletinBoard", boardNo);
	}

	@Override
	public List<Attach> selectBulletinboardAttachList(int boardNo) {
		return sqlSession.selectList("board.selectBulletinboardAttachList", boardNo);
	}

	@Override
	public int updateBulletinboardview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateBulletinboardview", board);
	}

	@Override
	public int updateBulletinboardAttach(Attach att) {
		return sqlSession.insert("board.updateBulletinboardAttach", att);
	}

	@Override
	public int deleteBulletinboard(int boardNo) {
		return sqlSession.delete("board.deleteBulletinboard", boardNo);
	}

	@Override
	public int deleteBulletinboardAttach(int boardNo) {
		return sqlSession.delete("board.deleteBulletinboardAttachment", boardNo);
	}

	@Override
	public int deleteBulletinboardFile(int attNo) {
		return sqlSession.delete("board.deleteBulletinboardFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectDeptboardlist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectDeptboardList",null, rows);
	}

	@Override
	public int selectDeptboardTotalContents() {
		return sqlSession.selectOne("board.selectDeptboardTotalContents");
	}

	@Override
	public int insertDeptboard(Board board) {
		return sqlSession.insert("board.insertDeptboard", board);
	}

	@Override
	public int insertDeptboardAttach(Attach att) {
		return sqlSession.insert("board.insertDeptboardAttach", att);
	}

	@Override
	public Board selectOneDeptboarddetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneDeptboarddetail", boardNo);
	}

	@Override
	public List<Attach> selectDeptboardAttachList(int boardNo) {
		return sqlSession.selectList("board.selectDeptboardAttachList", boardNo);
	}

	@Override
	public int updateDeptboardview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateDeptboardview", board);
	}

	@Override
	public int updateDeptboardAttach(Attach att) {
		return sqlSession.insert("board.updateDeptboardAttach", att);
	}

	@Override
	public int deleteDeptboard(int boardNo) {
		return sqlSession.delete("board.deleteDeptboard", boardNo);
	}

	@Override
	public int deleteDeptboardAttach(int boardNo) {
		return sqlSession.delete("board.deleteDeptboardAttachment", boardNo);
	}

	@Override
	public int deleteDeptboardFile(int attNo) {
		return sqlSession.delete("board.deleteDeptboardFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectFamilyeventlist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectFamilyeventList",null, rows);
	}

	@Override
	public int selectFamilyeventTotalContents() {
		return sqlSession.selectOne("board.selectFamilyeventTotalContents");
	}

	@Override
	public int insertFamilyevent(Board board) {
		return sqlSession.insert("board.insertFamilyevent", board);
	}

	@Override
	public int insertFamilyeventAttach(Attach att) {
		return sqlSession.insert("board.insertFamilyeventAttach", att);
	}

	@Override
	public Board selectOneFamilyeventdetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneFamilyeventdetail", boardNo);
	}

	@Override
	public List<Attach> selectFamilyeventAttachList(int boardNo) {
		return sqlSession.selectList("board.selectFamilyeventAttachList", boardNo);
	}

	@Override
	public int updateFamilyeventview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateFamilyeventview", board);
	}

	@Override
	public int updateFamilyeventAttach(Attach att) {
		return sqlSession.insert("board.updateFamilyeventAttach", att);
	}

	@Override
	public int deleteFamilyevent(int boardNo) {
		return sqlSession.delete("board.deleteFamilyevent", boardNo);
	}

	@Override
	public int deleteFamilyeventAttach(int boardNo) {
		return sqlSession.delete("board.deleteFamilyeventAttachment", boardNo);
	}

	@Override
	public int deleteFamilyeventFile(int attNo) {
		return sqlSession.delete("board.deleteFamilyeventFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectNewsboardlist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectNewsboardList",null, rows);
	}

	@Override
	public int selectNewsboardTotalContents() {
		return sqlSession.selectOne("board.selecNewsboardTotalContents");
	}

	@Override
	public int insertNewsboard(Board board) {
		return sqlSession.insert("board.insertNewsboard", board);
	}

	@Override
	public int insertNewsboardAttach(Attach att) {
		return sqlSession.insert("board.insertNewsboardAttach", att);
	}

	@Override
	public Board selectOneNewsboarddetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneNewsboarddetail", boardNo);
	}

	@Override
	public List<Attach> selectNewsboardAttachList(int boardNo) {
		return sqlSession.selectList("board.selectNewsboardAttachList", boardNo);
	}

	@Override
	public int updateNewsboardview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateNewsboardview", board);
	}

	@Override
	public int updateNewsboardAttach(Attach att) {
		return sqlSession.insert("board.updateNewsboardAttach", att);
	}

	@Override
	public int deleteNewsboard(int boardNo) {
		return sqlSession.delete("board.deleteNewsboard", boardNo);
	}

	@Override
	public int deleteNewsboardAttach(int boardNo) {
		return sqlSession.delete("board.deleteNewsboardAttachment", boardNo);
	}

	@Override
	public int deleteNewsboardFile(int attNo) {
		return sqlSession.delete("board.deleteNewsboardFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectNoticelist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectNoticeList",null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("board.selectNoticeTotalContents");
	}

	@Override
	public int insertNoticeform(Board board) {
		return sqlSession.insert("board.insertNoticeform", board);
	}

	@Override
	public int insertNoticeAttach(Attach att) {
		return sqlSession.insert("board.insertNoticeAttach", att);
	}

	@Override
	public Board selectOneNoticedetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneNoticedetail", boardNo);
	}

	@Override
	public List<Attach> selectNoticeAttachList(int boardNo) {
		return sqlSession.selectList("board.selectNoticeAttachList", boardNo);
	}

	@Override
	public int updateNoticeview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateNoticeview", board);
	}

	@Override
	public int updateNoticeAttach(Attach att) {
		return sqlSession.insert("board.updateNoticeAttach", att);
	}

	@Override
	public int deleteNotice(int boardNo) {
		return sqlSession.delete("board.deleteNotice", boardNo);
	}

	@Override
	public int deleteNoticeAttach(int boardNo) {
		return sqlSession.delete("board.deleteNoticeAttachment", boardNo);
	}

	@Override
	public int deleteNoticeFile(int attNo) {
		return sqlSession.delete("board.deleteNoticeFile", attNo);
	}

	////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectReorganizationlist(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectReorganizationList",null, rows);
	}

	@Override
	public int selectReorganizationTotalContents() {
		return sqlSession.selectOne("board.selectReorganizationTotalContents");
	}

	@Override
	public int insertReorganizationform(Board board) {
		return sqlSession.insert("board.insertReorganizationform", board);
	}

	@Override
	public int insertReorganizationAttach(Attach att) {
		return sqlSession.insert("board.insertReorganizationAttach", att);
	}

	@Override
	public Board selectOneReorganizationdetail(int boardNo) {
		return sqlSession.selectOne("board.selectOneReorganizationdetail", boardNo);
	}

	@Override
	public List<Attach> selectReorganizationAttachList(int boardNo) {
		return sqlSession.selectList("board.selectReorganizationAttachList", boardNo);
	}

	@Override
	public int updateReorganizationview(Board board, List<Attach> attachList) {
		return sqlSession.update("board.updateReorganizationview", board);
	}

	@Override
	public int updateReorganizationAttach(Attach att) {
		return sqlSession.insert("board.updateReorganizationAttach", att);
	}

	@Override
	public int deleteReorganization(int boardNo) {
		return sqlSession.delete("board.deleteReorganization", boardNo);
	}

	@Override
	public int deleteReorganizationAttach(int boardNo) {
		return sqlSession.delete("board.deleteReorganizationAttachment", boardNo);
	}

	@Override
	public int deleteReorganizationFile(int attNo) {
		return sqlSession.delete("board.deleteReorganizationFile", attNo);
	}

}
