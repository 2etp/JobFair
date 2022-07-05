'use strict';

function companyBookmark(){
    document.bookmarkFrm.submit();
}

function applyRecru() {
	document.applyFrm.submit();
}

let htmlEl = document.querySelector("html");


let boormarkImgEl = document.querySelector("#bookmark img");

if(window.sessionStorage.getItem("godabi") == null || window.sessionStorage.getItem("godabi") == "null"){
	boormarkImgEl.src = "image/bookmark_off.svg";
	
}
else{
	boormarkImgEl.src = "image/bookmark_on.svg";
}