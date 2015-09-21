<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Constructor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 타겟 클래스 룩업(look Up).
	Class targetClz = Class.forName("kr.or.ddit.utils.TargetClz");
	
	Constructor constructor = targetClz.getConstructor();
	
	Object targetObj = constructor.newInstance();
	
	String clzName = targetClz.getName().substring(
							targetClz.getName().lastIndexOf(".")+1);
	
	//사용자 정의 태그  tld 파일은 xml 형태로 작성
	String declareStart = "<?xml version=\"1.0\" encoding=\"UTF-8\"?> \n" +
			               "<taglib xmlns=\"http://java.sun.com/xml/ns/j2ee\" \n" +
	                       "  \t xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n" +
			               "  \txsi:schemaLocation=\"http://java.sun.com/xml/ns/j2ee \n" +
	                       "  \t\t    http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd\" \n" +
			               "\t version=\"2.0\"> \n" +
	                       "<tlib-version>1.0</tlib-version> \n" +
			               "<short-name>" + clzName.toLowerCase() + "</short-name> \n" +
	                       "<uri>http://www.ddit.or.kr/"+clzName+"</uri> \n";
	                       
	String content = "";
	String declareEnd = "</taglib>";
	
	Method[] methods = targetClz.getMethods();
	
	String temp = "";
	
	String objectMethodString = "clone equals finalize hashCode notifyAll toString wait getClass";
	
	for(Method method : methods){
		if(!objectMethodString.contains(method.getName())){
			Class[] params = method.getParameterTypes();
			
			//public Integer plus(Integer x, Integer y){}
			// => java.lang.Integer plus
			String functionSignature = method.getReturnType().getName()+" "+
									method.getName()+"(";
			int paramCnt = -1;
			// 해당 메서드의 파라메터 접근
			for(Class param : params){
				// => java.lang.Integer plus(java.lang.Integer)
				functionSignature += param.getName();
				if(paramCnt++<params.length){
					functionSignature += ",";
				}
			}
			// => java.lang.Integer plus(java.lang.Integer,java.lang.Integer)
			functionSignature += ")";
			
			content += "\n\t<function>\n"+
					   "\t\t<description>"+method.getName()+"의 활용</description>\n";
			if(!(temp.intern()==method.getName().intern())){
				content += "\t\t<name>"+method.getName()+"</name>\n";
			}else{
				content += "\t\t<name"+method.getName()+"<_overrode/name>\n";
			}
			temp = method.getName();
			content += "\n\t\t<function-class>"+targetClz.getName()+"</function-class>\n"+
					   "\t\t<function-signature>"+functionSignature+"</function-signature>\n" +
					   "\t\t\t<example>\n"+
					   "\t\t\t<![CDATA[\n"+
					   "\t\t\t\t${"+ clzName.toLowerCase()+":"+functionSignature.substring(functionSignature.indexOf(" ")+1)+
						   "}\n" + "\t\t\t]]>\n"+
					   "\t\t\t</example>\n"+
					   "\t</function>";
		}
	}
	
	BufferedWriter writer = null;
	try{
		writer = new BufferedWriter(
					new FileWriter(
							new File("D:\\temp\\",clzName.toLowerCase()+".tld")));
		writer.write(declareStart+content+declareEnd);
	}catch(IOException e){
		e.printStackTrace();
	}finally{
		writer.close();
	}
	
	
	
%>