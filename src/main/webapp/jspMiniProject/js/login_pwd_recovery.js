function recovery_pwd(){
	let id = document.getElementById("register_email_input").value;
	let name=document.getElementById("register_name_input").value;
	let birth=document.getElementById("register_birth_input").value;
	let phone=document.getElementById("register_phone_input").value;
	location.href="./login_pwd_reset.jsp?user_info=" +encodeURIComponent( id +"!"+name+"!"+birth+"!"+phone);
}

function login(){
	location.href="./login.jsp";
}