package com.kh.coworks.common.typeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
/**
 * TypeHandler 는 특정 자료형을 다른 형태로 변환하여
 * DB에 저장하거나 수정, 삭제할 데이터로 활용하고자 할 때
 * 사용한다.
 * Ex) String[] (java) ----> VARCHAR2 (Oracle)
 * 
 * 이 인터페이스를 상속받아 구현하고자 할 때에는 
 * 총 4개의 메소드, <b>3개의 getter</b> 메소드와
 * <b>1개의 setter</b> 메소드를 재정의(오버라이딩)해야 한다.
 * 
 * -- getter --
 * 1. ResultSet에서 컬럼이름으로 Getter를 동작시킬 때
 * 2. ResultSet에서 컬럼 인덱스(순번)로 Getter를 동작시킬 때
 * 3. 프로시저 전용 CallableStatement Getter를 동작시킬 때
 * 
 * -- setter --
 * 1. String[] ---> String
 * ** null로 들어왔을 경우도 계산해야 한다.
 *    단, devLang은 필수 값이기 때문에 생략한다. 
 * 
 * @author DanielYu
 *
 */
public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {

		if(parameter != null) {
			ps.setString(i, String.join(", ", parameter));
		} else {
			ps.setString(i, "NULL");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String str = rs.getString(columnName);
		String[] result = str.split(", ");
		return result;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String str = rs.getString(columnIndex);
		String[] result = str.split(", ");
		return result;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String str = cs.getString(columnIndex);
		String[] result = str.split(", ");
		return result;
	}
}











