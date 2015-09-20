package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.BuyerVO;
import vo.LprodVO;
import vo.MemberVO;
import vo.ProdVO;

public interface IMemberDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> getMemberList() throws SQLException;
	public int updateMemberInfo(MemberVO memberInfo) throws SQLException;
	public int deleteMemberInfo(String mem_id) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	
	
	public List<BuyerVO> getBuyerList() throws SQLException;
	public BuyerVO getbuyerInfo(String buyer_id) throws SQLException;
	public int updateBuyerInfo(BuyerVO buyerinfo) throws SQLException;
	public String insertBuyer(BuyerVO buyerinfo) throws SQLException;
	public int deleteBuyer(String buyer_id) throws SQLException;
	
	public List<ProdVO> getprodList() throws SQLException;
	public List<LprodVO> getlprodList() throws SQLException;
	
	public String insertProd(ProdVO prodInfo) throws SQLException;
	
	public String getprodid(String prodid) throws SQLException;

}
