package com.kh.coworks.approval.model.service;

import java.util.List;

import com.kh.coworks.approval.model.vo.ApprovalForm;

public interface ApprovalService {
	
	List<String> selectApprovalFormFolderList();

	List<ApprovalForm> selectApprovalFormList(String aform_folderName);

	List<ApprovalForm> searchApprovalForm(String search);
	

}
