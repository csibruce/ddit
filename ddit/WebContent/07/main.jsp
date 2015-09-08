<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css"> 
</head>
<body>
<center>
<div id="wrap">
<div id="header">
   <jsp:include page="./layout/top.jsp" />
</div>
<p style="clear:both;"></p>
<div id="container">
    <div class="left">
        <jsp:include page="./layout/left.jsp"/>
    </div>
    <div id="content">
       <jsp:include page="buyerList.jsp"/>
    </div>
</div>
<jsp:include page="./layout/bottom.jsp"/>
</div>
</center>
</body>
</html>









