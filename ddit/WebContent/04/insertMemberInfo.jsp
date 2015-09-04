<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//memberForm.jsp   -> 취득 -> 서비스레이어 -> 다오레이어 -> 디비
	//      회원가입데이타                                     insert
	//loginForm.jsp로 리다이렉트
	
	request.setCharacterEncoding("UTF-8");
	MemberVO memberInfo = new MemberVO();
	
	try{
		BeanUtils.populate(memberInfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	
	IMemberService service = IMemberServiceImpl.getInstance();
	String mem_name = service.insertMemberInfo(memberInfo);
	
	response.sendRedirect("/ddit/04/loginForm.jsp");
	
%>

