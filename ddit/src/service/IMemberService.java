package service;

import java.util.List;
import java.util.Map;

import vo.BuyerVO;
import vo.LprodVO;
import vo.MemberVO;
import vo.ProdVO;

public interface IMemberService {
	public MemberVO getMemberInfo(Map<String, String> params);
	public List<MemberVO> getMemberList();
	public int updateMemberInfo(MemberVO memberInfo);
	public int deleteMemberInfo(String mem_id);
	public String insertMemberInfo(MemberVO memberInfo);
	
	
	public List<BuyerVO> getBuyerList();
	public BuyerVO getbuyerInfo(String buyer_id);
	public int updateBuyerInfo(BuyerVO buyerinfo);
	public String insertBuyer(BuyerVO buyerinfo);
	public int deleteBuyer(String buyer_id);
	
	public List<ProdVO> getprodList();
	public List<LprodVO> getlprodList();
	public String insertProd(ProdVO prodInfo);
	public String getprodid(String prodid);
}
