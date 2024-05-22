<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<jsp:useBean id="userDTO" class="sake.userDTO" />
<jsp:setProperty name="userDTO" property="*" />
<%
	boolean user = sakeDAO.userLog(userDTO);

	if(user == true){
		session.setAttribute("user_id", userDTO.getUser_id());
		session.setMaxInactiveInterval(30 * 60); // 30분 유지 -> session 기본 유지 단위 : 초
		response.sendRedirect("../index.jsp");
	}else{
%>
<%
	
	response.sendRedirect("./login.jsp");
}
	
	
%>