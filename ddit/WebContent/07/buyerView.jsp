<%@page import="vo.BuyerVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	

	String buyer_id = request.getParameter("buyer_id");
	IMemberService service = IMemberServiceImpl.getInstance();
	BuyerVO buyerinfo = service.getbuyerInfo(buyer_id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript">
	function checkvalue(get){
		
		if(get.buyer_id.value==""){
			alert("거래처코드를 입력하세요.");
			return false;
		}
		if(get.buyer_name.value==""){
			alert("거래처명을 입력하세요.");
			return false;
		}
		if(get.buyer_bankname.value==""){
			alert("담당자를 입력하세요.");
			return false;
		}
		if(get.buyer_bank.value==""){
			alert("거래처은행를 입력하세요.");
			return false;
		}
		if(get.buyer_add1.value==""){
			alert("주소를 입력하세요.");
			return false;
		}
		if(get.buyer_add2.value==""){
			alert("주소를 입력하세요.");
			return false;
		}
		if(get.buyer_comtel.value==""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		if(get.buyer_fax.value==""){
			alert("팩스번호를 입력하세요.");
			return false;
		}
		if(get.buyer_mail.value==""){
			alert("이메일을 입력하세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form name="prodForm" method="post" onsubmit="return checkvalue(this)" >
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<input type="text" name="buyer_id" value="<%=buyerinfo.getBuyer_id() %>" readonly/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<input type="text" name="buyer_name" value="<%=buyerinfo.getBuyer_name() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<input type="text" name="buyer_bankname" value="<%=buyerinfo.getBuyer_bankname() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td><input type="text" name="buyer_bank" value="<%=buyerinfo.getBuyer_bank() %>"/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td><input type="text" name="buyer_add1" value="<%=buyerinfo.getBuyer_add1() %>"/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td><input type="text" name="buyer_add2" value="<%=buyerinfo.getBuyer_add2() %>"/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td><input type="text" name="buyer_comtel" value="<%=buyerinfo.getBuyer_comtel() %>"/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td><input type="text" name="buyer_fax" value="<%=buyerinfo.getBuyer_fax()%>"/></td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td><input type="text" name="buyer_mail" value="<%=buyerinfo.getBuyer_mail() %>"/></td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<input type="submit" value="거래처수정" onclick="javascript:form.action='<%=request.getContextPath()%>/07/updateBuyer.jsp'"/>
			<input type="reset" value="취소"/>
			<input type="submit" value="거래처삭제" onclick="javascript:form.action='<%=request.getContextPath()%>/07/deleteBuyer.jsp'"/>
			<input type="button" value="거래처목록" onclick="javascript:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=/07/buyerList.jsp'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>








