<%@page import="sake.userDTO"%>
<%@page import="sake.sakeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<%
	String vUrl = request.getContextPath();
	vUrl = vUrl + "/jspMiniProject";
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= vUrl %>/css/header.css">
    <link rel="stylesheet" href="<%= vUrl %>/css/main.css">
    <link rel="icon" type="image/x-icon" href="<%= vUrl %>/img/sake-best-logo-zip-file/png/logo-icon.png">
    <script src="<%= vUrl %>/js/index.js" type="text/javascript"></script>
    <title>사케 베스트</title>
</head>

<body onload="onInit()">
    <div id="inIndex">
        <header>
            <div class="header_inner">
                <div class="logo_box">
                    <a href="<%= vUrl %>/index.jsp" target="_self">
                        <img class="logo_img" src="<%= vUrl %>/img/sake-best-logo-zip-file/png/logo-no-background.png"
                            alt="사케 베스트"></img>
                    </a>
                </div>
                <div class="search_box">
                    <input type="text" id="search_txt" class="search_text" placeholder="검색어를 입력해주세요" onkeypress="search_enter(event, '<%=vUrl%>')">
                    <input type="button" class="search_submit" onclick="search_click('<%=vUrl%>')">
                </div>

                <div class="user_contain">
                    <a href="<%= vUrl %>/jsp/alchol/alchol_cart.jsp">
                        <img class="user_cart" src="<%= vUrl %>/img/user_cart.png" alt="장바구니"></img>
                    </a>
                    
                    <%
                    	if(session.getAttribute("user_id") == null){
                    %>
                    
                    <a href="<%= vUrl %>/jsp/login.jsp">
                    	<img class="user_sign" src="<%= vUrl %>/img/user_sign.png" alt="로그인"></img>           
                    </a>
                    
                    <%
                    	}else{
                    		userDTO dto = sakeDAO.userPage((String)session.getAttribute("user_id"));
                    		String userName = dto.getUser_name();
                    %>
                    
                    <a href="<%= vUrl %>/jsp/mypage.jsp">
                    	<div class="user_rec"><%= userName.substring(userName.length() - 2) %></div>         
                    </a>
                    
                    <% 
                    	}
                    %>
                </div>
            </div>

            <div id="nav_box">
                <ul class="nav">
                    <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=sake01&end_no=sake32&category=사케(日本酒)" target="_self">사케</a>
                        <ul>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=sake01&end_no=sake08&category=쥰마이(純米)" target="_self">쥰마이</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=sake09&end_no=sake16&category=긴죠(吟醸酒)" target="_self">긴죠</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=sake17&end_no=sake24&category=다이긴죠(大吟醸酒)" target="_self">다이긴죠</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=sake25&end_no=sake32&category=혼죠조(本醸造酒)" target="_self">혼죠조</a></li>
                        </ul>
                    </li>
                    <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=fruitwine01&end_no=fruitwine10&category=과실주(果実酒)" target="_self">과실주</a></li>
                    <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=beer01&end_no=beer18&category=맥주(ビール)" target="_self">맥주</a>
                        <ul>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=beer01&end_no=beer06&category=아사히(ASAHI)" target="_self">아사히</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=beer07&end_no=beer13&category=산토리(SUNTORY)" target="_self">산토리</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=beer14&end_no=beer18&category=기린(KIRIN)" target="_self">기린</a></li>
                        </ul>
                    </li>
                    <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=soju01&end_no=soju32&category=소주(焼酎)" target="_self">소주</a>
                        <ul>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=soju01&end_no=soju08&category=보리소주(麦焼酎)" target="_self">보리</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=soju09&end_no=soju16&category=고구마/감자소주(芋焼酎)" target="_self">고구마/감자</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=soju17&end_no=soju24&category=쌀소주(米焼酎)" target="_self">쌀</a></li>
                            <li><a href="<%= vUrl %>/jsp/alchol/alchol_detail.jsp?start_no=soju25&end_no=soju32&category=아와모리(泡盛)" target="_self">아와모리</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
    </div>
</body>

</html>