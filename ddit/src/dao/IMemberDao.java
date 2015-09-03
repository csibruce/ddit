package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.MemberVO;

public interface IMemberDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> getMemberList() throws SQLException;
}
