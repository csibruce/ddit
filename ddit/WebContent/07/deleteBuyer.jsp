<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String buyer_id = request.getParameter("buyer_id");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	int deleteCnt = service.deleteBuyer(buyer_id);
	
	response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=/07/buyerList.jsp");
	
	
	

%>
