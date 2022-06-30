function signupCheck(){
	let nameEl = document.getElementById("name");
	let residentFirstEl = document.getElementById("residentNum");
	let residentSecondEl = document.getElementById("residentNum2");
	let phoneEl = document.getElementById("mobile");
	let checkboxEl = document.getElementById("checkbox");
	
	let residentFirstRegExp = new RegExp("[0-9]{2}[0-1]{1}[0-2]{1}[1-3]{1}[0-9]{1}")
	
	if(nameEl.value == ""){
		alert("성명을 입력해주세요");
		return 0;
	}
	
	if(residentFirstEl.value == ""){
		alert("주민등록번호 앞자리를 입력해주세요");
		return 0;
	}else if(residentFirstRegExp.test(residentFirstEl.value) == false){
		alert("올바른 주민등록번호 앞자리를 입력해주세요");
		return 0;
	}
	
	if(residentSecondEl.value == ""){
		alert("주민등록번호 뒷자리를 입력해주세요");
		return 0;
	}
	
	if(phoneEl.value == ""){
		alert("휴대폰 번호를 입력해주세요");
		return 0;
	}
	
	if(checkboxEl.checked == false){
		alert("개인정보 수집 및 활용에 동의를 체크해주세요");
		return 0;
	}
	
}