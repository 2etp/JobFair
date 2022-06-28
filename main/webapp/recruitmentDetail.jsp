<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용공고</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/recruitmentDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<main>
<div id="container">
	<h1>에스지씨앤씨</h1>
	<section id="comInfo">
		<h2>
			<img class="icons" src="./image/building.svg" aria-hidden="true">
			<span class="secTitle">기업정보</span>
		</h2>
		<div class="logo-wrap">
			<img class="logo" src="image/에스지씨앤씨 주식회사.png" alt="에스지씨앤씨 주식회사 로고">
		</div>
		<table>
			<tr>
				<th>기업명</th>
				<td>에스지씨앤씨 주식회사</td>
				<th>대표자</th>
				<td>최준완</td>
			</tr>
			<tr>
				<th>업종</th>
				<td>정보통신업</td>
				<th>사업내용</th>
				<td>소프트웨어 개발</td>
			</tr>
			<tr>
				<th>설립시기</th>
				<td>2016년 8월 30일</td>
				<th>규모</th>
				<td>5~49인</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3">부산 수영구 민락로 19번길 21, 3층(민락동)</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">
					<a href="http://sgcnc.kr" tabindex="-1">
						<span aria-hidden="true">http://sgcnc.kr</span>
						<span class="offscreen">에스지씨앤씨 주식회사 홈페이지</span>
					</a>
				</td>
			</tr>
		</table>
	</section>
	<section id="recruitInfo">
		<h2>
			<img class="icons" src="./image/recruit.svg" aria-hidden="true">
			채용정보
		</h2>
		<table>
			<tr>
				<th>모집직종</th>
				<td>소프트웨어 개발자 및 웹디자이너</td>
				<th>모집인원</th>
				<td>5인</td>
			</tr>
			<tr>
				<th>직무내용</th>
				<td>웹 프로그램 개발 및 웹 디자인 업무</td>
				<th>근무지역</th>
				<td>수영구, 재택근무</td>
			</tr>
			<tr>
				<th>학력</th>
				<td>무관</td>
				<th>경력</th>
				<td>무관</td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td>기간의 정함이 없는 근로계약</td>
				<th>근무형태</th>
				<td>주5일</td>
			</tr>
			<tr>
				<th>급여조건</th>
				<td>월급(사규에 따름)</td>
				<th>사회보험</th>
				<td>국민연금, 건강보험, 고용보험, 산재보험</td>
			</tr>
			<tr>
				<th>퇴직금</th>
				<td>퇴직금</td>
				<th>상여금</th>
				<td>기본급 50%</td>
			</tr>
			<tr>
				<th>근무시간</th>
				<td>09:00~18:00</td>
				<th>잔업</th>
				<td>무</td>
			</tr>
			<tr>
				<th>기타조건</th>
				<td colspan="3">면접 후 본사/재택근무 결정, 재택근무 시 업무에 필요한 기자재(컴퓨터 및 전화기) 제공</td>
			</tr>
		</table>
	</section>
	<section id="welfare">
		<h2>
			<img class="icons" src="./image/wing.svg" aria-hidden="true">
			우대사항 및 복리후생
		</h2>
		<table>
			<tr>
				<th>전공</th>
				<td>컴퓨터공학, 웹디자인</td>
				<th>자격면허</th>
				<td>정보처리산업기사</td>
			</tr>
			<tr>
				<th>컴퓨터활용</th>
				<td>문서작성, 표계산, 프리젠테이션</td>
				<th>편의시설</th>
				<td>-</td>
			</tr>
			<tr>
				<th>복리후생</th>
				<td>-</td>
				<th>우대사항</th>
				<td>-</td>
			</tr>
		</table>
	</section>
</div>

<aside id="sideNav">
	<div id="sideNav-container">
		<h3>사이드 메뉴바</h3>
		<a href="" id="bookmark">
			<img src="image/bookmark_off.svg" aria-hidden="true">
			<span>관심기업 등록</span>
		</a>
		<section>
			<h4>빠른 이동</h4>
			<ul>
				<li><a href="javascript:scrollUnderHeader('#comInfo')">기업정보</a></li>
				<li><a href="javascript:scrollUnderHeader('#recruitInfo')">채용정보</a></li>
				<li><a href="javascript:scrollUnderHeader('#welfare')">우대사항 및 복리후생</a></li>
			</ul>
		</section>
		<hr style="margin:10px;">
		<section>
			<h4>바로 지원하기</h4>
			<form>
				<p>이력서를 선택해 주세요.</p>
				<select class="selectResume">
					<option value="">기본이력서</option>
				</select>
				<br>
				<a href="" class="btn" id="resPreview">미리보기</a>
				<br>
				<a href="" class="btn" id="apply">지원하기</a>
			</form>
		</section>
	</div>
</aside>
</main>
<jsp:include page="footer.jsp"/>
</body>
<script src="js/common.js"></script>
</html>