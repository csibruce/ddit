<!--  response.setCharactorEncoding("UTF-8");-->



<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int calc(int i, int j){
		return i*j;
	}

%>    
<%
	Date date = new Date();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>jsp 파일의 구조</h3>
<pre>
	1. 디렉티브 : jsp 파일내부 설정. java 코드의 import 선언. jsp내에서 활용될 자원의 선언.
				 &lt;%@ %&gt;
				 
	2. 스크립트릿 : jsp 파일내에서 java 프로그래밍 영역.
				&lt;%  %&gt;
				
	3. 디클러레이션 : jsp 파일내에서 메서드 선언.
				&lt;%!  %&gt;
	
	4. 익스프레션 : jsp 파일내에 스크립트릿에 선언된 변수를 활용.
				
</pre>
<%= date %>
<%-- <% --%>
// 	int i = 1/0;
<%-- %> --%>


</body>
</html>