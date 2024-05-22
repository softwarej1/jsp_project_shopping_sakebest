<%@page import="sake.sakeDTO"%>
<%@page import="sake.sakeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon"
    href="../../img/sake-best-logo-zip-file/png/logo-icon.png">
<link rel="stylesheet" href="../../css/alchol/alchol_cart.css">
<script type="text/javascript" src="../../js/alchol/alchol_cart.js"></script>
<%@ page import="java.util.List"%>
<jsp:useBean id="sakeDTO" class="sake.sakeDTO" />
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<jsp:useBean id="userDTO" class="sake.userDTO" />

<title>장바구니</title>
</head>
<body onload="init()">
    <jsp:include page="../header.jsp" />
    <form method="get" action="./alchol_cart_pro.jsp">
        <div id="wrapper">
            <div class="cart_info">
                <ul>
                    <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                    <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                    <li>오늘출발 정보는 판매자가 설정한 정보에 의해 제공되며, 물류위탁 상품인 경우 물류사의 사정에 따라 실제와 다를 수 있습니다.</li>
                </ul>
            </div>
            <table class="cart_table" width="1280px">
                <tr>
                    <th width="30px"><input type="checkbox" class="Chk" onclick="toggleAll(this)"></th>
                    <th width="550px" colspan="2">상품정보</th>
                    <th width="400px">수량</th>
                    <th width="150px">상품금액</th>
                    <th width="150px">배송비</th>
                </tr>
                <%
                String user_id = (String) session.getAttribute("user_id");
                String sake_list_no = "";
                String sake_EA = "";
                String usePrice = "";
                String multiplePrice ="";

                if (user_id == null) {
                    // 비로그인 시
                } else {
                    String cart = sakeDAO.cartList(user_id);
                    
                    if (cart == null || cart.isEmpty()) {
                        // 장바구니가 비어있을 시
                    } else {
                        String[] cartArr = cart.split(",");//1-fruitwine03,1-fruitwine04, > ","기준으로 자름
                        
                        for (int idx = 0; idx < cartArr.length; idx++) {
                            String sakeSplit = cartArr[idx];
                            String[] sakeArr = sakeSplit.split("-");//1-fruitwine03 > "-"기준으로 자름
                            sakeDTO dto = sakeDAO.sakeSelect(sakeArr[1]);
                            usePrice = String.format("%,d", dto.getSake_price());
                            multiplePrice = String.format("%,d", dto.getSake_price() * Integer.parseInt(sakeArr[0])); 
			                %>
			                <tr class="cart_list_detail">
			                    <td><input type="checkbox" class="check" name="check"></td>
			                    <td class="imageCell"><img src="../../<%=dto.getSake_img()%>" alt="상품 이미지"></td>
			                    <td><a class="name" href="./alchol_detail_product.jsp?sake_no=<%=dto.getSake_no()%>"><%=dto.getSake_name()%></a>
			                        <p class="price"><%=usePrice%>원</p></td>
			                    <td><p class="EA"><%=sakeArr[0]%>개</p></td>
			                    <td><p class="totalPrice"><%=multiplePrice%>원</p></td>
			                    <td></td>
			                </tr>
			                <input type="hidden" class="sake_no" name="sake_no" value="<%=dto.getSake_no()%>">
			                <input type="hidden" name="sake_name" value="<%=dto.getSake_name()%>">
			                <input type="hidden" name="sake_price" value="<%=dto.getSake_price()%>">
			                <input type="hidden" name="totalPrice" value="<%=dto.getSake_price() * Integer.parseInt(sakeArr[0])%>">
			                <input type="hidden" class="quantity" name="quantity" value="<%=sakeArr[0]%>">
			                <input type="hidden" name="cart" value="<%=cart%>">
			                <%
			                sake_list_no += dto.getSake_no()+"-";
	                        sake_EA += sakeArr[0]+"-";
                        }

                    }
                }
                %>
            </table>
		                <input type="hidden" name="sake_list_no" value="<%=sake_list_no%>">
		                <input type="hidden" name="sake_EA" value="<%=sake_EA%>">
            <div class="select_box">
                <input type="button" value="선택상품 삭제" class="product_delete" onclick="selectDel()">
                <input type="button" value="선택상품 찜" class="product_zzim">
            </div>

            <div class="payment_box">
                <input type="button" value="쇼핑 계속하기" onclick = "mGoMenu()">
                <input type="submit" value="주문하기" onclick = "mOrder()">
            </div>
        </div>
    </form>
</body>
</html>