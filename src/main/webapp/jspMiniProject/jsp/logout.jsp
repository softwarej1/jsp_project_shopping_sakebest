<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = (String)session.getAttribute("user_id");

if(user!=null){
	session.removeAttribute("user_id");
%>
<script type="text/javascript">
alert("정상적으로 로그아웃 되었습니다.");
</script>
<%
response.sendRedirect("./../index.jsp");
}else{
	
}
%>
</body>
</html>