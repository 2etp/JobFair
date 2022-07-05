'use strict';

function companyBookmark(){
    document.bookmarkFrm.submit();
}

function applyRecru() {
	document.applyFrm.submit();
}

function godabi_bookmark(){
	let bookmarkImgEl = document.querySelector("#bookmark img");
	let godabi = window.sessionStorage.getItem("godabi");
	let window
	if(bookmarkImgEl.src == "image/bookmark_on.svg" && (godabi==null || godabi=="null"))
	{
		
	}
}

//godabi_bookmark();
