package com.kh.coworks.approval.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.approval.model.dao.ApprovalDao;
import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao approvalDao;

	@Override
	public List<String> selectApprovalFormFolderList() {
		return approvalDao.selectApprovalFormFolderList();
	}

	@Override
	public List<ApprovalForm> selectApprovalFormList(String aform_folderName) {
		return approvalDao.selectApprovalFormList(aform_folderName);
	}

	@Override
	public List<ApprovalForm> searchApprovalForm(String search) {
		return approvalDao.searchApprovalForm(search);
	}

	@Override
	public int insertApprovalDoc(ApprovalDoc doc, List<ApprovalStatus> signList, List<ApprovalAttach> fileList) {
		approvalDao.insertApprovalDoc(doc);

		for (ApprovalStatus sign : signList)
			approvalDao.insertApprovalSign(sign);

		for (ApprovalAttach attach : fileList)
			approvalDao.insertApprovalAttach(attach);

		return 0;
	}
}
