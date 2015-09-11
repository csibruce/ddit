<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//클라이언트단에 쿠키 저장소에 저장된 쿠키는 쿠키 생성시 선언된 path, domain 조건을 통해서
	//웹서버로 전송될 쿠키와 전송되지 않을 쿠키가 구분.
	Cookie[] cookies =  request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
%>			

		쿠키이름: <%=cookie.getName() %><br>
		값: <%=URLDecoder.decode(cookie.getValue(),"UTF-8")%><br>	
<%			
		}
	}
%>
</body>
</html>