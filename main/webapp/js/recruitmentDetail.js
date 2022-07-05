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
	
	if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark_on.svg"){
		if(godabi==null || godabi=="null")
		{
			bookmarkImgEl.src = "image/bookmark_on.svg";
		}
		else{
			bookmarkImgEl.src = "image/bookmark1_on.svg";
		}		
	}else if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark_off.svg"){
		if(godabi==null || godabi=="null")
		{
			bookmarkImgEl.src = "image/bookmark_off.svg";
		}
		else{
			bookmarkImgEl.src = "image/bookmark1_off.svg";
		}
	}
}
function inputEventListener(){
	let inputEl = document.querySelector(".header-godaebi .switch input");
	inputEl.addEventListener("change", function(){
		let bookmarkImgEl = document.querySelector("#bookmark img");
		let godabi = window.sessionStorage.getItem("godabi");
		
		if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark_on.svg"){
			if(godabi==null || godabi=="null")
			{
				bookmarkImgEl.src = "image/bookmark_on.svg";
			}
			else{
				bookmarkImgEl.src = "image/bookmark1_on.svg";
			}		
		}else if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark_off.svg"){
			if(godabi==null || godabi=="null")
			{
				bookmarkImgEl.src = "image/bookmark_off.svg";
			}
			else{
				bookmarkImgEl.src = "image/bookmark1_off.svg";
			}
		}
		else if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark1_on.svg"){
			if(godabi==null || godabi=="null")
			{
				bookmarkImgEl.src = "image/bookmark_on.svg";
			}
			else{
				bookmarkImgEl.src = "image/bookmark1_on_w.svg";
			}
		}
		else if(bookmarkImgEl.src.split("/").slice(-1)[0] == "bookmark1_off.svg"){
			if(godabi==null || godabi=="null")
			{
				bookmarkImgEl.src = "image/bookmark_off.svg";
			}
			else{
				bookmarkImgEl.src = "image/bookmark1_off.svg";
			}
		}
	})
}	

godabi_bookmark();
inputEventListener();

