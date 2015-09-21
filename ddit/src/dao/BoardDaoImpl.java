package dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.config.BuildedSqlMapClient;

import com.ibatis.sqlmap.client.SqlMapClient;

import vo.BoardVO;

public class BoardDaoImpl implements BoardDao {
	
	
	private BoardDaoImpl(){client = BuildedSqlMapClient.getSqlMapClient();}
	
	private static BoardDao dao = null;
	private SqlMapClient client = null;
	
	public static BoardDao getInstance(){
		if(dao==null){
			dao = new BoardDaoImpl();
		}
		return dao;
	}
	

	@Override
	public String insertboardinfo(BoardVO boardinfo) throws SQLException {
		
		return  (String) client.insert("board.insertboardinfo", boardinfo);
	}


	@Override
	public List<BoardVO> getboardlist() throws SQLException {
		
		return client.queryForList("board.getboardlist");
	}
}
