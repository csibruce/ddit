<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();
	
	if(memberList != null){
		
		out.println("<members>");
		for(MemberVO memberInfo : memberList){
			out.println("<member mem_id=\""+memberInfo.getMem_id()+"\">");			
				out.println("<mem_name>"+memberInfo.getMem_name()+"</mem_name>");
				out.println("<mem_regno1>"+memberInfo.getMem_regno1()+"</mem_regno1>");
				out.println("<mem_regno2>"+memberInfo.getMem_regno2()+"</mem_regno2>");
				out.println("<mem_job>"+memberInfo.getMem_job()+"</mem_job>");
			out.println("</member>");
		}
		out.println("</members>");
	}

%>