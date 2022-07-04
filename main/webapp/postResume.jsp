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
<script lang="javascript" src="./js/xlsx.full.min.js"></script>
<script defer src="js/postResume.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<div id="container">
	<section style="margin-top: 10px;">
		
		<form name="resumeFrm" method="post" action="postResumeProc.jsp">
		<div class="div-caption">
			<img src="./image/resume.png" alt="이력서 이미지">
			<p>이력서 작성</p>
		</div>
		<div class="div-title">
			<input type="text" id="title" name="title" title="이력서 제목" placeholder="이력서 제목을 작성해 주세요.">
		</div>
		
			<div class="div-table">
			<table class="table1" id="table">
				<tr class="tr1">
					<td rowspan="4">
						<div class="div-profileImage">				
							<input type="file" name="filename" id="fileUpload" accept="image/*">
							<div class="file-help"><span>파일을 끌어다 놓거나<br>이곳을 클릭하여<br>파일을 선택해 주세요.</span></div>
							<div class="selected-img"><img class="resume-img" aria-hidden="true"></div>
							<div class="fileLabel"><img src="./image/camera.svg"><br><span>파일선택</span></div>
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
						<label><input type="radio" name="militaryService" value="필">필</label>
						<label><input type="radio" name="militaryService" value="미필">미필</label>
						<label><input type="radio" name="militaryService" value="면제">면제</label>
						<label><input type="radio" name="militaryService" value="해당사항 없음">해당사항 없음</label>
					</td>
				</tr>
				
				<tr class="tr5">
					<th>장애유형</th>
					<td><%=vo.getDisType()%></td>
					<th>보장구 유/무</th>
					<td colspan="2">
						<label><input type="radio" name="assistive" value="유">유</label>
						<label><input type="radio" name="assistive" value="무">무</label>
					</td>
				</tr>
				
				<tr class="tr6">
					<th>장애등급</th>
					<td><%=vo.getDisLevel()%></td>
					<th>보장구 종류</th>
					<td colspan="2">
						<input type="text" name="assistiveDevice">
					</td>
				</tr>
				
				<tr class="tr7">
					<th rowspan="2">최종학력</th>
					<td><input type="text" name="schoolName">학교</td>
					<td rowspan="2" colspan="3">
						<label><input type="radio" name="education" value="재학">재학</label>
						<label><input type="radio" name="education" value="휴학">휴학</label>
						<label><input type="radio" name="education" value="졸업">졸업</label>
						<label><input type="radio" name="education" value="중퇴">중퇴</label>
					</td>
				</tr>
				
				<tr class="tr8">
					<td><input type="text" name="major">학과</td>
				</tr>
				
			</table>
				
			<table class="table2" id="mytable2">
				<tr class="tr10">
					<th rowspan="4">경력<br> 및<br> 교육사항</th>
					<th>사업체명 및 교육기관</th>
					<th>기간</th>
					<th>담당업무 및 교육내용</th>
					<th colspan="2">비고</th>
				</tr>
				
				<tr class="tr11">
					<td><input type="text" name="institutionName1"></td>
					<td><input type="text" name="period1"></td>
					<td><input type="text" name="content1"></td>
					<td colspan="2"><input type="text" name="note1"></td>
				</tr>
							
				<tr class="tr12">
					<td><input type="text" name="institutionName2"></td>
					<td><input type="text" name="period2"></td>
					<td><input type="text" name="content2"></td>
					<td colspan="2"><input type="text" name="note2"></td>
				</tr>
				
				<tr class="tr13">
					<td><input type="text" name="institutionName3"></td>
					<td><input type="text" name="period3"></td>
					<td><input type="text" name="content3"></td>
					<td colspan="2"><input type="text" name="note3"></td>
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
					<td><input type="text" name="certificate1"></td>
					<td><input type="text" name="certificateNum1"></td>
					<td><input type="text" name="registration1"></td>
					<td><input type="text" name="issuer1"></td>
					<td><input type="text" name="issueDate1"></td>
				</tr>
				
				<tr class="tr17">
					<td><input type="text" name="certificate2"></td>
					<td><input type="text" name="certificateNum2"></td>
					<td><input type="text" name="registration2"></td>
					<td><input type="text" name="issuer2"></td>
					<td><input type="text" name="issueDate2"></td>
				</tr>
				
				<tr class="tr18">
					<td><input type="text" name="certificate3"></td>
					<td><input type="text" name="certificateNum3"></td>					
					<td><input type="text" name="registration3"></td>
					<td><input type="text" name="issuer3"></td>
					<td><input type="text" name="issueDate3"></td>
				</tr>
			</table>
			</div>
			
			<div class="div-sideNav">
				<aside id="sideNav" role="navigation">
					<div id="sideNav-container">
						<h3>마이페이지 메뉴</h3>
						<section>
							<ul>
								<li><a href="postResume.jsp" role="button">
									<img src="./image/resume.png" aria-hidden="true">
									이력서 작성</a></li>
								<li><a href="myPageForDisability.jsp" role="button">
									<img src="./image/myPage.svg"  aria-hidden="true">
									내 정보 관리</a></li>
								<li><a href="myResume.jsp" role="button">
									<img src="./image/myResume.png" aria-hidden="true">
									이력서 관리</a></li>
								<li><a href="pickedList.jsp" role="button">
									<img src="image/bookmark_on.svg" aria-hidden="true">
									관심 채용공고</a></li>
								<li><a href="applyList.jsp" role="button">
									<img src="image/applyList.png" aria-hidden="true">
									기업지원 현황</a></li>				
							</ul>
						</section>
						
						<hr style="margin:10px;">
						
						<section class="side-button">
							<div><a href="#" id="xlsDL" role="button" onclick="fnExcelReport('table','mytable2','mytable3','title');">
								<span>다운로드</span><img src="image/excel_icon3.svg"></a></div>
							<a href="javascript:saveResume()" id="saveRes" role="button">이력서 저장</a>
						</section>
					</div>
				</aside>
			</div> 
						
			<input type="hidden" name="userNum" value=<%vo.getUserNum();%>>
		</form>
	</section>
	</div>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>