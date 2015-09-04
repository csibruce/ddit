<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//memberview.jsp -> 취득 -> 서비스레이어 ->다오레이어 -> 디비
	//				mem_id						delete
	//memberlist.jsp 리다이랙트
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	int delectCnt = service.deleteMemberInfo(mem_id);
	
	response.sendRedirect("/ddit/04/memberList.jsp");
%>    
