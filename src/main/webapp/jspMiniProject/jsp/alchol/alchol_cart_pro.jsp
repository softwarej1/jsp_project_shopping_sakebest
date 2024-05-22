<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="sake.sakeDAO"></jsp:useBean>
<%
String cart_value = request.getParameter("cartValue");
String user_id = (String) session.getAttribute("user_id"); 
int su =dao.delCart(cart_value, user_id);
%>
<script>
    window.location.href = "./alchol_cart.jsp";
</script>
</body>
</html>