	let uid;
	let upwd;
	let uname;
	let ubirth;
	let uphone;
	let uaddr;
	
function goback(){
	window.location.href = "./mypage.jsp";
}

function update(){
	upwd = document.getElementById("user_pwd");
	uname = document.getElementById("user_name");
	ubirth = document.getElementById("user_birth");
	uphone = document.getElementById("user_phone");
	uaddr = document.getElementById("user_addr");
	
	location.href = "./user_update_pro.jsp?upd_info="+ upwd.value+ "/" +uname.value+ "/" + ubirth.value + "/" + uphone.value+ "/" +uaddr.value
}