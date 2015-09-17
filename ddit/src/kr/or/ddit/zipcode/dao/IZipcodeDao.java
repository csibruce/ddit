package kr.or.ddit.zipcode.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.ZipcodeVO;

public interface IZipcodeDao {
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException;
}
