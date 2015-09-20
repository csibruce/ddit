<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String prodid = request.getParameter("name");

	IMemberService service = IMemberServiceImpl.getInstance();
	String prod_id = service.getprodid(prodid);
	//P101000004
	String temp = prod_id.substring(1);
	int temp1 = Integer.parseInt(temp);
	temp1 = temp1+1;
	prod_id = "P"+temp1;
	out.println(prod_id);

%>
