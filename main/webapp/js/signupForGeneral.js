document.getElementById("fileUpload").addEventListener("change", function(){
	let imgEl = document.querySelector(".profile img");
	
	let fileURL = URL.createObjectURL(this.files[0]);
	imgEl.src = fileURL;
});

function signupCheck(){
	let FormEl = document.querySelector("form[name='signupFrm']");
	
	let idEl = document.getElementById("id");
	let passwordEl = document.getElementById("password");
	let passwordCheckEl = document.getElementById("passwordCheck");
	
	let companyNameEl = document.getElementById("companyName");
	let addressEl = document.getElementById("address");
	let nameEl = document.getElementById("name");
	let homepageEl = document.getElementById("homepage");
	let phoneEl = document.getElementById("mobile");
	let checkboxEl = document.getElementById("checkbox");
	
	let residentFirstRegExp = new RegExp("[0-9]{2}[0-1]{1}[0-2]{1}[1-3]{1}[0-9]{1}");
	let residentSecondRegExp = new RegExp("[1-4]{1}[0-9]{6}");
	let phoneRegExp = new RegExp("010[0-9]{8}");
	
	
	if(idEl.value == ""){
		alert("아이디를 입력해주세요");
		return 0;
	}
	
	if(passwordEl.value == ""){
		alert("패스워드를 입력해주세요");
		return 0;
	}
	
	if(passwordCheckEl.value == ""){
		alert("패스워드 확인란을 입력해주세요");
		return 0;
	}
	
	if(companyNameEl.value == ""){
		alert("기업명을 입력해주세요");
		return 0;
	}
	
	if(addressEl.value == ""){
		alert("기업주소를 입력해주세요");
		return 0;
	}
	
	if(nameEl.value == ""){
		alert("대표자이름을 입력해주세요");
		return 0;
	}
	
	if(homepageEl.value == ""){
		alert("홈페이지 주소를 입력해주세요");
		return 0;
	}
	
	if(phoneEl.value == ""){
		alert("연락처를 입력해주세요");
		return 0;
	}else if(phoneRegExp.test(phoneEl.value) == false){
		alert("올바른 연락처를 입력해주세요");
		return 0;
	}
	
	if(checkboxEl.checked == false){
		alert("개인정보 수집 및 활용에 동의를 체크해주세요");
		return 0;
	}
	
	FormEl.submit();
}

function overlap() {
    window.open(
      "overlap.jsp",
      "중복 확인",
      "width=400, height=300, top=50, left=50"
    );
}
