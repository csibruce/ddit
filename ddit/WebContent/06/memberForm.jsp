
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

<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>



<script type="text/javascript">

function beforesubmit(get){
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
				value="<%=memberinfo.getMem_id()!=null?memberinfo.getMem_id():""%>" /> 8 ~ 20 자리 영문자 및 숫자 사용 <b><a href="#">[ID 중복검사]</a></b>
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
			<input type="button" value="우편번호검색"/><br>
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








