<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/register.css">
    <link rel="icon" type="image/x-icon" href="../img/sake-best-logo-zip-file/png/logo-icon.png">
    <script src = "./../js/register.js"></script>
    <title>회원가입</title>
</head>
<body onkeydown="keyInit(event.keyCode)">
    <div id = "wrapper">
        <header>
            <h1 class="headerLogo">
                <a href="../index.jsp"><img class="logoImg" src="../img/sake-best-logo-zip-file/png/logo-no-background.png" alt="사케 베스트"></a>
            </h1>
        </header>

        <main>
            <form action="./register_pro.jsp" method="post">
                <div class="registerForm">

                    <h4>회원 정보를 입력해주세요</h4>

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

                    <div class="textField_password">
                        <label for="register_password_input">
                            <div class="imgBox">
                                <img class="Img" src="../img/password_icon.png" alt="password_icon">
                            </div>
                            
                            <div class="textFieldBox">
                                <input type="text" class="passwordField" name="user_pwd" id="register_password_input" placeholder="비밀번호 입력">
                            </div>
                        </label>
                    </div>

                    <div class="textField_again_password">
                        <label for="register_again_password_input">
                            <div class="imgBox">
                                <img class="Img" src="../img/password_check_icon.png" alt="password_icon">
                            </div>
                            
                            <div class="textFieldBox">
                                <input type="text" class="passwordField" id="register_again_password_input" placeholder="비밀번호 입력 확인">
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

                    <div class="textField_addr">
                        <label for="register_addr_input">
                            <div class="imgBox">
                                <img class="Img" src="../img/addr_icon.png" alt="addr_icon">
                            </div>
                            
                            <div class="textFieldBox">
                                <input type="text" class="addressField" name="user_addr" id="register_addr_input" placeholder="주소">
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
                        <input type = "button" value="가입하기" onclick="mSubmit()">
                    </div>
                </div>
        </form>
        </main>
    </div>
    
</body>
</html>