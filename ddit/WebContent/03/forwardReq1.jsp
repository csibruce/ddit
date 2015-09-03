<%@page import="java.util.Map"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/03/forwardReq2.jsp");
	
	dispatcher.forward(request, response);
	
%>
