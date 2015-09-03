package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapException;

import dao.IMemberDao;
import dao.IMemberDaoImpl;

import vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {
	
	private static IMemberService service = null;
	
	private IMemberServiceImpl(){
		
		dao = IMemberDaoImpl.getInstance();
		
	}
	
	private IMemberDao dao = null;
	
	public static IMemberService getInstance(){
		if(service==null)
			service = new IMemberServiceImpl();
			return service;
		
	}
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.getMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.getMemberList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

}
