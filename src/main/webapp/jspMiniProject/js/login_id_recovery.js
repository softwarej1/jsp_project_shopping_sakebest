function recovery_id(){
	let name = document.getElementById("register_name_input").value;
	let birth = document.getElementById("register_birth_input").value;
	let phone = document.getElementById("register_phone_input").value;
	location.href = "./login_id_recovery_pro.jsp?recovery="+encodeURIComponent(name+"!"+birth+"!"+phone);
}
function cancel(){
	location.href="./login.jsp";
}