<%@page import="vo.BuyerVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	IMemberService service = IMemberServiceImpl.getInstance();
	List<BuyerVO> memberlist = service.getBuyerList();


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
			<th>거래처코드</th>
			<th>거래처명</th>
			<th>담당자</th>
			<th>거래은행</th>
			<th>주소1</th>
			<th>주소2</th>
			<th>전화번호</th>
			<th>팩스번호</th>
		</tr>
	</thead>
	<tbody>
	<%if(session.getAttribute("LOGIN_MEMBERINFO")!=null){
	   for(BuyerVO bvo:memberlist){%>
	<tr>
			<td><%= bvo.getBuyer_id()%></td>
			<td><a style="cursor:pointer" href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/07/buyerView.jsp?buyer_id=<%=bvo.getBuyer_id()%>"><%= bvo.getBuyer_name()%></a></td>
			<td><%= bvo.getBuyer_bankname()%></td>
			<td><%= bvo.getBuyer_bank()%></td>
			<td><%= bvo.getBuyer_add1()%></td>
			<td><%= bvo.getBuyer_add2()%></td>
			<td><%= bvo.getBuyer_comtel()%></td>
			<td><%= bvo.getBuyer_fax()%></td>
		</tr>
	<%}} %>
	</tbody>
</table>
<div style="width: 600px; text-align: right; margin-top: 10px;">
	<input id="update" type="button" value="거래처등록" onclick="javascript:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=/07/buyerForm.jsp'">
</div>
</div>
</body>
</html>








