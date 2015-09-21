<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function checkform(get){
		
		//bo_title
		//bo_nickname
		//bo_pwd
		//bo_content
		//bo_mail
		alert("function :  checkfrom(onsubmit)");
		var title = $('input[name=bo_title]').val();
		var nickname = $('input[name=bo_nickname]').val();
		var pwd = $('input[name=bo_pwd]').val();
		var content = $('input[name=bo_content]').val();
		var mail = $('input[name=bo_mail]').val();
		
		if(!title){alert("제목을 입력해 주세요!");  return false;}
		if(!nickname){alert("대화명을 입력해 주세요!"); return false;}
		if(!pwd){alert("비밀번호를 입력해 주세요!"); return false;}
		if(!content){alert("내용을 입력해 주세요!"); return false;}
		if(!mail){alert("메일주소를 입력해 주세요!"); return false;}
		
		return return;
		
	}

</script>
</head>
<body>
<form name="boardForm" method="post" action="<%=request.getContextPath()%>/13/insertboardinfo.jsp" onsubmit="return checkform(this)">
	<fieldset>
		<div class="form_table">
			<table border="1" cellspacing="0" summary="게시판 작성.">
				<tbody>
					<tr>
						<th scope="row">제 목</th>
						<td>
							<div class="item">
								<input class="i_text" name="bo_title" title="제목" type="text">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">작성자 대화명</th>
						<td>
							<div class="item">
								<input class="i_text" name="bo_nickname" title="작성자대화명" type="text">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">패스워드</th>
						<td>
							<div class="item">
								<input class="i_text" name="bo_pwd" title="패스워드" type="password">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<div class="item">
								<input class="i_text" name="bo_mail" title="이메일" type="text" name="bo_mail">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
							<div class="item">
								<textarea id="temp_textarea" name="bo_content" class="i_text" cols="50" rows="12"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<div class="item">
								<input type="file" name="file" class="i_file"><br/>
							</div>
							<div class="item">
								<input type="file" name="file" class="i_file">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</fieldset>
	<div class="button_set">
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>
		<input type="button" value="목록"  onclick="javasctipt:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=/13/boardList.jsp'"/>
	</div>
</form>
</body>
</html>