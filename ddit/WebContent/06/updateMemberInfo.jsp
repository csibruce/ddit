<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//memberview.jsp -> 파라메터 취득 -> service layer -> dao layer -> DB
	//			수정데이타											update
	//update처리 후 memberLisst.jsp 로 포워딩 처리
	request.setCharacterEncoding("UTF-8");
	MemberVO memberInfo = new MemberVO();
	try{
	BeanUtils.populate(memberInfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	
	IMemberService service = IMemberServiceImpl.getInstance();
	int update = service.updateMemberInfo(memberInfo);
	
	RequestDispatcher rd = request.getRequestDispatcher("/06/main.jsp");
	rd.forward(request, response);

%>
