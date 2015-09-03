<%@page import="java.net.URLEncoder"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// http://localhost/ddit/04/loginCheck.jsp
	// 		mem_id=value&mem_pass=value
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");

	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	if(memberInfo!=null){
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		RequestDispatcher rd = request.getRequestDispatcher("/04/memberList.jsp");
		rd.forward(request, response);
	}else{
		
		String message = URLEncoder.encode("회원이 아닙니다.", "UTF-8");
		response.sendRedirect("/ddit/04/loginForm.jsp?message="+message);
	}
%>