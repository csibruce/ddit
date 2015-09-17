package kr.or.ddit.zipcode.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import vo.ZipcodeVO;
import kr.or.ddit.ibatis.config.BuildedSqlMapClient;
import kr.or.ddit.zipcode.service.IZipcodeService;

public class IZipcodeDaoImpl implements IZipcodeDao {
	private static IZipcodeDao dao = null;
	private SqlMapClient client = null;
	private IZipcodeDaoImpl(){
		client = BuildedSqlMapClient.getSqlMapClient();
	}
	public static IZipcodeDao getInstance(){
		if(dao==null)
			dao = new IZipcodeDaoImpl();
		return dao;
	}
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
	 return client.queryForList("zipcode.zipcodeList",params);
	}
	
	

}
