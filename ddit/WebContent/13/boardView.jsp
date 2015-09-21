<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" name="boardForm" method="post">
	<fieldset>
		<div class="form_table">
			<table border="1" cellspacing="0" summary="게시판 상세보기 화면">
				<tbody>
					<tr>
						<th scope="row">제 목</th>
						<td>
							<div class="item">
								<input class="i_text" title="제목" type="text">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">작성자 대화명</th>
						<td>
							<div class="item">
								<input class="i_text" title="작성자대화명" type="text">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">패스워드</th>
						<td>
							<div class="item">
								<input class="i_text" title="패스워드" type="password">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
							<div class="item">
								<textarea id="temp_textarea" class="i_text" cols="50" rows="12"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<div class="item">
								<label><a href="fileDownload.jsp?file_seq=${board.fileBeans[0].file_seq }&file_save_name=${board.fileBeans[0].file_save_name }">${board.fileBeans[0].file_save_name }</a></label>
							</div>
							<div class="item" style="clear: both;">
								<label><a href="fileDownload.jsp?file_seq=${board.fileBeans[1].file_seq }&file_save_name=${board.fileBeans[1].file_save_name }">${board.fileBeans[1].file_save_name }</a></label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</fieldset>
	<div class="button_set">
		<input type="button" value="수정"/>
		<input type="button" value="글쓰기"/>
		<input type="button" value="삭제"/>
		<input type="button" value="답글"/>
		<input type="button" value="목록"/>
	</div>
</form>
</body>
</html>




























