<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="vo.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	MemberVO memberinfo = new MemberVO();
	try{
		BeanUtils.populate(memberinfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	IMemberService service = IMemberServiceImpl.getInstance();
	String mem_name = service.insertMemberInfo(memberinfo);
	
	response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=memberList.jsp");
%>
