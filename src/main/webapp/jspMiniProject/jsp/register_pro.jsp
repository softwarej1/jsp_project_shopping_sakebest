<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<jsp:useBean id="userDTO" class="sake.userDTO" />
<jsp:setProperty name="userDTO" property="*" />
<%
	int su = sakeDAO.inputUser(userDTO);

	response.sendRedirect("./login.jsp");
%>