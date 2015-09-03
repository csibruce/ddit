<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="http://localhost/ddit/02/viewParameter.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mem_id"> </td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="text" name="mem_pass"> </td>
		</tr>
		<tr>
			<td>성   명</td>
			<td><input type="text" name="mem_name"></td>
		</tr>
		<tr>
			<td>취   미</td>
			<td>
				<input type="checkbox" value="당구" name="mem_like">당구<br>
				<input type="checkbox" value="축구" name="mem_like">축구<br>
				<input type="checkbox" value="독서" name="mem_like">독서<br>
				<input type="checkbox" value="탁구" name="mem_like">탁구<br>
				<input type="checkbox" value="음주" name="mem_like">음주<br> 
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="전송"> </td>
		</tr>
	</table>
</form>

</body>
</html>