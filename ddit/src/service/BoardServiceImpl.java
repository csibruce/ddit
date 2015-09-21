package service;

import java.sql.SQLException;
import java.util.List;

import dao.BoardDao;
import dao.BoardDaoImpl;
import vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	private static BoardService service = null;
	private BoardDao dao;
	private BoardServiceImpl(){dao = BoardDaoImpl.getInstance();}
	
	public static BoardService getInstance(){
		if(service==null){
			service = new BoardServiceImpl();
		}
		return service;
	}

	@Override
	public String insertboardinfo(BoardVO boardinfo) {
		String bo_num = "";
		try {
			bo_num = dao.insertboardinfo(boardinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bo_num;
	}

	@Override
	public List<BoardVO> getboardlist() {
		List<BoardVO> boardlist = null;
			try {
				boardlist = dao.getboardlist();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return boardlist;
	}

}
