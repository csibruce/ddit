<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
	BuyerVO buyerinfo = new BuyerVO();
	try{
		BeanUtils.populate(buyerinfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	
	IMemberService service = IMemberServiceImpl.getInstance();
	String buyer_name = service.insertBuyer(buyerinfo);
	response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=/07/buyerList.jsp");
	
%>