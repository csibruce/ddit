<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[type=image]').click(function(){
			alert('dd');
			var dong = $('#dong').val();
			if(dong){
				$.ajax({
					url:'<%=request.getContextPath()%>/06/zipcodeSearching.jsp',
					dataType:'json',
					data:{dong:dong},
					error:function(result){
						alert(result);	
					},
					success:function(result){
						alert('success');
						//우편번호 데이타 취득후 동적으로 테이블 작성 및 추가	
						var htmls = '<table width="100%" height="190" border="0"'+
									'cellspacing="0" cellpadding="0"'+
									'style="overflow:scroll;"'+
									'<thead>'+
										'<tr>'+
											'<th>우편번호</th>'+
											'<th>시도</th>'+
											'<th>구군</th>'+
											'<th>동(읍/면)</th>'+
										'</tr>'+
									'</thead>'+
									'<tbody>';
						for(var i=0; i<result.length;i++){
							htmls += '<tr>'+
										'<td>'+result[i].zipcode+'</td>'+
										'<td>'+result[i].sido+'</td>'+
										'<td>'+result[i].gugun+'</td>'+
										'<td>'+result[i].dong+'</td>'+
									 '</tr>';
						}
						htmls += '</tbody></table>';
						alert(htmls);
						$('#viewTable').empty().append(htmls);
					}
					
				});
			}else{
				alert('주소를 입력해 주세요')
			}
		});
	});
	
	function winndowclose(code,addr){
		var zipcode = code.split('-');
		
		//$('#mem_zip1',opener.document).val(zipcode[0]);
		//$('#mem_zip2',opener.document).val(zipcode[1]);
		//$('#mem_add1',opener.document).val(addr);
		//$('#mem_add2',opener.document).focus();
		
		$(opener.docunemt).find('#mem_zip1').val(zipcode[0]);
		$(opener.docunemt).find('#mem_zip2').val(zipcode[1]);
		$(opener.docunemt).find('#mem_add1').val(addr);
		$(opener.docunemt).find('#mem_add2').focus();
		
		self.close();
	}
</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><img src="../image/open_post.gif" width="136"
				height="22"></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">찾고자 하는 지역의 동이름을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="dong">&nbsp;동(읍/면)&nbsp;
							<input type="image" src="../image/bt_search.gif" border='0'
							align="middle" >
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>