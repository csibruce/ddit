<%@page import="vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// http://localhost/ddit/06/idOverlapCheck.jsp?mem_id=a001
	String mem_id = request.getParameter("id");
	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id",mem_id);

	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberinfo = service.getMemberInfo(params);
	
	if(memberinfo==null){
		out.println("<check flag='true'>tt</check>");
	}else{
		out.println("<check flag='false'>ff</check>");
	}


%>