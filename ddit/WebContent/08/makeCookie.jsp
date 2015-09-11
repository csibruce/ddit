<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// mem_id=a001;path=/;domain=localhost
	// cookie의 유효시간 : setMaxAge(초단위 설정). -1브라우져 종료시 삭제(default)
	//										   0즉시삭제
	Cookie idCookie = new Cookie("mem_id","a001");
	idCookie.setPath("/");
	
	Cookie pwdCookie = new Cookie("mem_pass","asdfasdf");
	pwdCookie.setPath("/");
	// 초단위 설정
	pwdCookie.setMaxAge(60*60);
	
	Cookie nameCookie = new Cookie("mem_name", 
			URLEncoder.encode("김은대","UTF-8"));
	nameCookie.setPath("/ddit/08/");
	
	Cookie telCookie = new Cookie("mem_hometel", "042-222-8202");
	telCookie.setPath("/");
	telCookie.setDomain("cafe.ddit.or.kr");
	
	response.addCookie(idCookie);
	response.addCookie(pwdCookie);
	response.addCookie(nameCookie);
	response.addCookie(telCookie);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키 잘 구워졌습니다
.
</body>
</html>