function mInit(){
	let item_pay = document.getElementsByClassName("item_pay");
	let total_pay = document.getElementsByClassName("total_pay");
}

function toSent(id, no, ea){
	alert("상품 구매가 완료되었습니다. 감사합니다.");
	document.getElementById("id").value = id;
	document.getElementById("no").value = no;
	document.getElementById("ea").value = ea;
	
	document.getElementsByTagName("form")[0].action = "./alchol_order_pro.jsp";
	document.getElementsByTagName("form")[0].submit();
}

function selectPay(num){
	let card = document.getElementsByClassName("card");
	let bank = document.getElementsByClassName("bank");
	let payTool = document.getElementsByClassName("payTool");
	
	for(let i=0; i<(card.length+bank.length); i++){
		payTool[i].style.backgroundColor = "white";
	}
	
	payTool[num].style.backgroundColor = "rgb(235, 235, 235)";
}

function card_bank(num){
    let card = document.getElementsByClassName("card");
    let bank = document.getElementsByClassName("bank");
    let selBtn1 = document.getElementsByClassName("selBtn1");
    let selBtn2 = document.getElementsByClassName("selBtn2");

    if(num==0){
        selBtn1[0].style.backgroundColor = "rgb(235, 235, 235)";
        selBtn2[0].style.backgroundColor = "white";
        
        for(let i=0; i<bank.length; i++){
            bank[i].style.display = "none";
        }
        for(let i=0; i<card.length; i++){
            card[i].style.display = "block";
        }

    }else{
        selBtn1[0].style.backgroundColor = "white";
        selBtn2[0].style.backgroundColor = "rgb(235, 235, 235)";

        for(let i=0; i<card.length; i++){
            card[i].style.display = "none";
        }
        for(let i=0; i<bank.length; i++){
            bank[i].style.display = "block";
        }
    }
}

function self_write_func(){
    let self_write = document.getElementById("self_write");
    let yochurng = document.getElementById("yochurng");

    if(yochurng.value == "직접입력"){
        self_write.style.display = "block";
        yochurng.style.marginTop = "0px";
        document.getElementById("sizeControl").style.height = "180px";
    }else{
        self_write.style.display = "none";
        yochurng.style.marginTop = "-15px";
        document.getElementById("sizeControl").style.height = "50px";
    }
}