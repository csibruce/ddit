<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page errorPage="/error/errorNumber.jsp"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 특정 jsp 내에서 발생된 익셉션의 처리를 전담하는 jsp의 선언을 페이지 디렉티브의 
	// errorPage속성 정의.(해당 에러 페이지에 포워딩 처리.)
	int i = 1 / 0;
%>
</body>
</html>