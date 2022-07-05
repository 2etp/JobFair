let liEls = document.querySelectorAll(".div-form ul li");


let inputEls = document.querySelectorAll("form[name='logFrm'] input");
let labelEls = document.querySelectorAll("form[name='logFrm'] label");

liEls.forEach(function (Eliment, ElimentIndex, obj) {
	
	Eliment.addEventListener("click", function() {
		
		let divNameEl = document.querySelector(".div-name");
		let divPhoneEl = document.querySelector(".div-phone");
		let divSubmitEl = document.querySelector(".div-submit");
		
		let formEl = document.querySelector("form[name='logFrm']");
		
		for(let i=0; i<obj.length; i++)
		{
			obj[i].classList.remove("enable");
		}
		
		if(Eliment.classList.contains("li-private")){
			formEl.action = "loginProc.jsp?item=dis";
			divNameEl.innerHTML = `
				<label for="name">이름</label>
				<input id="name" type="text" name="name" placeholder="성과 이름을 띄어쓰기 없이 모두 입력해 주세요." >
			`;
			
			divPhoneEl.innerHTML = `
				<label for="phone">휴대폰번호</label>
				<input id="phone" maxlength="11" type="text" name="mobile" placeholder="숫자만 입력해 주세요.">
			`;
			divSubmitEl.innerHTML = `
				<a id="loginButton" href="javascript:loginCheckDis(this);" role="button">로그인</a>
			`;
		}else{
			formEl.action = "loginProc.jsp?item=com";
			divNameEl.innerHTML = `
				<label for="id">아이디</label>
				<input id="id" type="text" name="name" placeholder="아이디를 입력해 주세요." >
			`;
			divPhoneEl.innerHTML = `
				<label for="password">패스워드</label>
				<input id="password" type="password" name="mobile" placeholder="패스워드를 입력해 주세요.">
			`;
			divSubmitEl.innerHTML = `
				<a id="loginButton" href="javascript:loginCheckCom(this);" role="button">로그인</a>
			`;
		}
		
		Eliment.classList.add("enable");
	})
})


function loginCheckDis(Element){
	let formEl = document.querySelector("form[name='logFrm']");
	let nameEl = document.getElementById("name");
	let phoneEl = document.getElementById("phone");
	
	let phoneReg = new RegExp("010[0-9]{8}");
	
	if(nameEl.value == ""){
		alert("이름을 입력해주세요.");
		return 0;
	}
	
	if(phoneEl.value == ""){
		alert("전화번호를 입력해주세요.");
		return 0;
	}else if(!(phoneReg.test(phoneEl.value))){
		alert("올바른 전화번호를 입력해주세요");
		return 0;
	}
	
	formEl.submit();
}

function loginCheckCom(Element){
	let formEl = document.querySelector("form[name='logFrm']");
	let idEl = document.getElementById("id");
	let passwordEl = document.getElementById("password");
	
	
	if(idEl.value == ""){
		alert("아이디를 입력해주세요.");
		return 0;
	}
	
	if(passwordEl.value == ""){
		alert("패스워드를 입력해주세요.");
		return 0;
	}
	
	formEl.submit();
}

/*inputEls.forEach(function (Eliment, ElimentIndex, obj) {
	
	Eliment.addEventListener("focus", function() {
		
		labelEls[ElimentIndex].style.display = "none";
	})
	
	Eliment.addEventListener("blur", function() {
		if(Eliment.value == ""){
			labelEls[ElimentIndex].style.display = "block";
		}
	})
})*/