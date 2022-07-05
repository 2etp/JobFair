
//let scriptEl = document.querySelector('script[src^="js/header.js?"]');
let godabiValue = window.sessionStorage.getItem("godabi");
let inputEl = document.querySelector(".header-godaebi input");
let htmlEl = document.querySelector("html");
let pEl = document.querySelector(".p-godaebi");

//고대비 기본값
/*
if(scriptEl.src.split("?")[1].split("=")[1] == "null"){
	inputEl.checked = false;
}else{
	inputEl.checked = true;
}
*/

if(godabiValue == null || godabiValue == "null"){
	inputEl.checked = false;
	htmlEl.classList.remove("godabiON");
	pEl.innerHTML = "꺼짐"
	
}
else{
	inputEl.checked = true;
	pEl.innerHTML = "켜짐"
	htmlEl.classList.add("godabiON");
}

inputEl.addEventListener("change", function(){
		
	
		
	//고대비 활성화
	if(inputEl.checked == true)
	{
		window.sessionStorage.setItem("godabi","1");
		pEl.innerHTML = "켜짐"
		htmlEl.classList.add("godabiON");

	}
	//고대비 비활성화
	else
	{
		window.sessionStorage.setItem("godabi","null");
		htmlEl.classList.remove("godabiON");
		pEl.innerHTML = "꺼짐"
	}
})