<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String message = request.getParameter("msg");
	application.log("msg : "+message);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>`
	<!--ui object -->
	<ul class="tab_menu">
		<li><a href="<%=request.getContextPath()%>/06/main.jsp" class="selected">HOME</a></li>
		<li><a href="<%=request.getContextPath()%>/06/main.jsp">회원리스트</a></li>
		<li><a href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/07/buyerList.jsp">거래처</a></li>
		<li><a href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/09/prodList.jsp">상품</a></li>
		<li><a href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/13/boardList.jsp">게시판</a></li>
		<li><a href="#">메뉴6</a></li>
		<li><a href="#">메뉴7</a></li>
		<li><a href="#">메뉴8</a></li>
		<li><a href="#">메뉴9</a></li>
	</ul>
	<!--//ui object -->
</body>
</html>