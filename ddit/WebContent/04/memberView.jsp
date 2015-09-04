<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String mem_id = request.getParameter("mem_id");
    
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("mem_id", mem_id);
    	
    	IMemberService service = IMemberServiceImpl.getInstance();
    	MemberVO memberInfo = service.getMemberInfo(params);
    	//request.setAttribute("memberInfo", memberInfo);

    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function updateDateCheck(frm){
	frm.mem_hometel.value = frm.mem_hometel1.value +'-'+ 
							frm.mem_hometel2.value +'-'+ 
							frm.mem_hometel3.value;
	
	frm.mem_hp.value = frm.mem_hp1.value +'-'+ 
					   frm.mem_hp2.value +'-'+ 
					   frm.mem_hp3.value;
	
	frm.mem_mail.value = frm.mem_mail1.value +'@'+ 
						 frm.mem_mail2.value;
	
	frm.mem_zip.value = frm.mem_zip1.value +'-'+ 
						frm.mem_zip2.value;
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
<form name="memberForm" method="post" action="/ddit/04/updateMemberInfo.jsp" onsubmit="return updateDateCheck(this);">
<input type="hidden" name="mem_id" id="mem_idPic" value="<%=memberInfo.getMem_id() %>">	
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 100%; width: 100%;" id="viewTable">
				<img src="" alt="증명사진"/>
			</div>
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명사진을 검색합니다." 
				style="cursor: pointer;" onclick="idPicBtnClick();"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="<%=memberInfo.getMem_name() %>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="<%=memberInfo.getMem_regno1() %>" disabled="disabled"/>
  			<input type="text" name="mem_regno2" size="7" value="<%=memberInfo.getMem_regno2() %>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
		
				<input type="hidden" name="mem_bir" />
				<input type="text" name="mem_bir1" size="4" value="<%=memberInfo.getMem_bir() != null ? memberInfo.getMem_bir().substring(0, 4) : "" %>" disabled="disabled"/>년
				<input type="text" name="mem_bir2" size="2" value="<%=memberInfo.getMem_bir() != null ? memberInfo.getMem_bir().substring(5, 7) : "" %>" disabled="disabled"/>월
				<input type="text" name="mem_bir3" size="2" value="<%=memberInfo.getMem_bir() != null ? memberInfo.getMem_bir().substring(8, 10) : "" %>" disabled="disabled"/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="<%=memberInfo.getMem_id() %>" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="password" name="mem_pass" value="<%=memberInfo.getMem_pass() %>" disabled="disabled"/> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<%
				String mem_hometel1 = memberInfo.getMem_hometel().substring(0, 3);
				String[] mem_hometel = memberInfo.getMem_hometel().split("-");
				
			%>
			<select name="mem_hometel1">
				<option value="02" <%=mem_hometel[0].equals("02")?"selected":"" %>>02</option>
				<option value="031" <%=mem_hometel[0].equals("031")?"selected":"" %>>031</option>
				<option value="032" <%=mem_hometel[0].equals("032")?"selected":"" %>>032</option>								        	
				<option value="033" <%=mem_hometel[0].equals("033")?"selected":"" %>>033</option>				        	
				<option value="041" <%=mem_hometel[0].equals("041")?"selected":"" %>>041</option>
				<option value="042" <%=mem_hometel[0].equals("042")?"selected":"" %>>042</option>				        	
				<option value="043" <%=mem_hometel[0].equals("043")?"selected":"" %>>043</option>				        	
				<option value="051" <%=mem_hometel[0].equals("051")?"selected":"" %>>051</option>				        	
				<option value="052" <%=mem_hometel[0].equals("052")?"selected":"" %>>052</option>
				<option value="053" <%=mem_hometel[0].equals("053")?"selected":"" %>>053</option>				        					        	
				<option value="061" <%=mem_hometel[0].equals("061")?"selected":"" %>>061</option>
				<option value="062" <%=mem_hometel[0].equals("062")?"selected":"" %>>062</option>
				<option value="063" <%=mem_hometel[0].equals("063")?"selected":"" %>>063</option>				        					        					        	
				<option value="064" <%=mem_hometel[0].equals("064")?"selected":"" %>>064</option>				        					        					        	
				<option value="070" <%=mem_hometel[0].equals("070")?"selected":"" %>>070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="<%=mem_hometel[1] %>" /> - 
			<input type="text" name="mem_hometel3" size="4" value="<%=mem_hometel[2] %>" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<%
				
				String[] mem_hp = memberInfo.getMem_hp().split("-");
				
			%>
			<select name="mem_hp1">
				<option value="010" <%=mem_hp[0].equals("010")?"selected":"" %>>010</option>
				<option value="016" <%=mem_hp[0].equals("016")?"selected":"" %>>016</option>				        	
				<option value="017" <%=mem_hp[0].equals("017")?"selected":"" %>>017</option>				        	
				<option value="019" <%=mem_hp[0].equals("019")?"selected":"" %>>019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="<%=mem_hp[1] %>" /> - 
			<input type="text" name="mem_hp3" size="4" value="<%=mem_hp[2] %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
				<%
				
				String[] mem_mail = memberInfo.getMem_mail().split("@");
				
			%>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="<%=mem_mail[0] %>" /> @
			<select name="mem_mail2">
				<option value="naver.com" <%=mem_mail[1].equals("naver.com")?"selected":"" %>>naver.com</option>
				<option value="daum.net" <%=mem_mail[1].equals("daum.net")?"selected":"" %>>daum.net</option>
				<option value="hanmail.net" <%=mem_mail[1].equals("hanmail.net")?"selected":"" %>>hanmail.net</option>
				<option value="nate.com" <%=mem_mail[1].equals("nate.com")?"selected":"" %>>nate.com</option>
				<option value="gmail.com" <%=mem_mail[1].equals("gmail.com")?"selected":"" %>>gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
					<%
				
				String mem_add1 = memberInfo.getMem_add1();
				String mem_add2 = memberInfo.getMem_add2();
				String[] mem_zip  =memberInfo.getMem_zip().split("-");
				
			%>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="<%=mem_zip[0] %>" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="<%=mem_zip[1] %>" />
			<input type="button" value="우편번호검색" onclick="zipSearch();"/><br>
			<input type="text" name="mem_add1" id="mem_add1" value="<%=mem_add1 %>"/>
			<input type="text" name="mem_add2" id="mem_add2" value="<%=mem_add2 %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value="<%=memberInfo.getMem_job() != null?memberInfo.getMem_job():"" %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value="<%=memberInfo.getMem_like() != null?memberInfo.getMem_like():"" %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<input type="submit" value="수정" onclick=""/>
			<input type="reset" value="취소"/>
			<input type="button" value="삭제" onclick="javascript:location.href='/ddit/04/deleteMemberInfo.jsp?mem_id=<%=memberInfo.getMem_id()%>'"/>
			<input type="button" value="목록" onclick="javascript:location.href='/ddit/04/memberList.jsp'"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
(function(){

})();

</script>
</body>
</html>








