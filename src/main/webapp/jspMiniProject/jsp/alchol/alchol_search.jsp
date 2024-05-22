<%@page import="java.awt.geom.Path2D"%>
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
   	<%@ page import="java.util.List" %>
    <%
	String keyword = request.getParameter("q");
	%>
</head>
<body>
    <div id="wrapper">
    
    	<jsp:include page= "../header.jsp" />
    	
        <form action="">
            <h1 id="cate">'<%= keyword %>'의 검색결과 입니다</h1>
            
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
                		List<sakeDTO> dtoL = sakeDAO.sake_search(keyword);
				        
				        String outPrice = "";			//price의 형태를 조정하여 출력할 변수
				        String imgDB = "";				//이미지 주소의 위치를 조정할 변수
				        int i = 0;
				    	
				        if(keyword.length()==0){
				        	out.print("<h2>검색 결과가 없습니다.</h2>");
				        	
				        }else if(!(dtoL.size()==0)){
					    	for(i=0; i<dtoL.size(); i++){
					    		outPrice = String.format("%,d", dtoL.get(i).getSake_price());			//가격 형태 조정
					    		imgDB = "./../../"+dtoL.get(i).getSake_img();											//이미지 주소값 조정
				    	%>
				    	
					    	 <div class= "product_list_view" >
								<a href="./alchol_detail_product.jsp?sake_no=<%= dtoL.get(i).getSake_no() %>">
									<img class = "product_img" src="<%= imgDB %>">
									<p><%= dtoL.get(i).getSake_name_kr() %></p>
									<h3>가격 : <%= outPrice %>원</h3>
								</a>
							</div>
						<%
				    		}
				        }else{
				        	out.print("<h2>검색 결과가 없습니다.</h2>");
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