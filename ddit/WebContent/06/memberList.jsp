<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberlist = service.getMemberList();


%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
</head>
<body onload="logincheck()">
<div id="list">
<table style="width: 600px;">
	<thead>
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>주민번호1</th>
			<th>주민번호2</th>
		</tr>
	</thead>
	<tbody>
	<% 	if(session.getAttribute("LOGIN_MEMBERINFO")!=null){
		for(MemberVO memberinfo : memberlist){  %>
		<tr>
			<th><%=memberinfo.getMem_id() %></th>
			<th><%=memberinfo.getMem_pass() %></th>
			<th><a style="cursor:pointer" href="<%=request.getContextPath()%>/06/main.jsp?contentPage=memberForm.jsp&id=<%=memberinfo.getMem_id() %>"><%=memberinfo.getMem_name() %></a></th>
			<th><%=memberinfo.getMem_regno1() %></th>
			<th><%=memberinfo.getMem_regno2() %></th>
		</tr>
	
	<% }} %>
	</tbody>
</table>
<div id="needlogin"><br><br>로그인을 하시면 <br><br>회원리스트를 보실 수 있습니다.<br></div>
<div style="width: 600px; text-align: right; margin-top: 10px;">
	<input type="button" value="회원등록" onclick="javascript:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=memberForm.jsp'">
</div>
</div>
</body>
</html>








