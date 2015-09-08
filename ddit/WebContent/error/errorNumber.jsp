<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 기타 jsp 파일내에서 발생된 익셉션 처리 jsp. 
	 IE는 요청시 서버로부터 취득한 응답코드와 응답문자열과 취득한 컨텐츠의 총 사이즈가
	 512byte 미만이면 IE 자체적으로 포함된 해당 응답코드 페이지를 출력.
-->
에러 메세지 : <%= exception.getMessage() %><br>
에러 클래스 명 : <%=exception.getClass().getName() %>

</body>
</html>