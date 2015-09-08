package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapException;

import dao.IMemberDao;
import dao.IMemberDaoImpl;

import vo.BuyerVO;
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

	@Override
	public int updateMemberInfo(MemberVO memberInfo) {
		int updateCnt = -1;
		try {
			updateCnt = dao.updateMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCnt;
	}

	@Override
	public int deleteMemberInfo(String mem_id) {
		int deleteCnt = -1;
		try {
			deleteCnt = dao.deleteMemberInfo(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	@Override
	public String insertMemberInfo(MemberVO memberInfo) {
		String mem_id = "";
		try {
			mem_id = dao.insertMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return mem_id;
	}

	@Override
	public List<BuyerVO> getBuyerList() {
		List<BuyerVO> buyerList = null;
		try {
			buyerList = dao.getBuyerList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerList;
	}

	@Override
	public BuyerVO getbuyerInfo(String buyer_id) {
		BuyerVO buyerinfo = null;
		try {
			buyerinfo = dao.getbuyerInfo(buyer_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerinfo;
	}

	@Override
	public int updateBuyerInfo(BuyerVO buyerinfo) {
		int updateCnt = -1;
		try {
			updateCnt = dao.updateBuyerInfo(buyerinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCnt;
	}

	@Override
	public String insertBuyer(BuyerVO buyerinfo) {
		String buyer_name = "";
		try {
			buyer_name = dao.insertBuyer(buyerinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyer_name;
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		int deleteCnt = -1;
		try {
			deleteCnt = dao.deleteBuyer(buyer_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

}
