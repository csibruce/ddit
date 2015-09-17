
<%@page import="vo.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dong = request.getParameter("dong");
	Map<String,String> params = new HashMap<String,String>();
	params.put("dong", dong);
	
	IZipcodeService service = IZipcodeServiceImpl.getInstance();
	List<ZipcodeVO> zipcodeList = service.getZipcodeList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(zipcodeList);
	
	out.println(jsonData);

%>
