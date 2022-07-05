<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="jobFairMgr.DisabilityVO" />
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />

<%
	String name = (String)session.getAttribute("lgnName");
	vo = dao.getUser(name);
	String year;
	String month;
	String day;
	year = vo.getPrefixNum().substring(0, 4);
	month = vo.getPrefixNum().substring(4, 6);
	day = vo.getPrefixNum().substring(6);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 등록</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/postResume.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script lang="javascript" src="./js/xlsx.full.min.js"></script>
<script defer src="js/postResume.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<div id="container">
	<section style="margin-top: 10px;">
		
		<form name="resumeFrm" method="post" enctype="multipart/form-data" action="SaveResumeServlet">
		<div class="div-caption">
			<h1><img src="./image/resume.png" aria-hidden="true">이력서 작성</h1>
		</div>
		<div class="div-title">
			<input type="text" id="title" name="title" title="이력서 제목" placeholder="이력서 제목을 작성해 주세요." maxlength="255">
		</div>
		
			<div class="div-table">
			<table class="table1" id="table">
				<tr class="tr1">
					<td rowspan="4">
						<div class="div-profileImage">				
							<div class="file-help">
								<span>파일을 끌어다 놓거나 
								이곳을 클릭하여 
								파일을 선택해 주세요.</span>
							</div>
							<input type="file" name="filename" id="fileUpload" title="이력서 사진" accept="image/*">
							<div class="selected-img"><img class="resume-img" aria-hidden="true"></div>
							<div class="fileLabel" aria-hidden="true"><img src="./image/camera.svg"><br><span>파일선택</span></div>
						</div>
					<th>성명</th>
					<td><%=vo.getName()%></td>
					<th>성별</th>
					<td><%=vo.getSex()%></td>
				</tr>
				
				<tr class="tr2">
					<th>연락처</th>
					<td><%=vo.getPhoneNum()%></td>
					<th>생년월일</th>
					<td><%=year%>.<%=month%>.<%=day%></td>
				</tr>
				
				<tr class="tr3">
					<th>주소</th>
					<td colspan="3"><%=vo.getLivingArea()%></td>		
				</tr>
				
				<tr class="tr4">
					<th>병역</th>
					<td colspan="3">
						<ul role="group" aria-labelledby="militaryService">
							<li><label><input type="radio" name="militaryService" value="필" required>필</label></li>
							<li><label><input type="radio" name="militaryService" value="미필">미필</label></li>
							<li><label><input type="radio" name="militaryService" value="면제">면제</label></li>
							<li><label><input type="radio" name="militaryService" value="해당사항 없음">해당사항 없음</label></li>
						</ul>
					</td>
				</tr>
				
				<tr class="tr5">
					<th>장애유형</th>
					<td><%=vo.getDisType()%></td>
					<th>보장구 유무</th>
					<td colspan="2">
						<ul role="group" aria-labelledby="assistive">
							<li><label><input type="radio" name="assistive" value="유">유</label></li>
							<li><label><input type="radio" name="assistive" value="무">무</label></li>
						</ul>
					</td>
				</tr>
				
				<tr class="tr6">
					<th>장애등급</th>
					<td><%=vo.getDisLevel()%></td>
					<th>보장구 종류</th>
					<td colspan="2">
						<textarea name="assistiveDevice" title="보장구 종류" maxlength="30"></textarea>
					</td>
				</tr>
				
				<tr class="tr7">
					<th rowspan="2">최종학력</th>
					<td colspan="2"><span>학교:</span><textarea name="schoolName" title="학교명" maxlength="20" onkeypress="noEnter()"></textarea></td>
					<td colspan="2"><span>학과:</span><textarea name="major" title="학과명" maxlength="30" onkeypress="noEnter()"></textarea></td>
				</tr>
				
				<tr class="tr8">
					<td rowspan="2" colspan="4">
						<ul role="group" aria-labelledby="assistive">
							<li><label><input type="radio" name="education" value="재학">재학</label></li>
							<li><label><input type="radio" name="education" value="휴학">휴학</label></li>
							<li><label><input type="radio" name="education" value="졸업예정">졸업예정</label></li>
							<li><label><input type="radio" name="education" value="졸업">졸업</label></li>
							<li><label><input type="radio" name="education" value="중퇴">중퇴</label></li>
						</ul>
					</td>
				</tr>
				
			</table>
				
			<table class="table2" id="mytable2">
				<tr class="tr10">
					<th rowspan="4">경력 
					및 
					교육사항</th>
					<th>사업체명 
					및 
					교육기관</th>
					<th>기간</th>
					<th>담당업무 
					및 
					교육내용</th>
					<th colspan="2">비고</th>
				</tr>
				
				<tr class="tr11">
					<td><textarea name="institutionName1" title="사업체명 및 교육기관" maxlength="255"></textarea></td>
					<td><textarea name="period1" title="기간" maxlength="255"></textarea></td>
					<td><textarea name="content1" title="담당업무 및 교육내용" maxlength="255"></textarea></td>
					<td colspan="2"><textarea name="note1" title="비고" maxlength="255"></textarea></td>
				</tr>
							
				<tr class="tr12">
					<td><textarea name="institutionName2" title="사업체명 및 교육기관" maxlength="255"></textarea></td>
					<td><textarea name="period2" title="기간" maxlength="255"></textarea></td>
					<td><textarea name="content2" title="담당업무 및 교육내용" maxlength="255"></textarea></td>
					<td colspan="2"><textarea name="note2" title="비고" maxlength="255"></textarea></td>
				</tr>
				
				<tr class="tr13">
					<td><textarea name="institutionName3" title="사업체명 및 교육기관" maxlength="255"></textarea></td>
					<td><textarea name="period3" title="기간" maxlength="255"></textarea></td>
					<td><textarea name="content3" title="담당업무 및 교육내용" maxlength="255"></textarea></td>
					<td colspan="2"><textarea name="note3" title="비고" maxlength="255"></textarea></td>
				</tr>
			</table>
				
			<table class="table3" id="mytable3">
				<tr class="tr15">
					<th rowspan="4">자격면허</th>
					<th>자격종목</th>
					<th>급수</th>
					<th>등록번호</th>
					<th>발행처</th>
					<th>발급일자</th>
				</tr>
				
				<tr class="tr16">
					<td><textarea name="certificate1" title="자격종목" maxlength="255"></textarea></td>
					<td><textarea name="certificateNum1" title="급수" maxlength="255"></textarea></td>
					<td><textarea name="registration1" title="등록번호" maxlength="255"></textarea></td>
					<td><textarea name="issuer1" title="발행처" maxlength="255"></textarea></td>
					<td><textarea name="issueDate1" title="발급일자" maxlength="255"></textarea></td>
				</tr>
				
				<tr class="tr17">
					<td><textarea name="certificate2" title="자격종목" maxlength="255"></textarea></td>
					<td><textarea name="certificateNum2" title="급수" maxlength="255"></textarea></td>
					<td><textarea name="registration2" title="등록번호" maxlength="255"></textarea></td>
					<td><textarea name="issuer2" title="발행처" maxlength="255"></textarea></td>
					<td><textarea name="issueDate2" title="발급일자" maxlength="255"></textarea></td>
				</tr>
				
				<tr class="tr18">
					<td><textarea name="certificate3" title="자격종목" maxlength="255"></textarea></td>
					<td><textarea name="certificateNum3" title="급수" maxlength="255"></textarea></td>					
					<td><textarea name="registration3" title="등록번호" maxlength="255"></textarea></td>
					<td><textarea name="issuer3" title="발행처" maxlength="255"></textarea></td>
					<td><textarea name="issueDate3" title="발급일자" maxlength="255"></textarea></td>
				</tr>
			</table>
			</div>
			<input type="hidden" name="userNum" value="<%=vo.getUserNum()%>">
			</form>
			
			<div class="div-sideNav">
				<aside id="sideNav" role="navigation">
					<div id="sideNav-container">
						<h3>마이페이지 메뉴</h3>
						<section id="">
							<ul>
								<li><a href="postResume.jsp">
									<img src="./image/resume.png" aria-hidden="true">
									이력서 작성</a></li>
								<li><a href="myPageForDisability.jsp" >
									<img src="./image/myPage.svg"  aria-hidden="true">
									내 정보 관리</a></li>
								<li><a href="myResume.jsp" >
									<img src="./image/myResume.png" aria-hidden="true">
									이력서 관리</a></li>
								<li><a href="pickedList.jsp" >
									<img src="image/bookmark_on.svg" aria-hidden="true">
									관심 채용공고</a></li>
								<li><a href="applyList.jsp" >
									<img src="image/applyList.png" aria-hidden="true">
									기업지원 현황</a></li>				
							</ul>
						</section>
						
						<hr style="margin:10px;">
						
						<section class="side-button">
							<a href="javascript:saveResume()" id="saveRes" role="button">이력서 저장</a>
							<div><a href="#" id="xlsDL" role="button" onclick="fnExcelReport('table','mytable2','mytable3','title');">
								<span>다운로드</span><img src="image/excel_icon3.svg"></a></div>
						</section>
					</div>
				</aside>
			</div> 
	</section>
	</div>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
<script>
	autosize($('td textarea'));
	function noEnter()
	{
	   if(event.keyCode == 13)
	      event.returnValue=false;
	}
	function postEmp(){
		document.empPostFrm.submit();
	}
</script>
</html>