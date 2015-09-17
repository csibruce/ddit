<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 style="color:red;">EL 표기법은 jsp의 스크립트릿, 디클러레이션, 익스프레션 내부에서 활용할수 없음!!!</h4>
<h4>EL 표기법은 javascript, Html 태그에서 활용됨.</h4>
<h4>EL 표기법은 특정 객체의 속성에 저장값을 취득을 목적으로 함.</h4>
<table border="1" width="600">
	<tr><td>표현언어</td><td>결과값</td></tr>
	<tr><td>\${1+2}</td><td>${1+2}</td></tr>
	<tr><td>\${3-2}</td><td>${3-2}</td></tr>
	<tr><td>\${3*2}</td><td>${3*2}</td></tr>
	<tr><td>\${3/2}</td><td>${3/2}</td></tr>
	<tr><td>\${3 div 2}</td><td>${3 div 2}</td></tr>
	<tr><td>\${3>2}</td><td>${3>2}</td></tr>
	<tr><td>\${3 gt 2}</td><td>${3 gt 2}</td></tr>
	<tr><td>\${3 lt 2}</td><td>${3<2}</td></tr>
	<tr><td>\${3 lt 2}</td><td>${3 lt 2}</td></tr>
	<tr><td>\${3>=2}</td><td>${3>=2}</td></tr>
	<tr><td>\${3 ge 2}</td><td>${3 ge 2}</td></tr>
	<tr><td>\${3 le 2}</td><td>${3 le 2}</td></tr>
	<tr><td>\${3 == 2}</td><td>${3 == 2}</td></tr>
	<tr><td>\${3 != 2}</td><td>${3 != 2}</td></tr>
	
</table>
<hr>
<h4>Header정보 취득</h4>
<table border="1" width="600">
	<tr><td>표현언어</td><td>결과값</td></tr>
	<tr><td>request.getHeader("host")</td><td><%=request.getHeader("host") %></td></tr>
	<tr><td>\${header.host }</td><td>${header.host }</td></tr>
	<tr><td>\${header["host"] }</td><td>${header["host"] }</td></tr>
	<tr><td>request.getHeader("user-agent")</td><td><%=request.getHeader("user-agent") %></td></tr>
	<tr><td>\${header["user-agent"] }</td><td>${header["user-agent"] }</td></tr>
	<tr><td>\${cookie.mem_id.value }</td><td>${cookie.mem_id.value }</td></tr>
	<tr><td>\${cookie.mem_pass.value }</td><td>${cookie.mem_pass.value }</td></tr>
</table>
<hr>
<h4>web.xml내에 선언된 전역 변수 취득</h4>
<table border="1" width="600">
	<tr><td>표현언어</td><td>결과값</td></tr>
	<tr><td>application.getInitParameter("oracleDriver")</td><td><%=application.getInitParameter("oracleDriver") %></td></tr>
	<tr><td>\${initParam.oracleDriver }</td><td>${initParam.oracleDriver }</td></tr>
	<tr><td>\${initParam.oracleURL }</td><td>${initParam.oracleURL }</td></tr>
	<tr><td>\${initParam.mysqlDriver }</td><td>${initParam.mysqlDriver }</td></tr>	
</table>
<hr>
<h4>요청시 전달되는 파라메터 취득 ?mem_id=a001&mem_id=b001&mem_pass=asdfasdf</h4>
파라메터 mem_id[0] : <font color="red">${paramValues.mem_id[0] }</font><br>
파라메터 mem_id[1] : <font color="red">${paramValues.mem_id[1] }</font><br>
파라메터 mem_pass : <font color="red">${param.mem_pass }</font><br>
<hr>
<%
Map<String, String> params = new HashMap<String, String>();
params.put("mem_id", "a001");
params.put("mem_pass", "asdfasdf");

IMemberService service = IMemberServiceImpl.getInstance();
MemberVO memberInfo = service.getMemberInfo(params);

//저장 영역을 가지는 4개의 기본객체 : pageContext 
//							  		  request
//							  		  session
//							  		  application
//			저장 : setAttribute(키,값); Object 타입으로 up-casting된다
//			취득 : getAttribute(키);
//			삭제 : removeAttribute(키);
//			갱신 : setAttribute(키, 값1)

pageContext.setAttribute("memberInfo",memberInfo);
request.setAttribute("memberInfo", memberInfo);
session.setAttribute("memberInfo", memberInfo);
application.setAttribute("memberInfo", memberInfo);
%>
el mem_id :<font color="blue">${pageScope.memberInfo.mem_id }</font><br> 
el mem_pass :<font color="green">${requestScope.memberInfo.mem_pass }</font><br>
el mem_name :<font color="orange">${sessionScope.memberInfo.mem_name }</font><br>
el mem_bir :<font color="pink">${applicationScope.memberInfo.mem_bir }</font><br>  
<hr>
<!-- 동일한 키로 각 저장영역 객체내에 저장될 때  
	 (명시적인 저장역역 미선언시)
	 pageScope -> requestScope -> sessionScope -> applicationScope
-->
el mem_id : ${memberInfo.mem_id }<br>
el mem_id : ${memberInfo.mem_pass }<br>
el mem_id : ${memberInfo.mem_name }<br>
el mem_id : ${memberInfo.mem_bir }<br>
<hr>
<h4>기본객체(9개의 기본객체)의 getter를 통한 값 취득
	반드시 pageContext로부터 해당 기본객체에 접근</h4>
remoteaddr : <%=request.getRemoteAddr() %><br>
el remoteaddr : ${pageContext.request.remoteAddr}<br>
contextPath	: <%=application.getRealPath("") %><br>
el contextPath : ${pageContext.servletContext.getRealPath('') }<br>
el contextPath : ${pageContext.request.contextPath }<br>
session id : <%=session.getCreationTime() %><br>
el session id : ${pageContext.session.creationTime }<br>

<hr>
<h4>논리연산자</h4>
<%
	request.setAttribute("val", "10");
%>
<table border="1" width="600">
	<tr><td>표현언어</td><td>결과값</td></tr>
	<tr><td>\${'test1'=='test1'}</td><td>${'test1'=='test1'}</td></tr>
	<tr><td>\${requestScope.val == '10' && requestScope.val != '9' }</td><td>${requestScope.val == '10' && requestScope.val != '9' }</td></tr>
	<tr><td>\${requestScope.val == '10' and requestScope.val != '9' }</td><td>${requestScope.val == '10' and requestScope.val != '9' }</td></tr>
	<tr><td>\${requestScope.val == '10' || requestScope.val != '9' }</td><td>${requestScope.val == '10' || requestScope.val != '9' }</td></tr>
	<tr><td>\${requestScope.val == '10' or requestScope.val != '9' }</td><td>${requestScope.val == '10' or requestScope.val != '9' }</td></tr>
	<tr><td>\${requestScope.val == '10'?'같음':'틀림' }</td><td>${requestScope.val == '10'?'같음':'틀림' }</td></tr>
</table>
<hr>
널값비교<br>
${requestScope.val == null }<br>
${empty requestScope.val }<br>
${requestScope.val != null }<br>
${not empty val }<br>
${empty val }<br>
</body>
</html>