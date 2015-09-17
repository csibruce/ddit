<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="service.IMemberServiceImpl"%>
<%@page import="service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = request.getParameter("msg");
	application.log("msg : "+msg);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/commons.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function dynamicCreateForm(){
	// javascript에서 유니코드 기반 인코딩/디코딩
	// escape() / unescape() : 유니코드 형식으로 인코딩/디코딩
	// 						   URL이 아귀먼트로 전달시에는 활용되는 모든 기호까지 유니코드로 변환
	// encodeURI() / decodeURI() : 유니코드 형식으로 인코딩/디코딩
	//							   URL이 아귀먼트로 전달시에는 활용되는 기호는 유니코드로 변환하지 않음.
	// encodeURICompnent() / decodeURIComponent() : 유니코드 형식으로 인코딩/디코딩
	//												URL 전달시 활용되는 기호는 유니코드로 변환하지 않음.
	//												한글 파라메터, Content 처리시 활용.
	
	var frm = document.createElement("form");
	frm.setAttribute("name", "dynamicForm");
	frm.setAttribute("method", "post");
	frm.setAttribute("action", "<%=request.getContextPath()%>/01/comment.jsp");
	
	var xmlBtn = document.createElement("input");
	xmlBtn.setAttribute("type", "button");
	xmlBtn.setAttribute("value", "xmlReq");
	
	var jsonBtn = document.createElement('input');
	jsonBtn.setAttribute('type', 'button');
	jsonBtn.setAttribute('value', 'jsonReq');
	
	
	
	//IE11 이하버젼에서 활용
	xmlBtn.attachEvent("onclick", function(){
		var xmlHttp = createXMLHttpRequest();
		// readyState = 0 :XMLHttpRequest 생성
		//				1: open() 호출
		//				2: send() 호출
		//				3: 서버 응답 컨텐츠 수신 중
		//				4: 해당 요청에 따른 응답 수신 완료
		xmlHttp.onreadystatechange = function(){
			if(xmlHttp.readyState == 4){
				if(xmlHttp.status==200){
					var xmlData = xmlHttp.responseText;
					document.getElementById('test').innerHTML=xmlData;
					//var xmlData = xmlHttp.responseXML;
				
					//alert('xml: '+xmlData);
				}
			}
		};
		var url = '<%=request.getContextPath()%>/11/createXmlContent.jsp?msg=hello';
		xmlHttp.open("get",url,true);
		xmlHttp.send();
	});
	//IE11 버젼 또는 IE이외의 브라우져.
	//xmlBtn.addEventListener("click", listener, useCapture);
	
	jsonBtn.attachEvent('onclick', function(){
		var xmlHttpReq = createXMLHttpRequest();
		
		xmlHttpReq.onreadystatechange = function(){
			if(xmlHttpReq.readyState == 4){
				if(xmlHttpReq.status == 200){
					var jsonData = eval('('+xmlHttpReq.responseText+')');
					//alert(jsonData);
					for(var i=0;i<jsonData.length; i++){
						window.console.log('mem_id : '+jsonData[i].mem_id+
											'| mem_pass : '+jsonData[i].mem_pass);
					}
				}
			}
		};
		
		var url = '<%=request.getContextPath()%>/11/createJsonContent.jsp';
		xmlHttpReq.open('post',url,true);
		xmlHttpReq.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		xmlHttpReq.send('msg=hello');
	});
	
	frm.appendChild(xmlBtn);
	frm.appendChild(jsonBtn);
	document.body.appendChild(frm);
	
}
$(function(){
	$(document.body).append("<input type='button' value='jqueryXMLReq'/>");
	$(document.body).append("<input type='button' value='jqueryJsonReq'/>");
	
	$("input[value=jqueryXMLReq]").click(function(){
		$.ajax({
			type:"post",
			dataType:"xml",
			url:"<%=request.getContextPath()%>/11/createXMLContent.jsp",
			data:{msg:"hello"},
			error:function(result){
				var rtn = result;
				alert(rtn);
			},
			success:function(result){
				$(document.body).append("<div id='xmlResult'></div>");
				$('member',result).each(function(){
					$('#xmlResult').text($('#xmlResult').text()+'\n'+
					$(this).attr('mem_id')+'\n'+
					'mem_name : '+ $('mem_name',this).text()+'\n' +
					'mem_regno1 : '+ $('mem_regno1',this).text()+'\n' +
					'mem_regno2 : '+ $('mem_regno2',this).text()
					);
				})
			}
		});
	})
	$('input[value=jqueryJsonReq]').click(function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/11/createJsonContent.jsp',
			dataType:'json',
			data:{msg:'hello'},
			error:function(result){
				alert(result);	
			},
			success:function(result){
				for(var i=0;i<result.length;i++){
				window.console.log('mem_id : '+result[i].mem_id+
								   '| mem_pass'+ result[i].mem_pass);
					
				}
			}
		});
	});
});
</script>
</head>
<body onload="dynamicCreateForm()">
<div id="test"></div>
</body>
</html>