<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="login-box">
		<form name="login" action="loginCheck.jsp" 
			method="post">
			<div id="login-box-name">Username:</div>
			<div id="login-box-field">
				<input name="mem_id" title="Username" value="" size="30"/>
			</div>
			<div id="login-box-name">Password:</div>
			<div id="login-box-field">
				<input name="mem_pass" type="password" title="Password" 
					value="" size="30"/>
			</div>
			<div class="btn">
				<input type="submit" value="로그인"/>
				<input type="button" value="로그아웃"/>
			</div>
		</form>
	</div>
	<div class="leftmenu">
		<ul>
			<li class="step1">게시판관리
				<div class="submenu">
					<ul>
						<li><a href="#">목록보기</a></li>
						<li><a href="#">새로쓰기</a></li>
						<li><a href="#">수 정</a></li>
						<li><a href="#">삭 제</a></li>
						<li><a href="#">상세보기</a></li>
					</ul>
				</div>
			</li>
			<li class="step1">회원관리
				<div class="submenu">
					<ul>
						<li><a href="#">메뉴 1-1</a></li>
						<li><a href="#">메뉴 1-2</a></li>
						<li><a href="#">메뉴 1-3</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>