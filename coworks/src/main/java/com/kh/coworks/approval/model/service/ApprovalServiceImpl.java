package com.kh.coworks.approval.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.approval.model.dao.ApprovalDao;
import com.kh.coworks.approval.model.exception.ApprovalException;
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
		int result = APPROVAL_SRV_ERROR;

		result = approvalDao.insertApprovalDoc(doc);
		if (result == APPROVAL_SRV_ERROR)
			throw new ApprovalException();

		if (signList.size() > 0) {
			for (ApprovalStatus sign : signList) {
				sign.setAdoc_no(doc.getAdoc_no());;
				result = approvalDao.insertApprovalSign(sign);

				if (result == APPROVAL_SRV_ERROR)
					throw new ApprovalException();
			}
		}

		if (fileList.size() > 0) {
			for (ApprovalAttach attach : fileList) {
				attach.setAdoc_no(doc.getAdoc_no());
				approvalDao.insertApprovalAttach(attach);

				if (result == APPROVAL_SRV_ERROR)
					throw new ApprovalException();
			}
		}
		
		return result;
	}
	
	@Override
	public ApprovalDoc selectOneApprovalDoc(int adoc_no) {
		return approvalDao.selectOneApprovalDoc(adoc_no);
	}

	@Override
	public List<ApprovalAttach> selectApprovalAttach(int adoc_no) {
		return approvalDao.selectApprovalAttach(adoc_no);
	}

	@Override
	public List<ApprovalStatus> selectApprovalStatus(int adoc_no) {
		return approvalDao.selectApprovalStatus(adoc_no);
	}

	@Override
	public ApprovalForm selectApprovalDocForm(int aform_no) {
		return approvalDao.selectApprovalDocForm(aform_no);
	}

	@Override
	public List<ApprovalDoc> selectApprovalYet(int emp_no) {
		return approvalDao.selectApprovalYet(emp_no);
	}

}
