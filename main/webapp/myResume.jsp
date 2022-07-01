<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 관리</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/myResume.css">
<script defer src="js/myResume.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<details class="details-resume-list">
			<summary>
				<div>이력서 목록</div>
				<img src="image/downArrow.png">
			</summary>
			<div class="details-resume-list-item">이력서 1</div>
			<div class="details-resume-list-item">이력서 2</div>
			<div class="details-resume-list-item">이력서 3</div>
			<div class="details-resume-list-item">이력서 4</div>
			<div class="details-resume-list-item">이력서 5</div>
		</details>
		<div class="div-caption">
			<img src="./image/resume.png" alt="이력서 이미지">
			<p>이력서</p>
		</div>
			<div class="div-table">
			<table class="table1" id="table">
				<tr class="tr1">
					<td rowspan="4">
					</td>
					<th>성명</th>
					<td></td>
					<th>성별</th>
					<td></td>
				</tr>
				
				<tr class="tr2">
					<th>연락처</th>
					<td></td>
					<th>생년월일</th>
					<td></td>
				</tr>
				
				<tr class="tr3">
					<th>주소</th>
					<td colspan="3"></td>		
				</tr>
				
				<tr class="tr4">
					<th>병역</th>
					<td colspan="3">

					</td>
				</tr>
				
				<tr class="tr5">
					<th>장애유형</th>
					<td></td>
					<th>보장구 유/무</th>
					<td colspan="2">

					</td>
				</tr>
				
				<tr class="tr6">
					<th>장애등급</th>
					<td></td>
					<th>보장구 종류</th>
					<td colspan="2">

					</td>
				</tr>
				
				<tr class="tr7">
					<th rowspan="2">최종학력</th>
					<td>학교</td>
					<td rowspan="2" colspan="3">

					</td>
				</tr>
				
				<tr class="tr8">
					<td>학과</td>
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
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"></td>
				</tr>
							
				<tr class="tr12">
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"></td>
				</tr>
				
				<tr class="tr13">
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"></td>
				</tr>
			</table>
				
			<table class="table3" id="mytable3">
				<tr class="tr15">
					<th rowspan="4" style="border-bottom-left-radius: 19px;">자격면허</th>
					<th>자격종목</th>
					<th>급수</th>
					<th>등록번호</th>
					<th>발행처</th>
					<th>발급일자</th>
				</tr>
				
				<tr class="tr16">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
				<tr class="tr17">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
				<tr class="tr18">
					<td></td>
					<td></td>					
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			</div>
			
		<aside class="sideBar">
			<fieldset>
				<legend>사이드 메뉴</legend>
					<a href="myPage.jsp" role="button">내 정보 관리</a>
					<a href="myResume.jsp" role="button">이력서 관리</a>
					<a href="pickedList.jsp" role="button">관심기업 관리</a>
					<a href="applyList.jsp" role="button">기업지원 현황</a>
			</fieldset>
		</aside>
	</section>	
</main>
<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>