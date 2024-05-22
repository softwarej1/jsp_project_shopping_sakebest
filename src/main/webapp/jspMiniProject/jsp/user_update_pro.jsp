<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="sake.sakeDAO"></jsp:useBean>
<%
String user_id = (String)session.getAttribute("user_id");
String upd_info = request.getParameter("upd_info");
String info[] = upd_info.split("/");
String user_pwd = info[0];
String user_name = info[1];
String user_birth = info[2];
String user_phone = info[3];
String user_addr = info[4];
int su = 0;

su = dao.user_info_update(user_id, user_pwd, user_name, user_birth, user_phone, user_addr);
if(su!=0){
%>
<script type="text/javascript">
alert("회원정보 변경 완료");
location.href = "./mypage.jsp";
</script>
<%
}
%>

</body>
</html>