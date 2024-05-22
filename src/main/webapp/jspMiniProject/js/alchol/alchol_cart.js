let chkBox;
let sake_no;
let quantity;
window.addEventListener('load', function() {
    let message = {
        height : document.body.scrollHeight
    };

    window.top.postMessage(message, "*");
});
function init(){
    chkBox = document.getElementsByClassName("check");
    sake_no = document.getElementsByClassName("sake_no");
    quantity = document.getElementsByClassName("quantity");
}

function toggleAll(source) {
    for (let i = 0; i < chkBox.length; i++) {
        chkBox[i].checked = source.checked;
    }
}

function selectDel() {
	alert("선택한 상품이 삭제되었습니다.")
    let cartValue = "";
    for(let i=0; i<chkBox.length; i++){
        if(chkBox[i].checked){
            if (i == (chkBox.length -1)) {
                cartValue += quantity[i].value + "-" + sake_no[i].value;
            }else{
                cartValue += quantity[i].value + "-" + sake_no[i].value +",";
            }
        }
    }
    window.location.href = "./alchol_cart_pro.jsp?cartValue=" + cartValue;
}

function mGoMenu(){
	window.location.href = "../../index.jsp";
}

function mOrder(){
	document.forms[0].action="./alchol_order.jsp";
}

