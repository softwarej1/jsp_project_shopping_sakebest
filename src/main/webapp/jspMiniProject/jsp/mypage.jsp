<%@page import="java.util.ArrayList"%>
<%@page import="sake.reviewDTO"%>
<%@page import="java.text.Format"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ page import="sake.userDTO"%>
<%@ page import="sake.sakeDAO"%>
<%@ page import="sake.sakeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
<link rel="icon" type="image/x-icon"
	href="../img/sake-best-logo-zip-file/png/logo-icon.png">
<link rel="stylesheet" href="./../css/mypage.css">
</head>
<body>

	<%
	sakeDAO dao = new sakeDAO();
	String user_id = (String) session.getAttribute("user_id");
	userDTO userDTO = dao.userPage(user_id);
	%>
	<div id="container">
		<h2>회원정보</h2>
		<table>
			<tr>
				<td class="text_title">아이디</td>
				<td class="text_line"><input type="text"
					value="<%=userDTO.getUser_id()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="text_title">이름</td>
				<td class="text_line"><input type="text"
					value="<%=userDTO.getUser_name()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="text_title">생년월일</td>
				<td class="text_line"><input type="text"
					value="<%=userDTO.getUser_birth()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="text_title">휴대폰 번호</td>
				<td class="text_line"><input type="text"
					value="<%=userDTO.getUser_phone()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="text_title">주소</td>
				<td class="text_line"><input type="text"
					value="<%=userDTO.getUser_addr()%>" readonly="readonly"></td>
			</tr>
		</table>
		<div id="button_box">
			<input type="button" value="회원정보 수정" onclick="update_user()">
			<input type="button" value="로그아웃" onclick="logout()">
		</div>
	</div>
	
	<%
	ArrayList<reviewDTO> reviewArrDTO = dao.reveiwSelect(user_id, 0);
		if(reviewArrDTO.isEmpty()){
			
		}else{
	%>
	
	
	
	<div id="container_bottom">
		<%
		
		

		for (int idx = 0; idx < reviewArrDTO.size(); idx++) {
			if(reviewArrDTO.get(idx).getReview_title() == null){
			sakeDTO sakeDto = dao.sakeSelect(reviewArrDTO.get(idx).getReview_no());
		%>
		<form action="./mypage_review_write.jsp">
			<input type="hidden" name = "review_name" value = "<%= reviewArrDTO.get(idx).getReview_name() %>" >
			<input type="hidden" name = "review_no" value = "<%= reviewArrDTO.get(idx).getReview_no() %>" >
			

			<div class="review_box">
				<a
					href="./alchol/alchol_detail_product.jsp?sake_no=<%= reviewArrDTO.get(idx).getReview_no() %>">
					<div class="img_box">
						<img src="./../<%= sakeDto.getSake_img() %>">
					</div>
					<div class="text_box">
						<p class="title"><%=sakeDto.getSake_name_kr()%></p>
						<p><%=String.format("%,d", sakeDto.getSake_price())%></p>
					</div>
				</a>
				<hr>
				<input class="review" type="submit" value="리뷰쓰기">
			</div>
		</form>

		<%
			}
		}
		}
		%>
	</div>
	<script type="text/javascript" src="../js/mypage.js"></script>

</body>
</html>