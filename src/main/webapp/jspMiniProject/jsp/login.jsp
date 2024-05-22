<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/login.css">
<link rel="icon" type="image/x-icon"
	href="../img/sake-best-logo-zip-file/png/logo-icon.png">
<title>로그인</title>
</head>

<body>
	<div id="wrapper">
		<header>
			<h1 class="headerLogo">
				<a href="../index.jsp"><img class="logoImg"
					src="../img/sake-best-logo-zip-file/png/logo-no-background.png"
					alt="사케 베스트"></a>
			</h1>
		</header>

		<main>
			<form action="./login_pro.jsp" method="get">
				<div class="loginForm">
					<div class="textField_email">
						<label for="login_email_input">
							<div class="imgBox">
								<img class="Img" src="../img/email_icon.png" alt="email_icon">
							</div>

							<div class="textFieldBox">
								<input type="email" name="user_id" class="emailField"
									id="login_email_input" placeholder="아이디(이메일) 입력">
							</div>
						</label>
					</div>

					<div class="textField_password">
						<label for="login_password_input">
							<div class="imgBox">
								<img class="Img" src="../img/password_icon.png"
									alt="password_icon">
							</div>

							<div class="textFieldBox">
								<input type="password" name="user_pwd" class="passwordField"
									id="login_password_input" placeholder="비밀번호 입력">
							</div>
						</label>
					</div>

					<div class="gotoReg">
						<a href="./login_id_recovery.jsp">아이디 찾기</a> <a href="./login_pwd_recovery.jsp">비밀번호 찾기</a> <a
							href="./register.jsp">회원가입</a>
					</div>

					<div class="loginSubmit">
						<input type="submit" value="로그인">
					</div>
			</form>

			<hr width="355px">

			<div class="simpleLog">
				<h4>간편 로그인</h4>
				<a href="#"><img src="../img/kakao_icon.png" alt="카카오"></a> <a
					href="#"><img src="../img/gogle_icon.png" alt="구글"></a> <a
					href="#"><img src="../img/line_icon.png" alt="라인"></a>
			</div>
	</div>

	</main>

	</div>

</body>
</html>