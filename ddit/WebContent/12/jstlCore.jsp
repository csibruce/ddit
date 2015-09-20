<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach begin="1" end="10" step="1" var="i">
	<!-- jstl의 core 태그 중 var 또는 var로 시작한 속성에 정의된
		 값은 EL로 접근할수있음.
	 -->
	 ${i}<br>
</c:forEach>
<hr color="red">
<c:forEach begin="1" end="10" step="3" var="i">
	<!-- jstl의 core 태그 중 var 또는 var로 시작한 속성에 정의된
		 값은 EL로 접근할수있음.
	 -->
	 ${i}<br>
</c:forEach>
<c:forEach begin="1" end="10" var="i" varStatus="stat">
	<c:if test="${stat.first}">첫번째루프실행</c:if>
	${i}
	<c:if test="${stat.last}">마지막루프실행</c:if><br>
</c:forEach>

<c:forEach items="${cookie}" var="ck"> 
<font color="blue">
key : ${ck.key}<br>
val : ${ck.value.value }<br>
</font>
</c:forEach>
<!-- 
	String[] stres = "안정원,박훈범,정현근,전상혁,될놈".slit(',')
 -->
<c:set var="testData" value="안정원,박훈범,정현근,전상혁,될놈"></c:set>
<c:forTokens items="${testData }" delims="," var="value">
	<font color="red">${value }<br></font>
</c:forTokens>

<%
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberlist = service.getMemberList();
	//pageContext.setAttribute("memberlist", memberlist);
%>
<c:set var="memberlist" value="<%=memberlist %>" scope="page"></c:set>

<table style="width: 600px;">
	<thead>
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>주민번호1</th>
			<th>주민번호2</th>
		</tr>
		
	</thead>
	<tbody>
	<c:forEach items="${pageScope.memberlist}" var="memberinfo" varStatus="stat">
		<tr>
			<td><font color="red">${stat.count }</font></td>
			<td><font color="green">${memberinfo.mem_id }</font></td>
			<td><font color="blue">${memberinfo.mem_pass }</font></td>
			<td><font color="pink">${memberinfo.mem_name }</font></td>
			<td><font color="lightgreen">${memberinfo.mem_regno1 }</font></td>
			<td><font color="orange">${memberinfo.mem_regno2 }</font></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<hr color="red">
<!-- pageContext.setAttribute("jumsu", "87") -->
<c:set var="jumsu" value="87" scope="page"></c:set>
<c:if test="${jumsu > 90}">수</c:if>
<c:if test="${jumsu > 80 && jumsu <= 90}">우</c:if>
<c:if test="${jumsu > 70 && jumsu <= 80}">미</c:if>
<c:if test="${jumsu <= 70}">분발합시다.</c:if>
<br>
<hr color="red">
<c:if test="${jumsu == 87 }" var="result" scope="page">같다</c:if><br>
조건문결과 : ${result}
<br>
<hr color="red">
<c:remove var="jumsu" scope="page"/>
점수는 :<c:out value="${jumsu}" default="출력값 존재하지않을시 출력되는 스트링"></c:out>
<c:if test="${empty jumsu }">값없음</c:if>
<c:if test="${not empty jumsu }">값있음</c:if>
<br>
<hr color="red">
<c:set var="jumsu" value="87" scope="page"></c:set>
<c:choose>
	<c:when test="${jumsu>90}">su</c:when>
	<c:when test="${jumsu>80 && jumsu <= 90}">wu</c:when>
	<c:when test="${jumsu>70 && jumsu <= 80}">mi</c:when>
	<c:when test="${jumsu <= 70}">Study hard!</c:when>
	<c:otherwise>분발합시다!!!</c:otherwise>
</c:choose>

<c:import url="/01/gugudanResult.jsp" scope="page" var="gugudanresult" >
	<c:param name="dan" value="5"></c:param>
</c:import>
<c:url value="/01/gugudanResult.jsp" var="gugudan">
	<c:param name="dan" value="2"></c:param>
</c:url>

<a href="${gugudan }">클릭하면?</a>

<c:catch var="err">
<%
int i = 1/0;
%>
</c:catch>
<br>
<font color="red" size="30">${err }</font>
<c:redirect url="/01/comment.jsp"></c:redirect>

${gugudanresult }
</body>
</html>










