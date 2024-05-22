<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login_id_recovery_pro.css">
<script type="text/javascript" src="./../js/login_id_recovery_pro.js"></script>
</head>
<body>
<jsp:useBean id="dto" class="sake.userDTO"/>
<jsp:useBean id="dao" class="sake.sakeDAO"/>
<%
String get_info = request.getParameter("recovery");
String user_info[] = get_info.split("!");
String name = user_info[0];
String birth = user_info[1];
String phone = user_info[2];
int su=0;

su = dao.recovery_id(name, birth, phone,dto);


%>
<div id="container">
	<fieldset>
		<legend>아이디 찾기</legend>
		<p><%=dto.getUser_name() %>님의 아이디는</p>
		<p><%=dto.getUser_id() %>입니다.</p>
	</fieldset>
	<input type="button" value="비밀번호 찾기" onclick="recovery_pwd()">
	<input type= "button" value="로그인" onclick="login()">
</div>

</body>
</html>