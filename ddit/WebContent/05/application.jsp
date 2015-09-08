<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
oracleDriver : <%=application.getInitParameter("oracleDriver") %><br>
oracleURL : <%=application.getInitParameter("oracleURL") %><br>
mysqlDriver : <%=application.getInitParameter("mysqlDriver") %><br>
mysqlURL : <%=application.getInitParameter("mysqlURL") %><br>
Server정보 : <%=application.getServerInfo() %><br>

<!-- 라이브러리 버젼 : 1.2.3 
		major ver. : 1
		minor ver. : 2
		detail ver. : 3
-->
Servlet Spec. : <%=application.getMajorVersion() %>.<%=application.getMinorVersion() %><br>
<%
	log("콘솔에 로그 출력");
	application.log("이클립스 환경에서는 콘솔 로그 출력.");
    application.log("deploy 환경에서는 apache-tomcat-1.0.64설치 폴더 내 logs 폴더.");
    
%>
웹 어플리케이션 Deploy 패스 : <%=application.getRealPath("") %><br>
웹 어플리케이션 Deploy 패스 : <%=request.getRealPath("") %><br>

<%
	String buffer1 = "";
	BufferedReader br1 = new BufferedReader(
							new InputStreamReader(
								new FileInputStream(
									application.getRealPath("/05/readme.txt")),"UTF-8"));
	
	while((buffer1 = br1.readLine()) != null){
		out.println(buffer1+"<br>");
	}
	
	String buffer2 = "";
	//http://localhost/ddit/05/readme.txt
	URL url = application.getResource("/05/readme.txt");
	
	BufferedReader br2 = new BufferedReader(
							new InputStreamReader(url.openStream(),"UTF-8"));
	
	PrintWriter writer =  response.getWriter();
	while((buffer2 = br2.readLine()) != null){
		writer.println(buffer2+"<br>");
	}
	
	
	String buffer3 = "";
	InputStream is = application.getResourceAsStream("05/readme.txt");
	BufferedReader br3 = new BufferedReader(new InputStreamReader(is,"UTF-8"));
	
	while(true){
		buffer3 = br3.readLine();
		if(buffer3 == null){
			break;
		}
		out.println(buffer3+"<br>");
	}
	
%>

















</body>
</html>