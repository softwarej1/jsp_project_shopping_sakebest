<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login_pwd_reset.css">
</head>
<body>
<jsp:useBean id="dto" class="sake.userDTO"/>
<jsp:useBean id="dao" class="sake.sakeDAO"/>
<%
String get_info = request.getParameter("user_info");
String user_info[] = get_info.split("!");
String user_id = user_info[0];
String name = user_info[1];
String birth = user_info[2];
String phone = user_info[3];
int su=0;

su = dao.recovery_pwd(user_id, name, birth, phone,dto);


%>

<div id="container">
<form action="./login_pwd_reset_pro.jsp" method="post">
<input type="hidden" id="user_id" name="user_id" value="<%=dto.getUser_id()%>">
	<fieldset>
		<legend>비밀번호 재설정</legend>
		<p>변경하여 사용하실 비밀번호를 입력해주세요.</p>
		<div class="text_box">
			<input type="text" id="chg_pwd" name="chg_pwd"  placeholder="비밀번호">
        </div>
        <div class="text_box">
			<input type="text"   placeholder="비밀번호 확인">
        </div>
	</fieldset>
	<input type="submit" value="확인">
	<input type= "button" value="취소" onclick="login()">
</form>
	
</div>
<script type="text/javascript">
function login(){
	location.href="./login.jsp";
}
</script>
</body>
</html>