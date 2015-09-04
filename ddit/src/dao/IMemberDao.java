package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.MemberVO;

public interface IMemberDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> getMemberList() throws SQLException;
	public int updateMemberInfo(MemberVO memberInfo) throws SQLException;
	public int deleteMemberInfo(String mem_id) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
}
