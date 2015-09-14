<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// http://lacalhost/ddit/10/makeSession.jsp
	// 세션 : 클라이언트로부터 url기반으로 웹서버에 최초 요청시에 전송되는 
	//  	 쿠키 정보(jsp : JSESSIONID, php : PHPSESSIONID, asp : APSESSIONID)
	//       기초로 웹 서버단에 생성됨.
	//       세션의 유효시간은  0 or -1로 자동 설정되며, 브라우져가 종료되면 서버단에 세션도 종료.
	//       * 세션의 사용자 인증 처리시 중복 로그인의 경우 처리 로직이 존재해야한다.
	//       
	out.println("세션 아이디 :"+session.getId());
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	out.println("세션의 최초 생성 시간 : "+dateFormat.format(new Date(session.getCreationTime())));
	out.println("최종 요청 시간 :"+dateFormat.format(new Date(session.getLastAccessedTime())));
	
	Map<String, String> params = new HashMap<String,String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberinfo = service.getMemberInfo(params);
	//세션의 저장영역에 저장처리(오브젝트타입으로 업캐스팅)
	session.setAttribute("LOGIN_MEMBERINFO", memberinfo);
	
	//세션의 저장영역으로부터 취득 (오브젝트타입을 취득 후 턱정 타입으로 다운캐스팅 처리 후 활용)
	
	//세션의 유효시간 설정(초단위로 설정)
	session.setMaxInactiveInterval(60*60);
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>