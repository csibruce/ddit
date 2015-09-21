<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table class="tbl_type" border="1" cellspacing="0" summary="게시판리스트">
		<caption>게시판 리스트</caption>
		<colgroup>
			<col width="12%">
			<col>
			<col span="6" width="12%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="searchForm" align="right" style="margin-top: 10px;">
		<form method="post" action="#">
			<select name="search_keycode">
				<option value="ALL">전체</option>
				<option value="TITLE">제목</option>
				<option value="CONTENT">컨텐츠</option>
			</select>
			<input type="text" id="search_keyword" name="search_keyword">
			<input type="submit" value="검색">
			<input type = "button" value="글쓰기"/>
		</form>
	</div>
</div>
</body>
</html>
