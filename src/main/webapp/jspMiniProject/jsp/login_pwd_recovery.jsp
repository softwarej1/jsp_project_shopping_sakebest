<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/login_pwd_recovery.css">
    <script type="text/javascript" src="./../js/login_pwd_recovery.js"></script>
    <title>비밀번호 찾기</title>
</head>
<body>
    <div id = "wrapper">
        <header>
            <h1 class="headerLogo">
                <a href="../index.jsp"><img class="logoImg" src="../img/sake-best-logo-zip-file/png/logo-no-background.png" alt="사케 베스트"></a>
            </h1>
        </header>

        <main>
            <form action="./register_pro.jsp" method="post">
                <div class="registerForm">

                    <h4>비밀번호 찾기</h4>

                    <div class="textField_email">
                        <label for="register_email_input">
                            <div class="imgBox">
                                <img class="Img" src="../img/email_icon.png" alt="email_icon">
                            </div>

                            <div class="textFieldBox">
                                <input type="text" class="emailField" name = "user_id" id="register_email_input" placeholder="아이디(이메일) 입력">
                            </div>
                        </label>
                    </div> 

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
                        <input type = "button" value="확인" onclick="recovery_pwd()">
                        <input type = "button" value="취소" onclick="login()">
                    </div>
                </div>
        </form>
        </main>
    </div>
    
</body>
</html>