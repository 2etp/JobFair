document.getElementById("profileUpload").addEventListener("change", function(){
	let labelEl = document.querySelector("label[for='profileUpload']");
	labelEl.innerHTML = this.files[0].name;
})


function fnExcelReport(id1,id2,id3, title) {
	
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
}
function imageRegister(){
	let profileImageEl = document.querySelector(".div-profileImage");
	let fileEl = document.getElementById("profileUpload");
	
	let selectFile = fileEl.files[0];
	
	if(selectFile == null){
		alert("이미지 파일을 선택해주세요");
		return 0;
	}
	let file = URL.createObjectURL(selectFile);
	
	profileImageEl.innerHTML = `
		<img src=${file}>
	`
}
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
