package com.kh.coworks.approval.model.service;

import java.util.List;

import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;

public interface ApprovalService {

	static final int APPROVAL_SRV_ERROR = 0;
	static final int APPROVAL_SRV_COMP = 1;

	List<String> selectApprovalFormFolderList();

	List<ApprovalForm> selectApprovalFormList(String aform_folderName);

	List<ApprovalForm> searchApprovalForm(String search);

	int insertApprovalDoc(ApprovalDoc doc, List<ApprovalStatus> signList, List<ApprovalAttach> fileList);

	ApprovalDoc selectOneApprovalDoc(int adoc_no);

	List<ApprovalAttach> selectApprovalAttach(int adoc_no);

	List<ApprovalStatus> selectApprovalStatus(int adoc_no);

	ApprovalForm selectApprovalDocForm(int aform_no);

}
