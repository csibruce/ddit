<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	//http://localhost/ddit/02/viewParameter.jsp
	//	?mem_id=a001&mem_pass=asdfasdf
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	String mem_name = request.getParameter("mem_name");
	String mem_like = request.getParameter("mem_like");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//document readyState
	//		uninitialized : 브라우저에 출력하기위해서 취득한 html, javascript 컨텐츠 로딩시작
	//		loading       : 로딩이 완료
	//		interactive   : 유저의 조작 가능상태
	//      complete      : 이벤트 처리가 가능
</script>
</head>
<body>
<%=mem_id %> : <%=mem_pass %> : <%=mem_name %> : <%=mem_like %><br/>
<hr>
<h3>request.getParameterValues()</h3>
<%
	String[] mem_ids = request.getParameterValues("mem_id");
	String[] mem_likes = request.getParameterValues("mem_like");
	
	for(String memLike : mem_likes){%>
		mem_like = <%=memLike%><br>
	<% }
%>
<hr>

<h3>request.getParameterNames()</h3>
<%
  // HashTable or Vector를 통해서 취득 가능한 컬렉션 요소별 순차 접근 객체
  // 자바 초기버전부터 포함
  // 특징 :  대상 컬렉션으로부터 순차접근 대상의 요소들을 복사해서 활용
  //		스냅-샷을 지원
  Enumeration enums =request.getParameterNames();

  while(enums.hasMoreElements()){
	  String key = (String)enums.nextElement();
	  String[] values = request.getParameterValues(key);
	  
	  for(String value : values){%>
		<%=key %> : <%=value %> <br> 
	 <% }
  }		

%>
<hr>
<h3>request.getParameterMap() key:String[]</h3>

<%
	Map<String, String[]> paramMap = request.getParameterMap();
	Set<String> keySet = paramMap.keySet();
	
	// 자바1.2 버전부터 포함
	// fail-fast 방식.(대상 컬렉션의 각 요소에 순차적으로 접근)
	// 모든 컬렉션으로부터 취득.
	Iterator<String> itrs =  keySet.iterator();
	
	while(itrs.hasNext()){
		String key = itrs.next();
		String[] values =paramMap.get(key);
		for(String value : values){
			%>
			<%=key %> : <%=value %><br>
		 
		<%}
		
		
	}
%>



</body>
</html>