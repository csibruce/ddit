<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	function formSubmit(){
		$('form[name=loginForm]').submit();
	}

	function joinValueCheck(frm){
		// javascript 변수 : undefined
		//					 null
		//					 값
		if(frm.mem_id.value==''){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(frm.mem_pass.value==''){
			alert("패스워드를 입력해주세요.");
			return false;
		}
		return true;
	}
	
	function messageCheck(){
		// loginForm.jsp?message=회원이아닙니다.
		// javascript 코드내에서 활용되는 익스프레션(표현식은) '' or ""랩핑
		if('<%=request.getParameter("message")%>' != 'null'){
			alert('<%=request.getParameter("message")%>');
		}
	}
</script>
</head>
<body onload="messageCheck();">
<div id="login-box">
	<form action="/ddit/04/loginCheck.jsp" method="post" name="loginForm" 
		onsubmit="return joinValueCheck(this);">
		<div id="login">
			<h3><img src="${pageContext.request.contextPath }/image/p_login.gif" alt="login : 로그인하셔서 홈페이지의 다양한 서비스를 이용해보세요. 아이디가 없으시다면 회원가입을 통해 아이디를 만들어보세요."/></h3>
			<div class="loginbox">
				<p class="id">
					<label for="id"><img src="${pageContext.request.contextPath }/image/p_id2.gif" alt="아이디"/></label>&nbsp;
					<input name="mem_id" type="text" id="mem_id"/>
				</p>
				<p class="pass">
				    <label for="pass"><img src="${pageContext.request.contextPath }/image/p_pass2.gif" alt="비밀번호"/></label>&nbsp;
				    <input name="mem_pass" type="password" id="mem_pass"/>
				</p>
				<p class="btn">
					<a href="javascript:formSubmit();"><img src="${pageContext.request.contextPath }/image/btn_done3.jpg" alt="확인"/></a>
				</p>
				<p class="other">
					<a href="/searchIDandPass.do"><img src="${pageContext.request.contextPath }/image/btn_idpass.gif" alt="아이디/비밀번호찾기"/></a>&nbsp;&nbsp;
					<a href="/ddit/04/memberForm.jsp"><img src="${pageContext.request.contextPath }/image/btn_join.gif" alt="회원가입"/></a>
				</p>
			</div>
			<p>
				<img src="${pageContext.request.contextPath }/image/p_notice2.gif" alt="아이디 또는 비밀번호를 분실하셨을 경우 본인 확인절차를 통하여 아이디와 비밀번호를 확인하실 수 있습니다."/>
			</p>
		</div>
	</form>
</div>
</body>
</html>