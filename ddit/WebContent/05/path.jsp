<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
웹 어플리케이션의 컨텍스트 패스 루트 : <%=request.getContextPath() %><br>
<!-- 
	절대경로 : 컨텍스트 패스 | 로트가 활용되어 리소스에 접근
	상대경로 : 현재의 요청처리 대상이 기준
			   ../ 상위 경로 접근 ../../ path.jsp를 기준으로 상위 두단계의 경로에 접근
			   ./ 현재의 기준경로 
 -->
 <img alt="ddit" src="<%=request.getContextPath()%>/image/ddit.jpg" width="200"><br>
 <img alt="sajin" src="../image/sajin.jpg" width="200"><br>
 <img alt="disk" src="./imgs/disk.png">
</body>
</html>