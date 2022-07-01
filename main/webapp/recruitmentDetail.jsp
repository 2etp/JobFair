<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="dao" class="jobFairMgr.generalDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.jobOpeningVO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("lgnName");
	
	String employNum_str = request.getParameter("employNum");
	employNum_str="3";//test
	int employNum = 0;
	
	jobOpeningVO vo = new jobOpeningVO();
	int comNum = 0;			// 기업 고유번호 -> 나중에 외래키로 쓰여질 예정
	String title = null;			// 채용공고 이름
	String position = null;		// 모집 직종
	int people = 0;				// 모집 인원
	String task = null;			// 직무 내용
	String workArea = null;		// 근무 지역
	String education = null;		// 학력
	String career = null;			// 경력
	String employType = null;		// 고용형태
	String workType = null;		// 근무형태
	String pay = null;				// 급여조건
	String insurance = null;		// 사회보험
	String officeHours = null;		// 근무시간
	String etc = null;				// 기타
	String major = null;			// 전공
	String certificate = null;		// 자격증
	String computerLevel = null;	// 컴퓨터활용
	String facilities = null;		// 편의시설
	String welfare = null;			// 복리후생
	String preferred = null;		// 우대사항
	String openingDate = null;
	
	if(employNum_str != null){
		employNum = Integer.parseInt(employNum_str);
		vo = dao.getOpening(employNum);
		comNum = vo.getComNum();			// 기업 고유번호 -> 나중에 외래키로 쓰여질 예정
		title = vo.getTitle();			// 채용공고 이름
		position = vo.getPosition();		// 모집 직종
		people = vo.getPeople();				// 모집 인원
		task = vo.getTask();			// 직무 내용
		workArea = vo.getWorkArea();		// 근무 지역
		education = vo.getEducation();		// 학력
		career = vo.getCareer();			// 경력
		employType = vo.getEmployType();		// 고용형태
		workType = vo.getWorkType();		// 근무형태
		pay = vo.getPay();				// 급여조건
		insurance = vo.getInsurance();		// 사회보험
		officeHours = vo.getOfficeHours();		// 근무시간
		etc = vo.getEtc();				// 기타
		major = vo.getMajor();			// 전공
		certificate = vo.getCertificate();		// 자격증
		computerLevel = vo.getComputerLevel();	// 컴퓨터활용
		facilities = vo.getFacilities();		// 편의시설
		welfare = vo.getWelfare();			// 복리후생
		preferred = vo.getPreferred();		// 우대사항
		openingDate = vo.getOpeningDate();
	}
%>
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
<jsp:include page="commonJSP/header.jsp"/> 
<main>
	<div id="container">
		<h1><%=title %></h1>
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
					<td><%=position %></td>
					<th>모집인원</th>
					<td><%=people %>인</td>
				</tr>
				<tr>
					<th>직무내용</th>
					<td><%=task %></td>
					<th>근무지역</th>
					<td><%=workArea %></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><%=education %></td>
					<th>경력</th>
					<td><%=career %></td>
				</tr>
				<tr>
					<th>고용형태</th>
					<td><%=employType %></td>
					<th>근무형태</th>
					<td><%=workType %></td>
				</tr>
				<tr>
					<th>급여조건</th>
					<td><%=pay %></td>
					<th>사회보험</th>
					<td><%=insurance %></td>
				</tr>
				<tr>
					<th>퇴직금</th>
					<td><% %></td>
					<th>상여금</th>
					<td>기본급 50%</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><%=officeHours %></td>
					<th>잔업</th>
					<td>무</td>
				</tr>
				<tr>
					<th>기타조건</th>
					<td colspan="3"><%=etc %></td>
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
					<td><%=major %></td>
					<th>자격면허</th>
					<td><%=certificate %></td>
				</tr>
				<tr>
					<th>컴퓨터활용</th>
					<td><%=computerLevel %></td>
					<th>편의시설</th>
					<td><%=facilities %></td>
				</tr>
				<tr>
					<th>복리후생</th>
					<td><%=welfare %></td>
					<th>우대사항</th>
					<td><%=preferred %></td>
				</tr>
			</table>
		</section>
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<div id="sideNav-container">
					<h3>채용공고 메뉴</h3>
					<a href="" id="bookmark">
						<img src="image/bookmark_off.svg" aria-hidden="true">
						<span>관심기업 등록</span>
					</a>
					<!-- 관심기업 등록 폼 -->
					<form aria-hidden="true">
						<input type="hidden" name="user" value="">
						<input type="hidden" name="employNum" value="<%=employNum%>">
					</form>
					<!-- 관심기업 등록 폼 끝 -->
					<section id="quickLink">
						<h4>
							<img class="small-icons" src="image/thunder.svg" aria-hidden="true">
							<span>빠른 이동</span>
						</h4>
						<ul>
							<li><a href="javascript:scrollUnderHeader('#comInfo')">
								<img class="small-icons" src="./image/building.svg" aria-hidden="true">
								기업정보
							</a></li>
							<li><a href="javascript:scrollUnderHeader('#recruitInfo')">
								<img class="small-icons" src="./image/recruit.svg" aria-hidden="true">
								채용정보
							</a></li>
							<li><a href="javascript:scrollUnderHeader('#welfare')">
								<img class="small-icons" src="./image/wing.svg" aria-hidden="true">
								우대사항 및 복리후생
							</a></li>
						</ul>
					</section>
					
					<hr style="margin:10px;">
					
					<%if(name == null){ %>
					<section id="loginPlz">
						<div>
							로그인 후 채용공고에<br>지원 가능합니다.
							<br>
							<a href="login.jsp" class="btn" id="loginBtn">로그인</a>
						</div>
					</section>
					<%}else{ %>
					<section id="applyment">
						<h4>
							<img class="small-icons" src="image/apply.svg" aria-hidden="true">
							<span>바로 지원하기</span>
						</h4>
						<!-- 이력서 제출 폼 -->
						<form name="applyFrm">
							<input type="hidden" name="user" value="" aria-hidden="true">
							<input type="hidden" name="employNum" value="<%=employNum%>" aria-hidden="true">
							<select class="selectResume" name="resume">
								<option value="">기본이력서</option>
							</select>
							<br>
							<a href="" class="btn" id="resPreview">미리보기</a>
							<br>
							<input id="agreementChk" type="checkbox" required>
							<label for="agreementChk">
								<span>채용공고 및 이력서를</span>
								<br>
								<span>모두 확인하였습니다.</span>
							</label>
							<br>
							<input type="button" class="btn" id="apply" value="지원하기" role="button">
						</form>
						<!-- 이력서 제출 폼 끝 -->
					</section>
					<%} //if %>
				</div> <!-- sideNav-container -->
			</aside>		
		</div> <!-- div-sideNav -->
	</div> <!-- container -->
</main>
<jsp:include page="commonJSP/footer.jsp"/>
</body>
<script src="js/common.js"></script>
<script src="js/recruitmentDetail.js"></script>
</html>