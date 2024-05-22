// ---------------- 키보드 클릭 시 evnet ------------------------
function keyInit(keyNum){
    if(keyNum === 13){
        mSubmit();
    }
}

// ---------------- 회원 가입 버튼 ---------------------------
/*
    회원 정보 입력 시 localStorage에 email, password, name, phone 정보를 저장
*/
function mSubmit(){
    let email = document.getElementById("register_email_input"); // 이메일
    let password = document.getElementById("register_password_input"); // 패스워드
    let againPassword = document.getElementById("register_again_password_input"); // 패스워드 재입력
    let name = document.getElementById("register_name_input"); // 이름
    let birth = document.getElementById("register_birth_input"); // 생년월일
    let addr = document.getElementById("register_addr_input"); // 주소
    let phone = document.getElementById("register_phone_input"); // 폰 번호
   
   
    // 이메일 length가 0일 시
    if(email.value.length === 0){
        alert("이메일을 입력해주세요.");
        email.focus();
        return; 
    }
    
    // 패스워드의 길이가 7자리 이하일 시
    if(password.value.length <= 7){
        alert("비밀번호를 8자리 이상 다시 입력해주세요.");
        password.select();
        return; 
    }
    
    // password와 재입력된 패스워드의 value가 같지 않을 시
    if(password.value !== againPassword.value){
        alert("비밀번호와 맞지 않습니다.");
        againPassword.select();
        return; 
    }
    
    // 이름의 value 길이가 1보다 작거나 같을 시
    if(name.value.length < 1){
        alert("2글자 이상 입력해주세요.");
        name.focus();
        return; 
    }

      // 주소 6자리 이상 입력
      if (addr.value.length < 5) {
        alert("주소를 6자리 이상 입력해주세요.");
        return;
    }

    // birthPattern Ex ] 000112 형식의 패턴
    let birthPattern = /^\d{6}$/;
    if (!birthPattern.test(birth.value)) {
        alert("생년월일을 다시 입력해주세요");
        return; 
    }

    // phonePattern Ex ] 010 - 0000 - 0000
    // .test() -> 정규 표현식 메서드 -> 패턴이 일치 시 true 아닐 시 false 반환
    let phonePattern = /^\d{3}-\d{4}-\d{4}$/;
    if(!phonePattern.test(phone.value)){
        alert("전화번호를 입력해주세요.");
        phone.focus();
        return;
    }
    
    alert("회원가입이 완료되었습니다.");
	document.getElementsByTagName("form")[0].submit();
}