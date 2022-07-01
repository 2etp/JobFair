function sendID(id) {
	opener.document.signupFrm.id.value = id;
	self.close();
}

function IDcheck(){
	let formEl = document.querySelector("form");
	let idEl = document.querySelector("#inputid");
	if(idEl.value == ""){
		alert("아이디를 입력해주세요");
		return 0;
	}
	
	formEl.submit();
}