<%@page import="java.util.Map"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 	ProdVO prodInfo = new ProdVO();
 	String ddd = request.getParameter("prod_name");
	Map<String,String[]> dd = request.getParameterMap();
	try{
		BeanUtils.populate(prodInfo, request.getParameterMap());
		IMemberService service = IMemberServiceImpl.getInstance();
		String prodname = service.insertProd(prodInfo);
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}


%>