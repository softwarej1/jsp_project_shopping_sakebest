<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="sake.userDTO"/>
<jsp:useBean id="dao" class="sake.sakeDAO"/>
<%


String id = request.getParameter("user_id");
String pwd = request.getParameter("chg_pwd");
int su=0;

su = dao.reset_pwd(id, pwd);
if(su!=0){
%>
<script type="text/javascript">
alert("비밀번호 변경을 완료했습니다.");
let chk=confirm("로그인 화면으로 이동하시겠습니까?");
if (chk == true) {
	location.href="./login.jsp";
}else{
	location.href="./../index.jsp"
}
</script>
<%
}


%>


	
</div>
</body>
</html>