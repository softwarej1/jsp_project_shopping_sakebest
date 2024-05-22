<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="sakeDTO" class="sake.sakeDTO" />
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="../../img/sake-best-logo-zip-file/png/logo-icon.png">
    <title>사케 리스트</title>
    <link rel="stylesheet" href="../../css/alchol/alchol_detail.css">
    <%@ page import="sake.sakeDTO" %>
   	<%@ page import="sake.sakeDAO" %>
    <%
	String start_no = request.getParameter("start_no");
	String end_no = request.getParameter("end_no");
	String category = request.getParameter("category");
	%>
</head>
<body>
    <div id="wrapper">
    
    	<jsp:include page= "../header.jsp" />
    	
        <form action="">
            <h1><%= category %></h1>
            
            <!--
            select_nav :: 사용자 편의를 위한 네비게이션 selector 아직 기능 구현 X
            first_sel_box -> 인기순, 추천순, 높은 가격순, 낮은 가격순 => 추천 카테고리 별로 정렬 예정
            last_sel_box -> 10, ... 30개씩
             -->
            <div class = "select_nav"> 
                <div class = "first_sel_box">
                    <select name="category" class = "first_sel_option">
                        <option value="category" selected>--</option>
                        <option value="popular">인기순</option>
                        <option value="recommend">추천순</option>
                        <option value="expensive">높은 가격순</option>
                        <option value="cheap">낮은 가격순</option>
                    </select>
                </div>

                <div class="last_sel_box">
                    <select name="item_page" class = "last_sel_option">
                        <option value="10">10개씩 보기</option>
                        <option value="15">15개씩 보기</option>
                        <option value="20" selected>20개씩 보기</option>
                        <option value="25">25개씩 보기</option>
                        <option value="30">30개씩 보기</option>
                    </select>
                </div>
            </div>

            <div class = "product_list_box">
                <div class = "product_list">
                	<%
				        sakeDTO sakeSel = new sakeDTO();
				        sakeDAO sakeDAO_gek = new sakeDAO();
				        
				        String cnt_no = new String();
				        cnt_no = start_no;				//start_no 대신 값이 바뀔 변수
				        String outPrice = "";			//price의 형태를 조정하여 출력할 변수
				        String imgDB = "";				//이미지 주소의 위치를 조정할 변수
				        
				    	String sake_kind = "";			//문자 부분을 담을 변수
				    	int sake_num = 0;				//숫자 부분을 담을 변수 
				    	
						int isolation_num = start_no.length()-2;		
				    	
				    	while(!(end_no.equals(cnt_no))){
				    		sakeSel = sakeDAO_gek.sakeSelect(cnt_no);
				    		sake_kind = cnt_no.substring(0, isolation_num);							//문자부분만 추출
				    		sake_num = Integer.parseInt(cnt_no.substring(isolation_num));		//숫자부분만 추출
				    		
				    		outPrice = String.format("%,d", sakeSel.getSake_price());			//가격 형태 조정
				    		imgDB = "./../../"+sakeSel.getSake_img();											//이미지 주소값 조정
			    	%>
			    	
			    	 <div class= "product_list_view" >
						<a href="./alchol_detail_product.jsp?sake_no=<%= cnt_no %>">
							<img class = "product_img" src="<%= imgDB %>">
							<p><%= sakeSel.getSake_name_kr() %></p>
							<h3>가격 : <%= outPrice %>원</h3>
						</a>
					</div>
					<%
			    		sake_num++;								//다음 값을 가져오기 위해 sake_num++
			    		if(sake_num<10){
			    			cnt_no = sake_kind+0+sake_num;		//만약 sake_num이 10보다 작다면 0을 추가하여 sake01 과 같은 형태로 만들어줌
			    		}else{
			    			cnt_no = sake_kind+sake_num;
			    		}
			    	}
			        %>
					
                </div>
            </div>
        </form>
    </div>
</body>
</html>

<!-- 
	<div class="pagenavi"> 
        <a class="page" >＜</a>
        <a class="page" href="beer_detail_santory.html">1</a>
        <a class="page" >＞</a>
    </div>
 -->