<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dan = request.getParameter("dan");
%>
<%!
	private int multiple(int b, int a){
		
		return a*b;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
	method = get 요청시 브라우져별 전달 파라메터 최대사이즈
				 IE				: 2048byte
				 FireFox		: 100kb
				 Chrome, safari	: 100kb
				 Opera			: 200kb
				 
	method = post 사이즈 제한 없음.
</pre>

<h3>구구단 출력</h3>
<%=dan %>단<br>

<%
int or = Integer.parseInt(dan);
for(int i = 1; i <10 ; i++){%>

<%=dan%>*<%=i %>= <%= multiple(or,i) %><br>

<%	
}
%>



</body>
</html>