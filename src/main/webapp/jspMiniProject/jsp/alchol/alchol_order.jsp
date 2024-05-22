<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../../css/alchol/alchol_order.css">
    <link rel="stylesheet" href="./../../css/header.css">
    <title>Document</title>

    
    <%@ page import="sake.userDTO" %>
    <%@ page import="sake.sakeDTO" %>
    <%@ page import="sake.sakeDAO" %>
    <%
    	String user_id = (String) session.getAttribute("user_id");
    	String sake_list_no = request.getParameter("sake_list_no");
    	String sake_EA = request.getParameter("sake_EA");
    	
    	String[] noAry = sake_list_no.split("-");		//가져온 속성값을 DB에 저장된 형식으로
    	String[] eaAry = sake_EA.split("-");			//가져온 수량을 원래 형식으로
    	
    	userDTO userDto = new userDTO();
    	sakeDTO dto = new sakeDTO();
    	sakeDAO dao = new sakeDAO();
    	
    	String useImg = "";
		String usePrice = "";
		int settingPrice=0;
		int setTotalPrice=0;
		String totalPrice="";
    %>
    
</head>
<body>
    <div id="content_block">
    	<jsp:include page= "../header.jsp" />
        <p id="orderTitle">주문/결제</p>
        <hr>
        <table id="itemView">
            <tr>
                <th>주문상품</th>
                <th>수량</th>
                <th>상품금액</th>
            </tr>
            <% 
            	for(int i=0; i<noAry.length; i++){
            		dto = dao.sakeSelect(noAry[i]);							//split으로 나눈 값의 DB 정보를 하나씩 꺼내옴
            		useImg = "./../../"+dto.getSake_img();												//이미지 형식에 맞게 재단
            		
            		settingPrice = Integer.parseInt(eaAry[i]) * dto.getSake_price();		//개수 * 개당 금액
            		setTotalPrice += settingPrice;									//상품의 총 금액
            		usePrice = String.format("%,d", settingPrice);		//숫자에 ,가 들어가도록 포멧형식 변경
            %>
            
            <tr class="itemList">
                <td><img src="<%= useImg %>" alt="상품"><p><b><%= dto.getSake_name() %></b></p></td>
                <td><%= eaAry[i] %>개</td>
                <td><%= usePrice %>원</td>
            </tr>
            <%
            	}
            totalPrice = String.format("%,d", setTotalPrice);		//페이지 가장 아래의 총액에 표시할 형태로 변경
            %>
        </table>

        <table id="userData">
        	<%
        		userDto = dao.userPage(user_id);		//유저 정보를 userDto에 세팅
        	%>
            <tr>
                <td>이름</td>
                <td><input type="text" id="user_data_input" value="<%= userDto.getUser_name() %>"></td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><input type="text" id="user_data_input" value="<%= userDto.getUser_phone() %>"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" id="user_data_input" value="<%= userDto.getUser_addr() %>"></td>
            </tr>
            <tr>
                <td>배송 요청사항</td>
                <td id="sizeControl">
                    <select name="yochurng" id="yochurng" onchange="self_write_func()">
                        <option value="문 앞">문 앞</option>
                        <option value="직접 받고 부재 시 문 앞" selected>직접 받고 부재 시 문 앞</option>
                        <option value="경비실">경비실</option>
                        <option value="택배함">택배함</option>
                        <option value="직접입력">직접입력</option>
                    </select>
                    
                  <textarea name="self_write" id="self_write" placeholder="요청사항을 입력해주세요" onchange="chgLength()"></textarea>
                </td>
            </tr>
        </table>

        <div id="orderSelect">
            <p class="selBtn1" onclick="card_bank(0)">신용/체크카드</p>
            <p class="selBtn2" onclick="card_bank(1)">무통장입금</p>
            <div id="bankImg">
                <!-- 카드결제 시 활성화 -->
                <div class="card payTool" onclick="selectPay(0)">
                    <p class="KB_icon"></p>
                    <h4>국민카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(1)">
                    <p class="BC_icon"></p>
                    <h4>비씨카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(2)">
                    <p class="Uri_icon"></p>
                    <h4>우리카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(3)">
                    <p class="ShinHan_icon"></p>
                    <h4>신한카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(4)">
                    <p class="Samsung_icon"></p>
                    <h4>삼성카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(5)">
                    <p class="Hana_icon"></p>
                    <h4>하나카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(6)">
                    <p class="NH_icon"></p>
                    <h4>NH농협카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(7)">
                    <p class="Hyendai_icon"></p>
                    <h4>현대카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(8)">
                    <p class="KaBank_icon"></p>
                    <h4>카카오뱅크카드</h4>
                </div>
                <div class="card payTool" onclick="selectPay(9)">
                    <p class="Toss_icon"></p>
                    <h4>토스뱅크카드</h4>
                </div>

                <!-- 무통장 입금 시 활성화 -->
                <div class="bank payTool" onclick="selectPay(10)">
                    <p class="KB_icon"></p>
                    <h4>국민은행</h4>
                </div>
                <div class="bank payTool" onclick="selectPay(11)">
                    <p class="Uri_icon"></p>
                    <h4>우리은행</h4>
                </div>
                <div class="bank payTool" onclick="selectPay(12)">
                    <p class="ShinHan_icon"></p>
                    <h4>신한은행</h4>
                </div>
                <div class="bank payTool" onclick="selectPay(13)">
                    <p class="Hana_icon"></p>
                    <h4>하나은행</h4>
                </div>
                <div class="bank payTool" onclick="selectPay(14)">
                    <p class="KaBank_icon"></p>
                    <h4>카카오뱅크</h4>
                </div>
                <div class="bank payTool" onclick="selectPay(15)">
                    <p class="Toss_icon"></p>
                    <h4>토스뱅크</h4>
                </div>
            </div>
        </div>

        <table id="orderTotal">
            <tr class="tr_element item_pay">
                <td>총 상품금액 : </td>
                <td><%= totalPrice %> 원</td>
            </tr>
            <tr class="tr_element">
                <td>배송비 : </td>
                <td>무료</td>
            </tr>
            <tr class="tr_element total_pay">
                <td>총 결제금액 : </td>
                <td><%= totalPrice %> 원</td>		<!-- 추가적인 금액은 아직 구현이 안되어 있기 때문에 상품 금액 그대로 -->
            </tr>
        </table>  

        <p id="orderBtn" onclick="toSent('<%=user_id%>', '<%=sake_list_no%>', '<%=sake_EA%>')">결제하기</p>

        <div id="downPage">
        </div>
        
        <form>
        	<input type="hidden" id="id" name="id">
        	<input type="hidden" id="no" name="no">
        	<input type="hidden" id="ea" name="ea">
        </form>
    </div>
    <script type="text/javascript" src="./../../js/alchol/alchol_order.js"></script>
</body>
</html>


