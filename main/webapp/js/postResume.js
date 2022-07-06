document.getElementById("fileUpload").addEventListener("change", function(){
	let imgEl = document.querySelector(".selected-img img");
	
	let fileURL = URL.createObjectURL(this.files[0]);
	imgEl.src = fileURL;
	$(".file-help").css('z-index','-10');
	$(".file-help").ariaHidden = "true";
});


/*function fnExcelReport(id1,id2,id3, title) {
	
	var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
	tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
	tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
	tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
	tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
	tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
	tab_text = tab_text + "<table border='1px'>";
	var exportTable1 = $('#' + id1).clone();
	var exportTable2 = $('#' + id2).clone();
	var exportTable3 = $('#' + id3).clone();
	exportTable1.find('input').each(function (index, elem) { $(elem).remove(); });
	tab_text = tab_text + exportTable1.html();
	exportTable2.find('input').each(function (index, elem) { $(elem).remove(); });
	tab_text = tab_text + exportTable2.html();
	exportTable3.find('input').each(function (index, elem) { $(elem).remove(); });
	tab_text = tab_text + exportTable3.html();
	tab_text = tab_text + '</table></body></html>';
	var data_type = 'data:application/vnd.ms-excel';
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE "); 
	var fileName = title + '.xls';
	//Explorer 환경에서 다운로드    
	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if (window.navigator.msSaveBlob) {
			var blob = new Blob([tab_text], {
				type: "application/vnd.ms-excel;charset=utf-8;"
			});
				navigator.msSaveBlob(blob, fileName);
			}    
	} else {
		var blob2 = new Blob([tab_text], {
			type: "application/vnd.ms-excel;charset=utf-8;"
			});
		var filename = fileName;
		var elem = window.document.createElement('a');
		elem.href = window.URL.createObjectURL(blob2);
		elem.download = filename;
		document.body.appendChild(elem);
		elem.click();
		document.body.removeChild(elem);
	}
}*/

/*
function fnExcelReport(id1,id2,id3, title) {
	let workbook = XLSX.utils.book_new();
	let worksheet = XLSX.utils.table_to_sheet(document.getElementById(id1));
	XLSX.utils.sheet_add_dom(worksheet,document.getElementById(id2),{origin:-1});
	XLSX.utils.sheet_add_dom(worksheet,document.getElementById(id3),{origin:-1});
	XLSX.utils.book_append_sheet(workbook,worksheet,"a");
	

	
	//let workbook = XLSX.utils.table_to_book(document.getElementById(id1));
	XLSX.writeFileXLSX(workbook, "a.xlsx");
}
*/

// 이력서 저장
function saveResume() {
	let militaryEl = document.querySelectorAll("input[name='militaryService']");
	let educationEl = document.querySelectorAll("input[name='education']");
	let schoolNameEl = document.querySelector("textarea[name='schoolName']");
	let majorEl = document.querySelector("textarea[name='major']");
	
	let militaryCount = 0;
	let educationCount = 0;
	
	for(i=0; i<militaryEl.length; i++){
		if(militaryEl[i].checked == false)
		{
			militaryCount++;
		}
	}
	
	for(i=0; i<educationEl.length; i++){
		if(educationEl[i].checked == false)
		{
			educationCount++;
		}
	}
	
	if(militaryEl.length == militaryCount){
		alert("병역 여부를 체크해주세요");
		return 0;
	}
	
	if(schoolNameEl.value == ""){
		alert("학교 이름을 입력해주세요");
		return 0;
	}
	
	if(majorEl.value == ""){
		alert("학과명을 입력해주세요");
		return 0;
	}
	
	
	if(educationEl.length == educationCount){
		alert("최종학력의 학교 졸업 유무를 체크해주세요");
		return 0;
	}
	
	
	document.resumeFrm.submit();
    
}