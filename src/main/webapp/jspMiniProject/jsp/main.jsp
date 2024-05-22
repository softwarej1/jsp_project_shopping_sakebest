<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/jspMiniProject/css/main.css">
        <script src="<%= request.getContextPath() %>/jspMiniProject/js/main.js"></script>
        
       	<%@ page import="java.util.List" %>
    	<%@ page import="sake.sakeDTO" %>
       	<%@ page import="sake.sakeDAO" %>
    	<!-- <jsp:useBean id = "sakeDTO" class = "sake.sakeDTO"/>
        <jsp:useBean id = "sakeDAO" class = "sake.sakeDAO"/> -->
       
        
    </head>
    <body >
    <div id="inMain">
        <iframe src="./jsp/main_banner.jsp" width="1280px" height="450px" frameborder = "0"></iframe>    
        <div id="containner">
            
            
            <h2>인기상품</h2>
            
            <!-- ------------------- 사케 부분 ---------------  -->
            <h3 class="name">사케(日本酒)
                <a class="sakeMore" href="./jsp/alchol/alchol_detail.jsp?start_no=sake01&end_no=sake32&category=사케(日本酒)">더보기</a>
            </h3>
            <%
            String[] sakeIds = { "sake10", "sake02", "sake23", "sake07", "sake27" };
            String[] sojuIds = {"soju08", "soju13", "soju21", "soju26", "soju28"};
            String[] fruitWineIds = {"fruitwine01", "fruitwine06", "fruitwine04", "fruitwine02", "fruitwine10"};
            String[] beerIds = {"beer01", "beer03", "beer07", "beer09", "beer14"};
            sakeDTO sakeSel = new sakeDTO();
    		String imgDB;
    		String outPrice;
            %>
            <div class = "outerDiv">
	            <%
	            	for(int idx = 0; idx < sakeIds.length; idx++){
	            %>
	            <div id="innerDiv">
	            	<%
	            	 	
	            		sakeSel = sakeDAO.sakeSelect(sakeIds[idx]);
	            		imgDB = "./"+sakeSel.getSake_img();
	            		outPrice = String.format("%,d", sakeSel.getSake_price());
	            	%>
	                <a href="jsp/alchol/alchol_detail_product.jsp?sake_no=<%= sakeIds[idx] %>">
	                    <img src="<%= imgDB %>" alt="반슈잇콘"><br>
	                    <%= sakeSel.getSake_name_kr() %><br>
	                    <h3 class="price">가격 : <%= outPrice %></h3>
	                </a>
	            </div>
	            
	             <%
	            	}
	            %>
            </div>
           
          <!-- ------------------- 소주 부분 ---------------  -->
           <h3>소주(焼酎)
                <a class="sojuMore" href="./jsp/alchol/alchol_detail.jsp?start_no=soju01&end_no=soju32&category=소주(焼酎)">더보기</a>
            </h3>
            <div class = "outerDiv">
	            <%
	            	for(int idx = 0; idx < sojuIds.length; idx++){
	            %>
	            <div id="innerDiv">
	            <%
		    		sakeSel = sakeDAO.sakeSelect(sojuIds[idx]);
	            	imgDB = "./"+sakeSel.getSake_img();
		    		outPrice = String.format("%,d", sakeSel.getSake_price());
	            %>
	                <a href="jsp/alchol/alchol_detail_product.jsp?sake_no=<%= sojuIds[idx] %>">
	                    <img src="<%= imgDB %>" alt="반슈잇콘"><br>
	                    <%= sakeSel.getSake_name_kr() %><br>
	                    <h3 class="price">가격 : <%= outPrice %></h3>
	                </a>
	            </div>
	            
	            <%
	            	}
	            %>
            </div>
            
            <!-- ------------------- 과실주 부분 ---------------  -->
            <h3>과실주(果実酒)
                <a class="fruitMore" href="./jsp/alchol/alchol_detail.jsp?start_no=fruitwine01&end_no=fruitwine10&category=과실주(果実酒)">더보기</a>
            </h3>
            <div class = "outerDiv">
            <%
            	for(int idx = 0; idx < fruitWineIds.length; idx++){
            %>
            <div id="innerDiv">
            <%
	    		sakeSel = sakeDAO.sakeSelect(fruitWineIds[idx]);
            	imgDB = "./"+sakeSel.getSake_img();
	    		outPrice = String.format("%,d", sakeSel.getSake_price());
            %>
                <a href="jsp/alchol/alchol_detail_product.jsp?sake_no=<%= fruitWineIds[idx] %>">
                    <img src="<%= imgDB %>" alt="반슈잇콘"><br>
                    <%= sakeSel.getSake_name_kr() %><br><br>
                    <h3 class="price">가격 : <%= outPrice %></h3>
                </a>
            </div>
            
            <%
            	}
            %>
            </div>

    		<!-- ------------------- 맥주 부분 ---------------  -->
            <h3>맥주(ビール)

                <a class="beerMore" href="./jsp/alchol/alchol_detail.jsp?start_no=beer01&end_no=beer18&category=맥주(ビール)">더보기</a>
            </h3>
            <div class = "outerDiv">
            
            <%
            	for(int idx = 0; idx < beerIds.length; idx++){
            %>
            <div id="innerDiv">
            <%
    			sakeSel = sakeDAO.sakeSelect(beerIds[idx]);
	            imgDB = "./"+sakeSel.getSake_img();
	    		outPrice = String.format("%,d", sakeSel.getSake_price());
            %>
                <a href="jsp/alchol/alchol_detail_product.jsp?sake_no=<%= beerIds[idx] %>">
                    <img src="<%= imgDB %>" alt="반슈잇콘"><br>
                    <%= sakeSel.getSake_name_kr() %><br>
                    <h3 class="price">가격 : <%= outPrice %></h3>
                </a>
            </div>
            
            <%
           	}
            %>
        </div>
        

        <script>
            window.addEventListener('load', function() {
                let message = {height: document.body.scrollHeight};	

                window.top.postMessage(message, "*");
            });
        </script>
        </div>
    </body>
</html>