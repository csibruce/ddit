<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 특정 공인IP의 추적 (인터넷진흥원)
	String requestAddress = request.getRemoteAddr();
	BufferedReader reader = null;
	
	URL url = new URL("http://whois.kisa.or.kr/openapi/whois.jsp?query="+
					  "1.212.157.145&key=2013031411411712681352");
	InputStream is = url.openStream();
	reader = new BufferedReader(new InputStreamReader(is));
	
	String line = "";
	
	while((line = reader.readLine()) != null){
		line = line.trim();
		if(line.isEmpty()){
			continue;
		}
		out.println(line+"<br>");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
클라이언트의 IP주소 : <%=request.getRemoteAddr() %><br>
클라이언트의 HOST : <%=request.getRemoteHost() %><br>
클라이언트의 PORT : <%=request.getRemotePort() %><br>
클라이언트의 USER : <%=request.getRemoteUser() %><br>
서버포트 : <%=request.getServerPort() %><br>
요청시의 URI : <%=request.getRequestURI() %><br>
서버네임 : <%=request.getServerName() %><br>
</body>
</html>
