<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="targetclx" uri="http://www.ddit.or.kr/TargetClz" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="str1" value="function tag 활용하면 java.lang.String 클래스내에 사용빈도가 높은 API를 쉽게 활용할 수 있어요"></c:set>
${str1 }<br>
<c:set var="str2" value="활용"></c:set>
<c:set var="tokensTagetStr" value="송한나,김학선,정석준,홍지연,조성일"></c:set>

<hr>
length(str1) : ${fn:length(str1)}<br>
toUpperCase(str1) : ${fn:toUpperCase(str1) }<br>
toLowerCase(str1) : ${fn: toLowerCase(str1) }<br>
substring(str1,0,8) : ${fn:substring(fn:trim(str1),0,8)}<br>
substringAfter(str1, str2) : ${fn:substringAfter(str1, str2) }<br>
substringBefore(str1, str2) : ${fn:substringBefore(str1, str2) }<br>
replace(str1,str2,"사용") : ${fn:replace(str1,str2,"사용") }<br>
indexOf(str1,str2) : ${fn:indexOf(str1,str2) }<br>
startsWith(str1,"fun") : ${fn:startsWith(str1,"fun") }<br>
endsWith(str1,"니다.") : ${fn:endsWith(str1,"니다.") }<br>  

${targetclx:times()}


</body>
</html>