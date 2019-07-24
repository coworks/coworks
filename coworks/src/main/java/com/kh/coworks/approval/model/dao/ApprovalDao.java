package com.kh.coworks.approval.model.dao;

import java.util.List;

import com.kh.coworks.approval.model.vo.ApprovalForm;

public interface ApprovalDao {

	List<String> selectApprovalFormFolderList();

	List<ApprovalForm> selectApprovalFormList(String aform_folderName);

	List<ApprovalForm> searchApprovalForm(String search);

}
