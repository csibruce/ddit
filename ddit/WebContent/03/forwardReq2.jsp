<%@page import="java.util.Map"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>request</h3>
<%
	MemberVO requestValue = (MemberVO)request.getAttribute("memberInfo");
	if(requestValue!=null){
%>
mem_id : <%=requestValue.getMem_id() %><br> 
mem_pass : <%=requestValue.getMem_pass() %><br> 
mem_name : <%=requestValue.getMem_name() %><br>
<%} %>
el mem_id = ${requestScope.memberInfo.mem_id }<br>
el mem_pass = ${requestScope.memberInfo.mem_pass }<br>
el mem_name = ${requestScope.memberInfo.mem_name }<br>
<hr>
<h3>pageContext</h3>
<%
	MemberVO pageContextValue = (MemberVO)pageContext.getAttribute("memberInfo");
if(pageContextValue!=null){
%>
mem_id : <%=pageContextValue.getMem_id() %><br> 
mem_pass : <%=pageContextValue.getMem_pass() %><br>
mem_name : <%=pageContextValue.getMem_name() %><br>
<%} %>

el mem_id : ${pageScope.memberInfo.mem_id }<br>
el mem_pass : ${pageScope.memberInfo.mem_pass } <br>
el mem_name : ${pageScope.memberInfo.mem_name }<br>
<hr>
<h3>session</h3>
<%
	MemberVO sessionValue = (MemberVO)session.getAttribute("memberInfo");
if(sessionValue!=null){
%>
mem_id : <%=sessionValue.getMem_id() %><br> 
mem_pass : <%=sessionValue.getMem_pass() %><br> 
mem_name : <%=sessionValue.getMem_name() %><br>
<%} %>

el mem_id : ${sessionScope.memberInfo.mem_id }<br>
el mem_pass : ${sessionScope.memberInfo.mem_pass } <br>
el mem_name : ${sessionScope.memberInfo.mem_name }<br>
<hr>
<h3>application</h3>
<%
	MemberVO applicationValue = (MemberVO)application.getAttribute("memberInfo");
if(applicationValue!=null){
%>
mem_id : <%=applicationValue.getMem_id() %><br> 
mem_pass : <%=applicationValue.getMem_pass() %><br> 
mem_name : <%=applicationValue.getMem_name() %><br>
<%} %>
el mem_id : ${applicationScope.memberInfo.mem_id }<br>
el mem_pass : ${applicationScope.memberInfo.mem_pass } <br>
el mem_name : ${applicationScope.memberInfo.mem_name }<br>

</body>
</html>