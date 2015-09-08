<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
 page buffer="1kb" autoFlush="false"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSP에서 활용되는 response(ServletResponse -> HttpServletResponse)에는
	javascript or html 의 브라우져로 전송되어질 컨텐츠가 저장될 buffer가 존재.
	response 내 buffer는 8kb의 기본 사이즈를 포함.
	jsp내에 out 기본객체와 response.getWriter() 메서드를 통해서 해당 response의
	buffer에 컨텐츠가 저장처리.
	jsp가 build되어 생성되는 Servlet Class내에 _jspService(){}가 종료되면 WAS(톰캣)이
	response 객체 내에 buffer에 저장된 컨텐츠를 Web Server에 전송처리하고 Web Server에 
	의해서 브라우져로 전송처리.
	autoFlush : default true.
				해당 jsp의 buffer에 설정된 사이즈에 저장된 컨텐츠를 브라우져에 전송하고,
				buffer clear 처리.
 -->
 <%
 	for(int i=0; i<50; i++){
 		out.println(out.getBufferSize()+" : "+out.getRemaining()+"<br>");
 		out.println("아무것도 하기싫다. 이미 아무것도 하고 있지않지만, <br>");
 		out.println("좀더 격하게 아무것도 하기싫다. <br>");
 		if(i%10 == 0){
 			//clearbuffer()메서드가 호출되는 시점의 response의 buffer 내 저장된 컨텐츠를 
 			//브라우져로 전송
 			//out.clearBuffer();
 			
 			//jsp의 buffer size에 해상 컨텐츠를 브라우져로 전송 후 buffer clear처리.
 			out.flush();
 		}
 		
 	}
 %>
</body>
</html>