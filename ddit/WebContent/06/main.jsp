<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// http://localhost/ddit/06/main.jsp
	// http://localhost/ddit/06/main.jsp?contentPage=memberForm.jsp
	// http://localhost/ddit/06/main.jsp
	String contentPage = request.getParameter("contentPage");
	if(contentPage == null){
		contentPage = "memberList.jsp";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	function logincheck(){		
		$('tbody tr:nth-child(odd)').css('background','lightgray');
		if('<%=session.getAttribute("LOGIN_MEMBERINFO") %>' != 'null'){
			$('form #login-box-name').hide();
			$('form #login-box-field').hide();
			$('#loginok').show();
			$('#loginok span').css('color','red').css('font-weight','bold').css('font-size','20px');
			$('#needlogin').hide();
			$('#apply').hide();
			$('#update').show();
			$('#whenupdate .disAble').prop('readonly', true);
			$('#loginbtn').hide();
		}else{
			$('form #login-box-name').show();
			$('form #login-box-field').show();
			$('#loginok').hide();
			$('#needlogin').show().css('font-size','30px');
			$('#apply').show();
			$('#update').hide();
			$('#loginbtn').show();
		}		
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css"> 
</head>
<body>
<center>
<div id="wrap">
<div id="header">
	<!-- include action 태그
	 -->
   <jsp:include page="./layout/top.jsp">
   		<jsp:param value="메세지" name="msg"/>
   </jsp:include>
</div>
<p style="clear:both;"></p>
<div id="container">
    <div class="left">
        <jsp:include page="./layout/left.jsp"/>
    </div>
    <div id="content">
       <jsp:include page="<%=contentPage %>"/>
    </div>
</div>
<jsp:include page="./layout/bottom.jsp"/>
</div>
</center>
</body>
</html>









