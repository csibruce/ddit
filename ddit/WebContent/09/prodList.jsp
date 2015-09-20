<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	IMemberService service = IMemberServiceImpl.getInstance();
	List<ProdVO> prodlist = service.getprodList();
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
			<th>상품분류코드</th>
			<th>상품명</th>
			<th>매입가</th>
			<th>소비자가</th>
			<th>판매가</th>
			<th>총입고수량</th>
			<th>재고수량</th>
		</tr>
	</thead>
	<tbody>
	<%if(session.getAttribute("LOGIN_MEMBERINFO")!=null){
	   for(ProdVO pvo: prodlist){%>
		<tr>
			<td><%=pvo.getPROD_ID() %></td>
			<td><a href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/09/prodView.jsp"><%=pvo.getPROD_NAME() %></a></td>
			<td><%=pvo.getPROD_COST() %></td>
			<td><%=pvo.getPROD_SALE() %></td>
			<td><%=pvo.getPROD_SALE() %></td>
			<td><%=pvo.getPROD_QTYIN() %></td>
			<td><%=pvo.getPROD_QTYSALE() %></td>
		</tr>
	<%}} %>
	</tbody>
</table>
<div style="width: 600px; text-align: right; margin-top: 10px;">
	<input type="button" value="상품등록" onclick="javascript:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=/09/prodForm.jsp'">
</div>
</div>
</body>
</html>








