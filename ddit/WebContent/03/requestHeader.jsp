<%@page import="java.util.Enumeration"%>
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
	요청 : 요청라인       - 서버로 해당 요청시의 method 방식, 프로토콜의 타입과 버젼, url
		   요청헤더       - 지역정보, 브라우저의 정보, 클라이언트의 IP 등의 메타정보
		   요청바디(본문) - method=post일때 서버로 전송되는 Data
	응답 : 응답라인 	  - 프로토콜의 타입과 버젼, 서버의 해당 요청 처리 결과 코드
		   응답헤더 	  - 응답바디를 구성하는 컨텐츠의 타입과 인코딩 설정, 클라이언트의 IP 등의 메타정보
		   응답바디 	  - 브라우저로 전송되는 문자열 기반의 javascript, html 컨텐츠
 -->
<%
	Enumeration<String> enums =  request.getHeaderNames();
		while(enums.hasMoreElements()){
			String headerKey = enums.nextElement();
			String headerValue = request.getHeader(headerKey);
			
			out.println(headerKey+" : "+headerValue+"<br>");
		}
		
		String userAgent = request.getHeader("user-agent");
			out.println("<hr>");
			out.println("<font color = 'red'>당신의 브라우져는</font>");
		if(userAgent.contains("MSIE")){
			out.println("마이크로소프트의 인터넷익스클러러");
		}
		if(userAgent.contains("Chrome")){
			out.println("구글의 크롬프라우저");
		}
		String[] mobileKeyword = new String[]{"Android", "iPhone"};
		for(String mobile : mobileKeyword){
			if(userAgent.contains(mobile)){
				response.sendRedirect("/ddit/mobile/index.jsp");
			}
		}
%>


</body>
</html>