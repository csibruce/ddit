<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	private int multiple(int i, int j){
	     return i*j;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>구구단</h3>
<%
	int val = 0;
	for(int dan = 2; dan <10; dan++){	%>
		<%= dan %><br/>
		<%for(int j = 1 ; j<10 ; j++){%>
		
		<%= dan %> * <%= j %> = <%=multiple(dan,j) %><br/>	
		
			<%
		}		
	}
%>



</body>
</html>