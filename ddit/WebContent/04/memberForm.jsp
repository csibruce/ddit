<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript">
	function joinCheck(){
		if('<%=session.getAttribute("LOGIN_MEMBERINFO")%>' != 'null'){
			//브라우져는 주소창에 입력된 주소를 관리(history 객체를 활용)
			//history에 해당요청주소 저장됨
			location.href='/ddit/04/memberList.jsp';
		}else{
			alert('로그인해주세요');
			//history에 해당 요청 주소가 저장 안됨.
			location.replace('/ddit/04/loginForm.jsp');
		}
	}

	function insertDataCheck(frm){
		frm.mem_hometel.value = frm.mem_hometel1.value +'-'+ 
								frm.mem_hometel2.value +'-'+ 
								frm.mem_hometel3.value;
		
		frm.mem_comtel.value = frm.mem_comtel1.value +'-'+ 
								frm.mem_comtel2.value +'-'+ 
								frm.mem_comtel3.value;
		
		frm.mem_hp.value = frm.mem_hp1.value +'-'+ 
						   frm.mem_hp2.value +'-'+ 
						   frm.mem_hp3.value;
		
		frm.mem_mail.value = frm.mem_mail_id.value +'@'+ 
							 frm.mem_mail_domain.value;
		
		frm.mem_zip.value = frm.mem_zip1.value +'-'+ 
							frm.mem_zip2.value;
		
		frm.mem_bir.value = frm.mem_bir1.value +'/'+
							frm.mem_bir2.value +'/'+
							frm.mem_bir3.value;
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
<form name="memberForm" action="/ddit/04/insertMemberInfo.jsp" method="post" onsubmit="return insertDataCheck(this);">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="" /> 실명을 입력하세요.
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
  			<input type="text" name="mem_regno1" size="7" 
  				value=""/>-
  				<input type="text" name="mem_regno2" size="7" 
  				value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<input type="text" name="mem_bir1" size="4" 
					value=""/>년
				<input type="text" name="mem_bir2" size="2" 
					value=""/>월
				<input type="text" name="mem_bir3" size="2" 
					value=""/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" 
				value="" /> 8 ~ 20 자리 영문자 및 숫자 사용 <b><a href="#">[ID 중복검사]</a></b>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" 
				value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" 
				value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        				
				<option value="064">064</option>				        					        					  
				<option value="070">070</option>				        					        		
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" 
				value="" /> - 
			<input type="text" name="mem_hometel3" size="4" 
				value="" />
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">회사전화번호</td>
		<td>
			<input type="hidden" name="mem_comtel"/>
			<select name="mem_comtel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        				
				<option value="064">064</option>				        					        					  
				<option value="070">070</option>				        					        		
			</select>	- 	
			<input type="text" name="mem_comtel2" size="4" 
				value="" /> - 
			<input type="text" name="mem_comtel3" size="4" 
				value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" 
				value="" /> - 
			<input type="text" name="mem_hp3" size="4" 
				value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail_id" 
					value="" /> @
			<select name="mem_mail_domain">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" id="mem_zip1" size="3" 
				value="" /> - 
			<input type="text" id="mem_zip2" size="3" 
				value="" />
			<input type="button" value="우편번호검색"/><br>
			<input type="text" id="mem_add1" name="mem_add1" size="50" 
				value="" />
			<input type="text" id="mem_add2" name="mem_add2" size="50" 
				value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<input type="submit" value="가입하기"/>
			<input type="reset" value="취소"/>
			<input type="button" value="목록" onclick="joinCheck();"/>
		</td>
	</tr>

</table>
</form>
</body>
</html>








