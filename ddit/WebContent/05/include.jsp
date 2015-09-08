<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	include 디렉티브 : 선언된 file 속성의 대상 파일의 컨텐츠를 포함하는 서블릿클래스를 작성 후 활용.
	
	include.jsp -> 전처리: include 디렉티브의 file속성에 선언된 대상파일 컨텐츠를 취득 후
				    include_jsp.java를 build.
 -->
<%
	String message = "include 디렉티브를 활용한 외부 파일 컨텐츠 접근";
%>
<%@ include file="includeTargetFile.txt" %>
<!--%=realPath %><br-->
</body>
</html>