
let scriptEl = document.querySelector('script[src^="js/header.js?"]');
//let inputEl = document.querySelector(".header-godaebi input");

//고대비 기본값
if(scriptEl.src.split("?")[1].split("=")[1] == "null"){
	inputEl.checked = false;
}else{
	inputEl.checked = true;
}


