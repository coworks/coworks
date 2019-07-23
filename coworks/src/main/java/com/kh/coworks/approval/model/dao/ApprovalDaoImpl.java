package com.kh.coworks.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.approval.model.vo.ApprovalForm;

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

}
