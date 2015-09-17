package kr.or.ddit.zipcode.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.zipcode.dao.IZipcodeDao;
import kr.or.ddit.zipcode.dao.IZipcodeDaoImpl;

import vo.ZipcodeVO;

/*
 * IZipcodeServiceImpl impl1 = new IZipcodeServiceImpl();  0xFA11
 * IZipcodeServiceImpl impl2 = new IZipcodeServiceImp2();  0xFC1
 * IZipcodeServiceImpl impl3 = new IZipcodeServiceImp3();  0xFA12
 * IZipcodeServiceImpl impl4 = new IZipcodeServiceImp4();  0xFA13
 * IZipcodeServiceImpl impl5 = new IZipcodeServiceImp5();  0xFA15
 * 
 *
 */
public class IZipcodeServiceImpl implements IZipcodeService {
	
	private static IZipcodeService service = null;
	private IZipcodeDao dao = null;
	private IZipcodeServiceImpl(){
		dao = IZipcodeDaoImpl.getInstance();
	}
	public static IZipcodeService getInstance(){
		if(service == null)
			service = new IZipcodeServiceImpl();
		return service;
	}
	
	
	
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) {
		List<ZipcodeVO> zipcodeList =null;
		try {
			zipcodeList = dao.getZipcodeList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipcodeList;
	}

}
