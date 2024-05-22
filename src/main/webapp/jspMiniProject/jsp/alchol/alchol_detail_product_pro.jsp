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
	String Quantity = request.getParameter("quantity");


	out.print(Quantity +"<br>");

	String user_cart = (Quantity);
	String user_id = (String) session.getAttribute("user_id");
	out.print(user_cart);
	
	int su = 0;
	if (user_id == null) {
	%>
	<script type="text/javascript">
		alert("로그인을 해주세요.");
	</script>
	<%
	response.sendRedirect("./../login.jsp");
	}
	
	su = dao.sendCart(user_cart, user_id);

	if (su != 0) {
	%>
	<script type="text/javascript">
		alert("장바구니에 상품을 추가 하였습니다.");
		let cfRs = confirm("장바구니 창으로 이동하시겠습니까?");
		if (cfRs == true) {
			location.href = "alchol_cart.jsp";
		} else {
			history.go(-1);
		}
	</script>

	<%
	} else {
	out.print("실패!");
	}
	%>
</body>
</html>