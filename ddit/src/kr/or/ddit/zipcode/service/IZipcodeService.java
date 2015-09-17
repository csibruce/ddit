package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import vo.ZipcodeVO;

public interface IZipcodeService {
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params);
}
