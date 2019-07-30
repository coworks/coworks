package com.kh.coworks.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<String> selectApprovalFormFolderList() {
		return sqlSession.selectList("approval.selectApprovalFormFolderList");
	}

	@Override
	public List<ApprovalForm> selectApprovalFormList(String aform_folderName) {
		return sqlSession.selectList("approval.selectApprovalFormList", aform_folderName);
	}

	@Override
	public List<ApprovalForm> searchApprovalForm(String search) {
		return sqlSession.selectList("approval.searchApprovalForm", search);
	}

	@Override
	public int insertApprovalDoc(ApprovalDoc doc) {
		return sqlSession.insert("approval.insertApprovalDoc", doc);
	}

	@Override
	public int insertApprovalSign(ApprovalStatus sign) {
		return sqlSession.insert("approval.insertApprovalStatus", sign);
	}

	@Override
	public int insertApprovalAttach(ApprovalAttach attach) {
		return sqlSession.insert("approval.insertApprovalAttach", attach);
	}

	@Override
	public ApprovalDoc selectOneApprovalDoc(int adoc_no) {
		return sqlSession.selectOne("approval.selectOneApprovalDoc", adoc_no);
	}

	@Override
	public List<ApprovalAttach> selectApprovalAttach(int adoc_no) {
		return sqlSession.selectList("approval.selectApprovalAttach", adoc_no);
	}

	@Override
	public List<ApprovalStatus> selectApprovalStatus(int adoc_no) {
		return sqlSession.selectList("approval.selectApprovalStatus", adoc_no);
	}

	@Override
	public ApprovalForm selectApprovalDocForm(int aform_no) {
		return sqlSession.selectOne("approval.selectApprovalDocForm", aform_no);
	}


	@Override
	public List<ApprovalDoc> selectApprovalReceive(int emp_no) {
		return sqlSession.selectList("approval.selectApprovalReceive", emp_no);
	}

	@Override
	public void updateApprovalStatus(ApprovalStatus st) {
		sqlSession.update("approval.updateApprovalStatus", st);

	}

	@Override
	public List<ApprovalDoc> selectApprovalComplete(int emp_no) {
		return sqlSession.selectList("approval.selectApprovalComplete", emp_no);

	}

	@Override
	public List<ApprovalDoc> selectApprovalWait(int emp_no) {
		return sqlSession.selectList("approval.selectApprovalWait", emp_no);

	}

	@Override
	public List<ApprovalDoc> selectApprovalSubmit(int emp_no) {
		return sqlSession.selectList("approval.selectApprovalSubmit", emp_no);

	}

}
