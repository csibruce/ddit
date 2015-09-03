<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="dao.IMemberDaoImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// loginForm.jsp -> loginCheck.jsp 회원일때 포워딩 -> memberList.jsp
	// 목적: member table에 존재하는 모든 회원의 정보를 취득해서 table html tag에
	//		 아이디, 패스워드, 주민번호1, 주민번호2
	//		IMemberService 취득
	//			List<MemberVO> getMemberList();
	//		IMemberDao 취득
	//			List<MemberVO> getMemberList(){
	//				쿼리질의
	//				
	
	
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
</head>
<body>
<div id="list">
<table style="width: 600px;">
	<thead>
	<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>주민번호1</th>
			<th>주민번호2</th>
		</tr>
	</thead>
	<tbody>
	<%for(int i=0;i<memberList.size();i++){ %>
		<tr>
			<th><%=((MemberVO)memberList.get(i)).getMem_id() %></th>
			<th><%=((MemberVO)memberList.get(i)).getMem_pass() %></th>
			<th><a href="javascript:location.href='/ddit/04/memberView.jsp?mem_id=<%=((MemberVO)memberList.get(i)).getMem_id()%>'"><%=((MemberVO)memberList.get(i)).getMem_name() %></a></th>
			<th><%=((MemberVO)memberList.get(i)).getMem_regno1() %></th>
			<th><%=((MemberVO)memberList.get(i)).getMem_regno2() %></th>
		</tr>
	<%} %>
	</tbody>
</table>
<div style="width: 600px; text-align: right; margin-top: 10px;">
	<input type="button" value="회원등록" onclick="javascript:location.href='/ddit/04/loginForm.jsp'">
</div>
</div>
</body>
</html>








