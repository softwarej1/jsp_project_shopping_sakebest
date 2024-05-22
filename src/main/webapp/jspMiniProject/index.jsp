<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/sake-best-logo-zip-file/png/logo-icon.png">
    <link rel="stylesheet" href="./css/index.css">
    <script src="./js/index.js" type="text/javascript"></script>
    <title>사케 베스트</title>
</head>

<body onload="onInit()">
    <div id="inIndex">
        
		<%@ include file="jsp/header.jsp" %>
		
        <main>
            <div id="myIframe">
            	<jsp:include page="./jsp/main.jsp"/> 
            </div>
        </main>
        
        <footer>
            Copyright © 2024 All Rights Reserved
        </footer>
    </div>
</body>

</html>
