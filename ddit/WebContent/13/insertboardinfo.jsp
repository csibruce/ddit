<%@page import="vo.MemberVO"%>
<%@page import="service.BoardServiceImpl"%>
<%@page import="service.BoardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	BoardVO boardinfo = new BoardVO();
	/* try{
		BeanUtils.populate(boardinfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	} */
	
	
	boardinfo.setBO_TITLE(request.getParameter("bo_title"));
	boardinfo.setBO_NICKNAME(request.getParameter("bo_nickname"));
	boardinfo.setBO_PWD(request.getParameter("bo_pwd"));
	boardinfo.setBO_MAIL(request.getParameter("bo_mail"));
	//boardinfo.setBO_WRITER(((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")).getMem_id());
	boardinfo.setBO_WRITER("a001");
	boardinfo.setBO_IP(request.getRemoteAddr());
	
	
	BoardService service = BoardServiceImpl.getInstance();
	String bo_seq = service.insertboardinfo(boardinfo);
	out.println(bo_seq);
	
	response.sendRedirect(request.getContextPath()+"/06/main.jsp?contentPage=/13/boardList.jsp");
%>