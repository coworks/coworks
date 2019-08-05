package com.kh.coworks.dm.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.dm.model.vo.DM;

@Repository
public class DMDaoImpl implements DMDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int dmListCount(int emp_no) {
		return sqlSession.selectOne("dm.dmListCount",emp_no);
	}

	@Override
	public List<DM> dmList(int cPage, int limit, int emp_no) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("dm.dmList",emp_no,rows);
	}

	@Override
	public List<DM> sendDmList(int cPage, int limit, int emp_no) {
		RowBounds rows = new RowBounds((cPage-1)*limit,limit);
		System.out.println(rows);
		return sqlSession.selectList("dm.sendDmList",emp_no,rows);
	}

	@Override
	public int sendDmListCount(int emp_no) {
		return sqlSession.selectOne("dm.sendDmListCount",emp_no);
	}

	@Override
	public List<DM> delDmList(int cPage, int limit, int emp_no) {
		RowBounds rows = new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("dm.delDmList",emp_no,rows);
	}

	@Override
	public int delDmListCount(int emp_no) {
		return sqlSession.selectOne("dm.delDmListCount",emp_no);
	}

	@Override
	public int insertDM(DM dm) {
		return sqlSession.insert("dm.insertDM",dm);
	}

	@Override
	public int insertDMTo(int dm_to) {
		return sqlSession.insert("dm.insertDMTo",dm_to);
	}

	@Override
	public DM selectOneDm(int dm_no) {
		return sqlSession.selectOne("dm.selectOneDm",dm_no);
	}




}
