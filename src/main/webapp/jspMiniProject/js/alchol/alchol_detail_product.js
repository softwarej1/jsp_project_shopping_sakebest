// ---------------- 상품 페이지 기본 설정 -----------------------
/*
    detail 페이지에서 받은 데이터 -> localName, localIdx를 localStorage에서 가져와
    "가격, 알콜 도수, 주조 지역, 주조사, 상세 설명, 이미지 출력
*/
function onInit(){
    // detail ... page data -> localName, localIdx Ex] 사케, 1
    let localName = localStorage.getItem("name");
    let localIdx = localStorage.getItem("idx");
	let sake_no, quantity;
	
    subTitle = document.getElementById("subTitle"); // 타이틀 Ex] 사케 >

    
    let heartName = localStorage.getItem("heartName");
    let heartIdx = localStorage.getItem("heartIdx");
    let heartImg = document.getElementById("heartImg");

    let heartNameArr = heartName.split(",");
    let heartIdxArr = heartIdx.split(",");
    for(let idx = 0; idx < heartIdxArr.length; idx++){
        if(localIdx === heartIdxArr[idx] && localName === heartNameArr[idx]){
            heartImg.src ="./../img/on_heart.png";
            break;
        }
    }
    
}

// ----------------- 술 상품 찜 버튼 ------------------------
let heartClick = true;
function choiceHeart(){
    // heartClick -> ture일 시
    if(heartClick){
        heartImg.src ="./../../img/on_heart.png";
        heartClick = false;
    }else{
        heartImg.src = "./../../img/off_heart.png";
        heartClick = true;
    }

    
    //------ 찜 버튼을 클릭 시 localStorage에 데이터 저장 한번 더 클릭 시 저장된 데이터 삭제
    let heartName = localStorage.getItem("heartName");
    let heartIdx = localStorage.getItem("heartIdx");
    let localName = localStorage.getItem("name");
    let localIdx = localStorage.getItem("idx");
    
    if(heartName === null){
        heartName = "";
    }

    if(heartIdx === null){
        heartIdx = "";
    }

    let localIdxArr = localIdx.split(",");
    let localNameArr = localName.split(",");
    let vheartNameArr = heartName.split(",");
    let vheartIdxArr = heartIdx.split(",");

    // 클릭 시 localIdx, localName 배열 -> heart에 idx와 name의 배열값과 일치할 시 데이터 제거
    for(let idx = 0; idx < vheartIdxArr.length; idx++){    
        if(localIdxArr[0] === vheartIdxArr[idx] && localNameArr[0] === vheartNameArr[idx]){
            alert("찜 목록에서 제거되었습니다.");
            let vheartNameSlice = vheartNameArr.slice(idx + 1);
            let vheartIdxSlice = vheartIdxArr.slice(idx + 1);

            let vheartNameStr = vheartNameSlice.join(",");
            let vheartIdxStr = vheartIdxSlice.join(",");

            localStorage.setItem("heartName", vheartNameStr);
            localStorage.setItem("heartIdx", vheartIdxStr);

            return;
        }
    }

    // 일치하지 않을 시 데이터 유지
    alert("찜 목록에 추가되었습니다.");
    vheartNameArr.push(localName);
    vheartIdxArr.push(localIdx);

    let vheartNameStr = vheartNameArr.join(",");
    let vheartIdxStr = vheartIdxArr.join(",");

    localStorage.setItem("heartName", vheartNameStr);
    localStorage.setItem("heartIdx", vheartIdxStr);
    
}

//장바구니DB입력
function putCart(){
	let sake_no = document.getElementById("sNo"); 
	let quantity = document.getElementById("quantity");
	window.location.href = "alchol_detail_product_pro.jsp?quantity=" + quantity.value + "-" +   sake_no.value + ",";
}

// 구매페이지 
function buy(id){
	if(id === "null"){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "./../login.jsp";
	}else{
		let sake_no = document.getElementById("sNo");
		let quantity = document.getElementById("quantity");
		window.location.href = "./alchol_order.jsp?sake_list_no="+sake_no.value+"-&sake_EA="+quantity.value+"-";
	}

}
