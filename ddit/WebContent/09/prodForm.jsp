<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form name="proForm" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<input type="text" name="prod_id" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<input type="text" name="prod_name" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류</td>
		<td><input type="text" name="prod_lgu" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">공급업체(코드)</td>
		<td><input type="text" name="prod_buyer" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td><input type="text" name="prod_cost" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td><input type="text" name="prod_sale" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">판매가</td>
		<td><input type="text" name="prod_sale" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">상품개략설명</td>
		<td><input type="text" name="prod_outline" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td><input type="text" name="prod_detail" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">재고수량</td>
		<td><input type="text" name="prod_totalstock" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">신규일자(등록일)</td>
		<td><input type="text" name="prod_insdate" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">안전재고수량</td>
		<td><input type="text" name="prod_properstock" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">크기</td>
		<td><input type="text" name="prod_size" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">색상</td>
		<td><input type="text" name="prod_color" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">배달특기사항</td>
		<td><input type="text" name="prod_delivery" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">단위(수량)</td>
		<td><input type="text" name="prod_unit" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">총입고수량</td>
		<td><input type="text" name="prod_qtyin" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">총판매수량</td>
		<td><input type="text" name="prod_qtysale" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">개당마일리지점수</td>
		<td><input type="text" name="prod_mileage" value=""/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<input type="button" value="상품등록"/>
			<input type="reset" value="취소"/>
			<input type="button" value="상품목록"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>








