let liEls = document.querySelectorAll(".div-form ul li");


let inputEls = document.querySelectorAll("form[name='logFrm'] input");
let labelEls = document.querySelectorAll("form[name='logFrm'] label");

liEls.forEach(function (Eliment, ElimentIndex, obj) {
	
	Eliment.addEventListener("click", function() {
		
		for(let i=0; i<obj.length; i++)
		{
			obj[i].classList.remove("enable");
		}
		
		Eliment.classList.add("enable");
	})
})


function loginCheck(Element){
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