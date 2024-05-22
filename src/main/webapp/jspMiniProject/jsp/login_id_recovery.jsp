<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/login_id_recovery.css">
    <link rel="icon" type="image/x-icon" href="../img/sake-best-logo-zip-file/png/logo-icon.png">
    <script type="text/javascript" src="./../js/login_id_recovery.js"></script>
    <title>아이디 찾기</title>
</head>
<body>
    <div id = "wrapper">
        <header>
            <h1 class="headerLogo">
                <a href="../index.jsp"><img class="logoImg" src="../img/sake-best-logo-zip-file/png/logo-no-background.png" alt="사케 베스트"></a>
            </h1>
        </header>
	    <form action="./register_pro.jsp" method="post">
        <div class="registerForm">

            <h4>아이디 찾기</h4>
            

            <div class="textField_name">
                <label for="register_name_input">
                    <div class="imgBox">
                        <img class="Img" src="../img/user_icon.png" alt="password_icon">
                    </div>
                    
                    <div class="textFieldBox">
                        <input type="text" class="nameField" name="user_name" id="register_name_input" placeholder="이름">
                    </div>
                </label>
            </div>

            <div class="textField_birth">
                <label for="register_birth_input">
                    <div class="imgBox">
                        <img class="Img" src="../img/birth_icon.png" alt="birth_icon">
                    </div>
                    
                    <div class="textFieldBox">
                        <input type="text" class="birthField" name="user_birth" id="register_birth_input" placeholder="생년월일">
                    </div>
                </label>
            </div>

            <div class="textField_phone">
                <label for="register_phone_input">
                    <div class="imgBox">
                        <img class="Img" src="../img/phone_icon.png" alt="phone_icon">
                    </div>
                    
                    <div class="textFieldBox">
                        <input type="text" class="phoneField" name="user_phone" id="register_phone_input" placeholder="휴대폰 번호">
                    </div>
                </label>
            </div>

            <div class="regButton">
                <input type = "button" value="확인" onclick="recovery_id()">
                <input type = "button" value="취소" onclick="cancel()">
            </div>
        </div>
</form>
</body>
</html>