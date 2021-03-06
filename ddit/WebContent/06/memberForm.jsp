
<%@page import="vo.MemberVO"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
   request.setCharacterEncoding("UTF-8");
  MemberVO memberinfo = new MemberVO();
  if(request.getParameter("id")!=null){
   String mem_id = request.getParameter("id");
   Map<String,String> params = new HashMap<String,String>();
   params.put("mem_id", mem_id);
   IMemberService service = IMemberServiceImpl.getInstance();
   memberinfo = service.getMemberInfo(params);
  }
   %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/commons.js"></script>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>



<script type="text/javascript">

function beforesubmit(get){
	// 정규식 패턴문자
	// [] : 범위 ex) [0-9], [a-z], [A-Z], [a-zA-Z], [가-힣]
	// [0-9] : \d
	// [a-zA-Z0-9_] : \w
	// ^ : 시작문자의 타입
	// $ : 종료문자의 타입
	// * : 패턴에 일치하는 문자가 반복되지않거나 무한대 반복 [a-z]*
	// + : 패턴에 일치하는 문자가 한번이상 무한대 반복 \d+
	// ? : 해당 패턴에 일치 또는 불일치 모두 추출대상
	// () : 패턴의 소그룹으로 그룹핑. test@ddit.or.kr [a-z]+@[a-z]+(\.[a-z]+){2,3}
	//							 test@ddit.kr
	// . : 모든 문자 범위의 한글자.
	// {} : 반복횟수 지정. ex) [0-9]{3}, [a-z]{3,}, \w{2,3}
	// \ : 정규식 패턴문자의 의미를 탈출.
	
	if(get.mem_name.value != ""){
		if(!/^[가-힣]{2,3}$/.test(get.mem_name.value)){
			alert('이름은 한글2글자에서 3글자로 입력해주세요.');
			get.mem_name.value='';
			get.mem_name.focus();
			return false;
		}
	}else{
		alert('성명을 입력해 주세요.')
		return false;
	}
	
	if(get.mem_regno1.value != "" && get.mem_regno2.value != ""){
		var regno = get.mem_regno1.value +"-"+ get.mem_regno2.value
		if(!regnoValidation(regno)){
			alert('해당 주민번호는 유효하지 않습니다.');
			get.mem_regno1.value = "";
			get.mem_regno1.value = "";
			get.mem_regno1.focus();
			return false;
		}
	}else{
		alert('주민번호를 입력해주세요.');
		return false;
	}
	
	if(get.mem_bir1.value != "" && get.mem_bir2.value != "" && get.mem_bir3.value != ""){
		get.mem_bir.value = get.mem_bir1.value + "/" +
  		get.mem_bir2.value + "/" +
  		get.mem_bir3.value;
		// 년도 숫자4글자/월 숫자2글자/일 숫자2글자
		if(!/^[1-9]{4}\/[0-9]{2}\/[0-9]{2}/.test(get.mem_bir.value)){
			alert('생년월일을 올바르게 입력해주세요.');
			get.mem_bir1.value = "";
			get.mem_bir2.value = "";
			get.mem_bir2.value = "";
			get.mem_bir1.focus();
			return false;
		}
	}else{
		alert('생년월일을 입력해주세요.');
		return false;
	}
	
	if(get.mem_id.value!=""){
		if(!/^[0-9a-zA-Z]{8,20}$/.test(get.mem_id.value)){
			alert('아이디를 올바르게 입력해주세요.');
			get.mem_id.value = "";
			get.mem_id.focus();
			return false;
		}
	}else{
		alert('아이디를 입력해주세요');
		return false;
	}
	if(get.mem_pass.value!=""){
		if(!/^[0-9a-zA-Z]{8,20}$/.test(get.mem_pass.value)){
			alert('pass를 올바르게 입력해주세요.');
			get.mem_pass.value = "";
			get.mem_pass.focus();
			return false;
		}
	}else{
		alert('pass를 입력해주세요');
		return false;
	}
	
	if(get.mem_mail_id.value!=""){
		get.mem_mail.value = get.mem_mail_id.value +"@"+
		   get.mem_mail_domain.value;
		//test@ddit.or.kr  
		if(!/^[a-z0-9_]{5,12}@[a-z]+(\.[a-z]+){1,2}/.test(get.mem_mail.value)){
			alert('메일을 올바르게 입력해주세요');
			get.mem_mail.value = "";
			get.mem_mail.focus();
			return false;
		}
	}else{
		alert('메일주소를 입력해라');
		return false;
	}
	
	
	get.mem_bir.value = get.mem_bir1.value + "/" +
				  		get.mem_bir2.value + "/" +
				  		get.mem_bir3.value;
	
	get.mem_hometel.value = get.mem_hometel1.value +"-"+
							get.mem_hometel2.value +"-"+
							get.mem_hometel3.value;
	
	get.mem_comtel.value = 	get.mem_comtel1.value +"-"+
							get.mem_comtel2.value +"-"+
							get.mem_comtel3.value;
	
	get.mem_hp.value = 	get.mem_hp1.value +"-"+
						get.mem_hp2.value +"-"+
						get.mem_hp3.value;
	
	get.mem_mail.value = get.mem_mail_id.value +"@"+
				   get.mem_mail_domain.value;
	
	get.mem_zip.value = get.mem_zip1.value +"-"+ get.mem_zip2.value;
	
	alert(get.mem_bir.value+"\n"+get.mem_hometel.value+"\n"+get.mem_comtel.value+"\n"+get.mem_mail.value+"\n"+get.mem_zip.value);
	return true;
}
function idCheck(){
	var mem_id = $('input[name=mem_id]').val();
	if(mem_id != ""){
		$.ajax({
			url:'<%=request.getContextPath()%>/06/idOverlapCheck.jsp',
			dataType:'xml',
			data:{id:mem_id},
			error:function(result){
				alert('error:'+result);	
			},
			success:function(result){
				 var check = $(result).find('check').text();
				 //var ddd	=  0
				 alert(check);
					if(check=='tt'){
						alert('다른아이디를 이용해주세요');
					}else{
						alert('사용가능한 아이디입니다.');
					}
	         
				}
			});
	}else{
		alert('아이디를 입력해 주세요');
	}
	//1.input name='mem_id' tag 를 셀렉팅
	//2.선택된 name='mem_id'값 존재여부 체크
	//3.존재한다면
	//		idOverlapCheck.jsp로 mem_id=입력값 전달해서 ajax요청
	//	else
	//		alert('아이디를 입력해주세요');
	//4.ajax 요청 후 success:function(){
	//						취득값이 false
	//							alert('사용할수없는아이디');
	//							input name='mem_id'의 value값을 초기화 후 포커싱
	//								true
	//							alert('사용할수있는 아이디');
	//							input name='mem_pass'로 포커싱
	//						}
}


function zipcodeSearch(){
	//모달:팝업이 활성화되면 포커스가 활성화된 팝업에 강제됨
	//모달리스:팝업의 활성화 유무에 관계없이 포커스가 이동.
	var url ='<%=request.getContextPath()%>/06/zipcodeSearch.jsp';
	var options = 'toolbar=no,scrollbars=no,resizable=no,copyhistory=no'+
				  'status=no,location=no,menubar=no,width=375,height=400';
	window.open(url, '우편번호검색', options);
}

</script>


</head>




<body>
<form id="whenupdate" name="memberForm"  method="post" onsubmit="return beforesubmit(this);">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" class="disAble" name="mem_name" value='<%=(memberinfo.getMem_name()!=null)?memberinfo.getMem_name():""%>' /> 실명을 입력하세요.
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
  			<input type="text" class="disAble" name="mem_regno1" size="7" value="<%=memberinfo.getMem_regno1()!=null?memberinfo.getMem_regno1():"" %>"/>-
  			<input type="text" class="disAble" name="mem_regno2" size="7" value="<%=memberinfo.getMem_regno2()!=null?memberinfo.getMem_regno2():"" %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<input type="text" class="disAble" name="mem_bir1" size="4" 
					value="<%=memberinfo.getMem_bir()!=null?memberinfo.getMem_bir().substring(0, 4):""%>"/>년
				<input type="text" class="disAble" name="mem_bir2" size="2" 
					value="<%=memberinfo.getMem_bir()!=null?memberinfo.getMem_bir().substring(5, 7):""%>"/>월
				<input type="text" class="disAble" name="mem_bir3" size="2" 
					value="<%=memberinfo.getMem_bir()!=null?memberinfo.getMem_bir().substring(8):""%>"/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" class="disAble" name="mem_id" 
				value="<%=memberinfo.getMem_id()!=null?memberinfo.getMem_id():""%>" /> 8 ~ 20 자리 영문자 및 숫자 사용 <b><a href="javascript:idCheck()">[ID 중복검사]</a></b>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName"  width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" class="disAble" name="mem_pass" 
				value="<%=memberinfo.getMem_pass()!=null?memberinfo.getMem_pass():""%>" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" class="disAble" name="mem_pass_confirm" 
				value="<%=memberinfo.getMem_pass()!=null?memberinfo.getMem_pass():""%>" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
	<%
	String[] hometelnull = {"02","",""};
	String[] hometel =memberinfo.getMem_hometel()!=null ? memberinfo.getMem_hometel().split("-"):hometelnull;

	%>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02"  <%=hometel[0]=="02" ?"selected":""%>>02 </option>
				<option value="031" <%=hometel[0]=="031"?"selected":""%>>031</option>
				<option value="032" <%=hometel[0]=="032"?"selected":""%>>032</option>								        	
				<option value="033" <%=hometel[0]=="033"?"selected":""%>>033</option>				        	
				<option value="041" <%=hometel[0]=="041"?"selected":""%>>041</option>
				<option value="042" <%=hometel[0]=="042"?"selected":""%>>042</option>				        	
				<option value="043" <%=hometel[0]=="043"?"selected":""%>>043</option>				        	
				<option value="051" <%=hometel[0]=="051"?"selected":""%>>051</option>				        	
				<option value="052" <%=hometel[0]=="052"?"selected":""%>>052</option>
				<option value="053" <%=hometel[0]=="053"?"selected":""%>>053</option>				        					        	
				<option value="061" <%=hometel[0]=="061"?"selected":""%>>061</option>
				<option value="062" <%=hometel[0]=="062"?"selected":""%>>062</option>
				<option value="063" <%=hometel[0]=="063"?"selected":""%>>063</option>				        					        				
				<option value="064" <%=hometel[0]=="064"?"selected":""%>>064</option>				        					        					  
				<option value="070" <%=hometel[0]=="070"?"selected":""%>>070</option>				        					        		
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" 
				value="<%=hometel[1]!=null?hometel[1]:"" %>" /> - 
			<input type="text" name="mem_hometel3" size="4" 
				value="<%=hometel[2]!=null?hometel[2]:"" %>" />
		</td>
	</tr>
	<tr>
	<%
	String[] comtelnull = {"02","",""};
	String[] comtel =memberinfo.getMem_comtel()!=null ? memberinfo.getMem_comtel().split("-"):comtelnull;
	%>
		<td class="fieldName" width="100px" height="25">회사전화번호</td>
		<td>
			<input type="hidden" name="mem_comtel"/>
			<select name="mem_comtel1">
				<option value="02"  <%= comtel[0]=="02"?"selected":""%>">02</option>
				<option value="031" <%= comtel[0]=="031"?"selected":""%>>031</option>
				<option value="032" <%= comtel[0]=="032"?"selected":""%>>032</option>								        	
				<option value="033" <%= comtel[0]=="033"?"selected":""%>>033</option>				        	
				<option value="041" <%= comtel[0]=="041"?"selected":""%>>041</option>
				<option value="042" <%= comtel[0]=="042"?"selected":""%>>042</option>				        	
				<option value="043" <%= comtel[0]=="043"?"selected":""%>>043</option>				        	
				<option value="051" <%= comtel[0]=="051"?"selected":""%>>051</option>				        	
				<option value="052" <%= comtel[0]=="052"?"selected":""%>>052</option>
				<option value="053" <%= comtel[0]=="053"?"selected":""%>>053</option>				        					        	
				<option value="061" <%= comtel[0]=="061"?"selected":""%>>061</option>
				<option value="062" <%= comtel[0]=="062"?"selected":""%>>062</option>
				<option value="063" <%= comtel[0]=="063"?"selected":""%>>063</option>				        					        				
				<option value="064" <%= comtel[0]=="064"?"selected":""%>>064</option>				        					        					  
				<option value="070" <%= comtel[0]=="070"?"selected":""%>>070</option>				        					        		
			</select>	- 	
			<input type="text" name="mem_comtel2" size="4" 
				value="<%=comtel[1]!=null?comtel[1]:"" %>" /> - 
			<input type="text" name="mem_comtel3" size="4" 
				value="<%=comtel[2]!=null?comtel[2]:"" %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<%
		String[] hpnull = {"010","",""};
		String[] hp =memberinfo.getMem_hp()!=null ? memberinfo.getMem_hp().split("-"):hpnull;
		%>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010" <%= hp[0]=="010"?"selected":""%>>010</option>
				<option value="016" <%= hp[0]=="016"?"selected":""%>>016</option>				        	
				<option value="017" <%= hp[0]=="017"?"selected":""%>>017</option>				        	
				<option value="019" <%= hp[0]=="019"?"selected":""%>>019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" 
				value="<%=hp[1]!=null?hp[1]:"" %>" /> - 
			<input type="text" name="mem_hp3" size="4" 
				value="<%=hp[2]!=null?hp[2]:"" %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
	<%	
		String[] mailnull = {"","naver.com"};
		String[] mail = memberinfo.getMem_mail()!=null ? memberinfo.getMem_mail().split("@") : mailnull ;
	%>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail_id" 
					value="<%=mail[0]!=null?mail[0]:"" %>" /> @
			<select name="mem_mail_domain">
				<option value="naver.com"  <%=mail[1]=="naver.com"?"selected":""%>>naver.com</option>
				<option value="daum.net"   <%=mail[1]=="daum.net"?"selected":""%>>daum.net</option>
				<option value="hanmail.net"<%=mail[1]=="hanmail.net"?"selected":""%>>hanmail.net</option>
				<option value="nate.com"   <%=mail[1]=="nate.com"?"selected":""%>>nate.com</option>
				<option value="gmail.com"  <%=mail[1]=="gmail.com"?"selected":""%>>gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<%
			String[] zipnull = {"",""};
			String[] zip = memberinfo.getMem_zip()!=null ? memberinfo.getMem_zip().split("-") :zipnull;
		%>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" id="mem_zip1" size="3" 
				value="<%=zip[0]!=null?zip[0]:"" %>" /> - 
			<input type="text" id="mem_zip2" size="3" 
				value="<%=zip[1]!=null?zip[1]:"" %>" />
			<input type="button" value="우편번호검색" onclick="zipcodeSearch()"/><br>
			<input type="text" id="mem_add1" name="mem_add1" size="50" 
				value="<%=memberinfo.getMem_add1()!=null?memberinfo.getMem_add1():"" %>" />
			<input type="text" id="mem_add2" name="mem_add2" size="50" 
				value="<%=memberinfo.getMem_add2()!=null?memberinfo.getMem_add2():"" %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value="<%=memberinfo.getMem_job() != null?memberinfo.getMem_job():"" %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value="<%=memberinfo.getMem_like() != null?memberinfo.getMem_like():"" %>"/>
		</td>
	</tr>
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<input id="update" type="submit" value="수정" onclick="javascript:form.action='<%=request.getContextPath() %>/06/updateMemberInfo.jsp'"/>
			<input id="apply" type="submit" value="가입하기" onclick="javascript:form.action='<%=request.getContextPath() %>/06/insertMember.jsp'"/>
			<input type="reset" value="취소"/>
			<input type="button" value="목록" onclick="javascrip:location.href='<%=request.getContextPath()%>/06/main.jsp?contentPage=memberList.jsp'"/>
		</td>
	</tr>

</table>
</form>
</body>
</html>








