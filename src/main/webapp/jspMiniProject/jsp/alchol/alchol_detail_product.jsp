<%@page import="sake.reviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sake.sakeDTO"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="sake.sakeDAO" />
<%
String userId = (String) session.getAttribute("user_id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet"
	href="./../../css/alchol/alchol_detail_product.css">
<link rel="icon" type="image/x-icon"
	href="../../img/sake-best-logo-zip-file/png/logo-icon.png">
<script type="text/javascript"
	src="../../js/alchol/alchol_detail_product.js"></script>

<%
String sake_no = request.getParameter("sake_no");
sakeDTO dto = dao.sakeProSelect(sake_no);
%>
</head>
<body onload="onInit()">
	<div id="wrapper">
		<jsp:include page="../header.jsp" />
		<form action="./alchol_cart.jsp">
			<div class="infoBox">
				<div class="imgBox">
					<img id="sImg" src="../../<%=dto.getSake_img()%>" alt=""
						class="alcholImg">
				</div>
				<div class="detailBox">
					<div class="textDetailBox">
						<input type="hidden" id="sNo" value="<%=dto.getSake_no()%>">
						<p name="sake_no"><%=dto.getSake_no()%></p>
						<h2 name="sake_name"><%=dto.getSake_name()%></h2>
						<hr>
						<h2 name="sake_price">
							가격 :
							<%=String.format("%,d", dto.getSake_price())%>
							원
						</h2>
						<p name="sake_dosu">
							알콜도수 :
							<%=dto.getSake_dosu()%>
							%
						</p>
						<p name="sake_loc">
							주조지역 :
							<%=dto.getSake_loc()%></p>
						<p name="sake_co">
							주조장 :
							<%=dto.getSake_co()%></p>
						<p name="sake_des">
							설명 :
							<%=dto.getSake_des()%></p>
					</div>
					<div class="cartControls">
						<div class="amount">
							<p class="amountP">수량 :</p>
							<select name="quantity" id="quantity">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
						</div>

						<div class="ButtonBox">
							<input type="button" value="장바구니" onclick="putCart()"> <input
								type="button" value="구매하기" onclick="buy('<%= userId %>')">
						</div>
					</div>
					<div class="heartBox">
						<img src="../../img/off_heart.png" alt="off_heart" id="heartImg"
							onclick="choiceHeart()">
					</div>
				</div>
			</div>
		</form>

		<%
		int star = 0;
		int sumStar = 0;
		int cnt = 0;
		ArrayList<reviewDTO> reviewArrDTO = dao.reveiwSelect(sake_no, 1);

		if (!reviewArrDTO.isEmpty()) {
			for (int idx = 0; idx < reviewArrDTO.size(); idx++) {
				if (reviewArrDTO.get(idx).getReview_star() != null) {
			star = Integer.parseInt(reviewArrDTO.get(idx).getReview_star());
			sumStar += star;
			cnt++;
				}
			}
			sumStar = (int) sumStar / reviewArrDTO.size();

		}
		%>

		<hr>
		<div class="review_total_box">
			<p class="review_title">상품평</p>
			<p>동일한 상품에 대해 작성된 상품평으로, 판매자는 다를 수 있습니다.</p>
			<div id="empty">
				<%
				for (int idx = 0; idx < sumStar; idx++) {
				%>
				<div id="full"></div>
				<%
				}
				%>
			</div>
			<p class="quantity"><%=cnt%></p>
		</div>

		<%
		for (int idx = 0; idx < reviewArrDTO.size(); idx++) {
			if (reviewArrDTO.get(idx).getReview_star() != null) {
				sakeDTO sakeDTO = dao.sakeSelect(reviewArrDTO.get(idx).getReview_no());
				int starNum = Integer.parseInt(reviewArrDTO.get(idx).getReview_star());
		%>

		<div class="review_box">
			<hr>
			<img class="user_img" src="../../img/user_icon.png" alt="user_icon">
			<p class="user_name"><%=reviewArrDTO.get(idx).getReview_name()%></p>
			<div id="small_empty">
				<%
				for (int innerIdx = 0; innerIdx < starNum; innerIdx++) {
				%>

				<div id="small_full"></div>
				<%
				}
				%>

			</div>
			<p class="user_date"><%=reviewArrDTO.get(idx).getReview_date()%></p>
			<p class="user_content"><b>상품명 : </b><%=sakeDTO.getSake_name()%>
				<b>수량 :</b>
				<%=reviewArrDTO.get(idx).getReview_quantity()%></p>
			<p class="user_content"><b>제목 : </b><%=reviewArrDTO.get(idx).getReview_title()%></p>
			<p class="user_content"><%=reviewArrDTO.get(idx).getReview_content()%></p>
		</div>



		<%
		}
		}
		%>




	</div>
	<script>
		window.addEventListener('load', function() {
			let message = {
				height : document.body.scrollHeight
			};

			window.top.postMessage(message, "*");
		});
	</script>
</body>

</html>