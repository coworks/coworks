package com.kh.coworks.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.board.model.dao.BoardDao;
import com.kh.coworks.board.model.exception.BoardException;
import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Map<String, String>> selectBusinessdoc(int cPage, int limit) {
		return boardDao.selectBusinessdocList(cPage, limit);
	}

	@Override
	public int selectBusinessdocTotalContents() {
		return boardDao.selectBusinessdocTotalContents();
	}

	@Override
	public int insertBusinessdoc(Board board, List<Attach> attachList) {

		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertBusinessdoc(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("업무 자료실 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertBusinessdocAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOnebusinessdocdetail(int boardNo) {
		return boardDao.selectOnebusinessdocdetail(boardNo);
	}

	@Override
	public List<Attach> selectBusinessdocAttachList(int boardNo) {
		return boardDao.selectBusinessdocAttachList(boardNo);
	}

	@Override
	public int updateBusinessdocview(Board board, List<Attach> attachList) {
		
		int result = BOARD_SRV_ERROR;
		
		List<Attach> originList
			= boardDao.selectBusinessdocAttachList(board.getBo_no());
		
		result = boardDao.updateBusinessdocview(board);
	
		if(result == BOARD_SRV_ERROR) throw new BoardException("업무 자료 게시글 수정 실패!");
		
		if(originList.size() > 0) {
			
			result = boardDao.deleteBusinessdoc(board.getBo_no());
			
			if(result == BOARD_SRV_ERROR) throw new BoardException("파일 첨부 에러!");
		}
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.updateBusinessdocAttach(at);
				if(result == BOARD_SRV_ERROR) throw new BoardException();
			}
		}
		
		return result;
	}

	@Override
	public int deleteBusinessdoc(int boardNo) {
		int result = boardDao.deleteBusinessdoc(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectBusinessdocAttachList(boardNo).size()>0) {
			result = boardDao.deleteBusinessdocAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("게시글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteBusinessdocFile(int attNo) {
		return boardDao.deleteBusinessdocFile(attNo);
	}

	////////////////////////////////////////////////////////
	
	
	@Override
	public List<Map<String, String>> selectCompanyruleslist(int cPage, int limit) {
		return boardDao.selectCompanyruleslist(cPage, limit);
	}

	@Override
	public int selectCompanyrulesTotalContents() {
		return boardDao.selectCompanyrulesTotalContents();
	}

	@Override
	public int insertCompanyrule(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertCompanyrule(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("사규 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertCompanyruleAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board companyruledetail(int boardNo) {
		return boardDao.SelectOnecompanyruledetail(boardNo);
	}

	@Override
	public List<Attach> selectCompanyruleAttachList(int boardNo) {
		return boardDao.selectCompanyruleAttachList(boardNo);
	}

	@Override
	public int updateCompanyruleview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCompanyrule(int boardNo) {
		int result = boardDao.deleteCompanyrule(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectCompanyruleAttachList(boardNo).size()>0) {
			result = boardDao.deleteCompanyruleAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("사규 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteCompanyruleFile(int attNo) {
		return boardDao.deleteCompanyruleFile(attNo);
	}

	///////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectDeptdoc(int cPage, int limit) {
		return boardDao.selectDeptdoc(cPage, limit);
	}

	@Override
	public int selectDeptdocTotalContents() {
		return boardDao.selectDeptboardTotalContents();
	}

	@Override
	public int insertDeptdoc(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertDeptdoc(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("부서 자료실 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertDeptdocAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;	
	}

	@Override
	public Board selectOnedeptdocdetail(int boardNo) {
		return boardDao.selectOnedeptdocdetail(boardNo);
	}

	@Override
	public List<Attach> selectDeptdocAttachList(int boardNo) {
		return boardDao.selectDeptdocAttachList(boardNo);
	}

	@Override
	public int updateDeptdocview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDeptdoc(int boardNo) {
		int result = boardDao.deleteDeptdoc(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectDeptdocAttachList(boardNo).size()>0) {
			result = boardDao.deleteDeptdocAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("부서별 자료 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteDeptdocFile(int attNo) {
		return boardDao.deleteDeptdocFile(attNo);
	}

	//////////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectEmpedudoc(int cPage, int limit) {
		return boardDao.selectEmpedudoc(cPage, limit);
	}

	@Override
	public int selectEmpedudocTotalContents() {
		return boardDao.selectEmpedudocTotalContents();
	}

	@Override
	public int insertEmpedudoc(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertEmpedudoc(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("교육 자료 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertEmpedudocAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneempedudocdetail(int boardNo) {
		return boardDao.selectOneempedudocdetail(boardNo);
	}

	@Override
	public List<Attach> selectEmpedudocAttachList(int boardNo) {
		return boardDao.selectEmpedudocAttachList(boardNo);
	}

	@Override
	public int updateEmpedudocview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmpedudoc(int boardNo) {
		int result = boardDao.deleteEmpedudoc(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectEmpedudocAttachList(boardNo).size()>0) {
			result = boardDao.deleteEmpedudocAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("교육자료 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteEmpedudocFile(int attNo) {
		return boardDao.deleteEmpedudocFile(attNo);
	}

	//////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectBulletinboardlist(int cPage, int limit) {
		return boardDao.selectBulletinboardlist(cPage, limit);
	}

	@Override
	public int selectBulletinboardTotalContents() {
		return boardDao.selectBulletinboardTotalContents();
	}

	@Override
	public int insertBulletinboard(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertBulletinboard(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("게시판 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertBulletinboardAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneBulletinboarddetail(int boardNo) {
		return boardDao.selectOneBulletinboarddetail(boardNo);
	}

	@Override
	public List<Attach> selectBulletinboardAttachList(int boardNo) {
		return boardDao.selectBulletinboardAttachList(boardNo);
	}

	@Override
	public int updateBulletinboardview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBulletinboard(int boardNo) {
		int result = boardDao.deleteBulletinboard(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectBulletinboardAttachList(boardNo).size()>0) {
			result = boardDao.deleteBulletinboardAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("자유게시판 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteBulletinboardFile(int attNo) {
		return boardDao.deleteBulletinboardFile(attNo);
	}

	///////////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectDeptboardlist(int cPage, int limit) {
		return boardDao.selectDeptboardlist(cPage, limit);
	}

	@Override
	public int selectDeptboardTotalContents() {
		return boardDao.selectDeptboardTotalContents();
	}

	@Override
	public int insertDeptboard(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertDeptboard(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("부서 게시판 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertDeptboardAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneDeptboarddetail(int boardNo) {
		return boardDao.selectOneDeptboarddetail(boardNo);
	}

	@Override
	public List<Attach> selectDeptboardAttachList(int boardNo) {
		return boardDao.selectDeptboardAttachList(boardNo);
	}

	@Override
	public int updateDeptboardview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDeptboard(int boardNo) {
		int result = boardDao.deleteDeptboard(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectDeptboardAttachList(boardNo).size()>0) {
			result = boardDao.deleteDeptboardAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("부서게시판 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteDeptboardFile(int attNo) {
		return boardDao.deleteDeptboardFile(attNo);
	}

	///////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectFamilyeventlist(int cPage, int limit) {
		return boardDao.selectFamilyeventlist(cPage, limit);
	}

	@Override
	public int selectFamilyeventTotalContents() {
		return boardDao.selectFamilyeventTotalContents();
	}

	@Override
	public int insertFamilyevent(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertFamilyevent(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("경조사 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertFamilyeventAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneFamilyeventdetail(int boardNo) {
		return boardDao.selectOneFamilyeventdetail(boardNo);
	}

	@Override
	public List<Attach> selectFamilyeventAttachList(int boardNo) {
		return boardDao.selectFamilyeventAttachList(boardNo);
	}

	@Override
	public int updateFamilyeventview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFamilyevent(int boardNo) {
		int result = boardDao.deleteFamilyevent(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectFamilyeventAttachList(boardNo).size()>0) {
			result = boardDao.deleteFamilyeventAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("경조사 게시글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteFamilyeventFile(int attNo) {
		return boardDao.deleteFamilyeventFile(attNo);
	}

	/////////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectNewsboardlist(int cPage, int limit) {
		return boardDao.selectNewsboardlist(cPage, limit);
	}

	@Override
	public int selectNewsboardTotalContents() {
		return boardDao.selectNewsboardTotalContents();
	}

	@Override
	public int insertNewsboard(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertNewsboard(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("News 게시판 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertNewsboardAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneNewsboarddetail(int boardNo) {
		return boardDao.selectOneNewsboarddetail(boardNo);
	}

	@Override
	public List<Attach> selectNewsboardAttachList(int boardNo) {
		return boardDao.selectNewsboardAttachList(boardNo);
	}

	@Override
	public int updateNewsboardview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNewsboard(int boardNo) {
		int result = boardDao.deleteNewsboard(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectNewsboardAttachList(boardNo).size()>0) {
			result = boardDao.deleteNewsboardAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("게시글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteNewsboardFile(int attNo) {
		return boardDao.deleteNewsboardFile(attNo);
	}

	///////////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectNoticelist(int cPage, int limit) {
		return boardDao.selectNoticelist(cPage, limit);
	}

	@Override
	public int selectNoticeTotalContents() {
		return boardDao.selectNoticeTotalContents();
	}

	@Override
	public int insertNoticeform(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertNoticeform(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("공지사항 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertNoticeAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneNoticedetail(int boardNo) {
		return boardDao.selectOneNoticedetail(boardNo);
	}

	@Override
	public List<Attach> selectNoticeAttachList(int boardNo) {
		return boardDao.selectNoticeAttachList(boardNo);
	}

	@Override
	public int updateNoticeview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int boardNo) {
		int result = boardDao.deleteNotice(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectNoticeAttachList(boardNo).size()>0) {
			result = boardDao.deleteNoticeAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("공지사항 글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteNoticeFile(int attNo) {
		return boardDao.deleteNoticeFile(attNo);
	}

	/////////////////////////////////////////////////////////////////
	
	@Override
	public List<Map<String, String>> selectReorganizationlist(int cPage, int limit) {
		return boardDao.selectReorganizationlist(cPage, limit);
	}

	@Override
	public int selectReorganizationTotalContents() {
		return boardDao.selectReorganizationTotalContents();
	}

	@Override
	public int insertReorganizationform(Board board, List<Attach> attachList) {
		int result = BOARD_SRV_ERROR;
		
		result = boardDao.insertReorganizationform(board);
		if(result == BOARD_SRV_ERROR) throw new BoardException("조직개편 및 인사 게시판 글 추가 실패");
		
		if(attachList.size() > 0) {
			for(Attach at : attachList) {
				result = boardDao.insertReorganizationAttach(at);
				
				throw new BoardException("트랜잭션 처리");
			}
		}
		
		return result;
	}

	@Override
	public Board selectOneReorganizationdetail(int boardNo) {
		return boardDao.selectOneReorganizationdetail(boardNo);
	}

	@Override
	public List<Attach> selectReorganizationAttachList(int boardNo) {
		return boardDao.selectReorganizationAttachList(boardNo);
	}

	@Override
	public int updateReorganizationview(Board board, List<Attach> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReorganization(int boardNo) {
		int result = boardDao.deleteReorganization(boardNo);
		
		if(result > BOARD_SRV_ERROR && boardDao.selectReorganizationAttachList(boardNo).size()>0) {
			result = boardDao.deleteReorganizationAttach(boardNo);
		} else if(result > BOARD_SRV_ERROR) {
			result = BOARD_SRV_COMP;
		} else {
			throw new BoardException("부서개편 및 인사이동 게시글 삭제 실패!");
		}
		return result;
	}

	@Override
	public int deleteReorganizationFile(int attNo) {
		return boardDao.deleteReorganizationFile(attNo);
	}

}
