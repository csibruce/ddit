<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();
	
	//컬렉션 -> json 형식으로 변환
	//json 형식 데이타 -> 컬렉션 내지는 setter/getter를 포함하는 VO객체 변환
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(memberList);
	
	application.log("jsonData : "+jsonData);
	
	//서버에서 작성된 json형식의 데이타(문자열)는 부라우져 전송시 contenttype이 반드시
	//text/plain으로 설정되어야 함.
	out.println(jsonData);
	
	
    %>
