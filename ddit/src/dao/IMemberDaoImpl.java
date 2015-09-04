package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.config.BuildedSqlMapClient;



import com.ibatis.sqlmap.client.SqlMapClient;

import vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = null;
	private SqlMapClient client = null;
	
	private IMemberDaoImpl(){
		client = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static IMemberDao getInstance(){
		if(dao==null)
			dao = new IMemberDaoImpl();
		return dao;
	}
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params)
			throws SQLException {
		
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		
		return client.queryForList("member.memberList");
	}

	@Override
	public int updateMemberInfo(MemberVO memberInfo) throws SQLException {
		
		return client.update("member.updateMemberInfo", memberInfo);
	}

	@Override
	public int deleteMemberInfo(String mem_id) throws SQLException {
	
		return client.delete("member.deleteMemberInfo", mem_id);
	}

	@Override
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		
		return (String) client.insert("member.insertMemberInfo", memberInfo);
	}

}
