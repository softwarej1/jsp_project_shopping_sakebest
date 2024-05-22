<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
    <%@ page import = "sake.userDTO" %>
    <%@ page import = "sake.sakeDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
<link rel="icon" type="image/x-icon" href="../img/sake-best-logo-zip-file/png/logo-icon.png">
<link rel="stylesheet" href="./../css/user_update.css">
</head>
<body>

	<%
	sakeDAO dao = new sakeDAO();
	String user_id = (String)session.getAttribute("user_id");
	userDTO dto = dao.userPage(user_id); 
	
	%>
	<div id="container">
        <h2>회원정보 변경</h2>
        <table>
            <tr>
                <td class="text_title"> 아이디</td>
                <td class="text_line"><input id="user_id" type="text" value="<%=dto.getUser_id()%>" readonly="readonly"></td>
            </tr>
             <tr>
                <td class="text_title"> 비밀번호</td>
                <td class="text_line"><input id="user_pwd" type="text" value="<%=dto.getUser_pwd()%>"></td>
            </tr>
            <tr>
                <td class="text_title"> 이름</td>
                <td class="text_line"><input id="user_name" type="text" value="<%=dto.getUser_name()%>"></td>
            </tr>
            <tr>
                <td class="text_title"> 생년월일</td>
                <td class="text_line"><input id="user_birth" type="text" value="<%=dto.getUser_birth()%>"></td>
            </tr>
            <tr>
                <td class="text_title"> 휴대폰 번호</td>
                <td class="text_line"><input id="user_phone" type="text" value="<%=dto.getUser_phone()%>"></td>
            </tr>
            <tr>
                <td class="text_title"> 주소</td>
                <td class="text_line"><input id="user_addr" type="text" value="<%=dto.getUser_addr()%>"></td>
            </tr>
        </table>
        <div id="button_box">
            <input type="button" value="확인" onclick="update()">
            <input type="button" value="취소" onclick="goback()">
        </div>
    </div>
    <script type="text/javascript" src="./../js/user_update.js"></script>

</body>
</html>