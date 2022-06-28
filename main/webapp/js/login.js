let liEls = document.querySelectorAll(".div-form ul li");
let registerEl = document.querySelector(".div-register");


let inputEls = document.querySelectorAll("form[name='logFrm'] input");
let labelEls = document.querySelectorAll("form[name='logFrm'] label");

liEls.forEach(function (Eliment, ElimentIndex, obj) {
	
	Eliment.addEventListener("click", function() {
		
		for(let i=0; i<obj.length; i++)
		{
			obj[i].classList.remove("enable");
		}
		
		if(Eliment.classList.contains("li-private"))
		{
			registerEl.innerHTML = `
				<a href="javascript:void(0)">지금 바로 개인 회원 가입하기</a>
			`
		}
		else{
			registerEl.innerHTML = `
				<a href="javascript:void(0)">지금 바로 기업 회원 가입하기</a>
			`
		}
		Eliment.classList.add("enable");
	})
})


inputEls.forEach(function (Eliment, ElimentIndex, obj) {
	
	Eliment.addEventListener("focus", function() {
		
		labelEls[ElimentIndex].style.display = "none";
	})
	
	Eliment.addEventListener("blur", function() {
		if(Eliment.value == ""){
			labelEls[ElimentIndex].style.display = "block";
		}
	})
})