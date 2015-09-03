package service;

import java.util.List;
import java.util.Map;

import vo.MemberVO;

public interface IMemberService {
	public MemberVO getMemberInfo(Map<String, String> params);
	public List<MemberVO> getMemberList();
}
