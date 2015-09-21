package service;

import java.util.List;

import vo.BoardVO;

public interface BoardService {
	public String insertboardinfo(BoardVO boardinfo);
	public List<BoardVO> getboardlist();
}
