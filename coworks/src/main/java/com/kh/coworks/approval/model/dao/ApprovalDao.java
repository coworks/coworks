package com.kh.coworks.approval.model.dao;

import java.util.List;

import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;

public interface ApprovalDao {

	List<String> selectApprovalFormFolderList();

	List<ApprovalForm> selectApprovalFormList(String aform_folderName);

	List<ApprovalForm> searchApprovalForm(String search);

	int insertApprovalDoc(ApprovalDoc doc);

	int insertApprovalSign(ApprovalStatus sign);

	int insertApprovalAttach(ApprovalAttach attach);

	ApprovalDoc selectOneApprovalDoc(int adoc_no);

	List<ApprovalAttach> selectApprovalAttach(int adoc_no);

	List<ApprovalStatus> selectApprovalStatus(int adoc_no);

	ApprovalForm selectApprovalDocForm(int aform_no);

	List<ApprovalDoc> selectApprovalYet(int emp_no);

	List<ApprovalDoc> selectApprovalPending(int emp_no);

	void updateApprovalStatus(ApprovalStatus st);

}
