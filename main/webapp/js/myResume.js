document.querySelectorAll(".details-resume-list-item").forEach(function(Element){
	Element.addEventListener("click",function(){
		let summaryDivEl = document.querySelector(".details-resume-list summary div");
		summaryDivEl.innerHTML = Element.innerHTML;
	})
})

let detailEl = document.querySelector(".details-resume-list")

/*
detailEl.addEventListener("toggle", function() {
	
	let imgEl = document.querySelector(".details-resume-list summary img")
	if(detailEl.open)
	{
		imgEl.src = "image/downArrow.png";
		
	}else{
		imgEl.src = "image/rightArrow.png";
	}
})
*/