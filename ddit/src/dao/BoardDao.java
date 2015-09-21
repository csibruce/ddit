package dao;

import java.sql.SQLException;
import java.util.List;

import vo.BoardVO;

public interface BoardDao {
	public String insertboardinfo(BoardVO boardinfo) throws SQLException;
	public List<BoardVO> getboardlist() throws SQLException;
}
