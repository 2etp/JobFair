<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO" />
<jsp:useBean id="vo" class="jobFairMgr.GeneralVO" />
<jsp:useBean id="jvo" class="jobFairMgr.JobOpeningVO" />
<jsp:useBean id="disvo" class="jobFairMgr.DisabilityVO" />
<jsp:useBean id="disdao" class="jobFairMgr.DisabilityDAO" />
<%@ page import = "java.util.*" %>
<%@ page import="jobFairMgr.ResumeVO"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("lgnName");
	disvo = disdao.getUser(name);
	int employNum = Integer.parseInt(request.getParameter("employNum"));
	
	jvo = dao.getOpening(employNum);
	vo = dao.getGeneral(jvo.getComNum());
	List<ResumeVO> rvoList = disdao.getResumeList(disvo.getUserNum());
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
		<h1><%=jvo.getTitle() %></h1>
		<section id="comInfo">
			<h2>
				<img class="icons" src="./image/building.svg" aria-hidden="true">
				<span class="secTitle">기업정보</span>
			</h2>
			<div class="logo-wrap">
				<img class="logo" src="image/<%=vo.getLogoName()%>" alt="에스지씨앤씨 주식회사 로고">
			</div>
			<table>
				<tr>
					<th>기업명</th>
					<td><%=vo.getComName()%></td>
					<th>대표자</th>
					<td><%=vo.getCeoName()%></td>
				</tr>
				<tr>
					<th>업종</th>
					<td><%=vo.getSectors()%></td>
					<th>사업내용</th>
					<td><%=vo.getBusinessInfo()%></td>
				</tr>
				<tr>
					<th>설립시기</th>
					<td><%=vo.getFoundedDate()%></td>
					<th>규모</th>
					<td><%=vo.getComSize()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><%=vo.getComAddress()%></td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="3">
					<%if(vo.getComUrl().equals("-")) { %>
						<a href="#" tabindex="-1">
					<%} else { %>
						<a href="<%=vo.getComUrl()%>" tabindex="-1">
					<%}%>
							<span aria-hidden="true"><%=vo.getComUrl()%></span>
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
					<td><%=jvo.getPosition()%></td>
					<th>모집인원</th>
					<td><%=jvo.getPeople()%>인</td>
				</tr>
				<tr>
					<th>직무내용</th>
					<td><%=jvo.getTask()%></td>
					<th>근무지역</th>
					<td><%=jvo.getWorkArea()%></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><%=jvo.getEducation()%></td>
					<th>경력</th>
					<td><%=jvo.getCareer()%></td>
				</tr>
				<tr>
					<th>고용형태</th>
					<td><%=jvo.getEmployType()%></td>
					<th>근무형태</th>
					<td><%=jvo.getWorkType()%></td>
				</tr>
				<tr>
					<th>급여조건</th>
					<td><%=jvo.getPay()%></td>
					<th>사회보험</th>
					<td><%=jvo.getInsurance()%></td>
				</tr>
				<tr>
					<th>퇴직금</th>
					<td><%=jvo.getSeverancePay()%></td>
					<th>상여금</th>
					<td><%=jvo.getBonus() %></td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><%=jvo.getOfficeHours()%></td>
					<th>잔업</th>
					<td><%=jvo.getOvertime() %></td>
				</tr>
				<tr>
					<th>기타조건</th>
					<td colspan="3"><%=jvo.getEtc()%></td>
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
					<td><%=jvo.getMajor()%></td>
					<th>자격면허</th>
					<td><%=jvo.getCertificate()%></td>
				</tr>
				<tr>
					<th>컴퓨터활용</th>
					<td><%=jvo.getComputerLevel()%></td>
					<th>편의시설</th>
					<td><%=jvo.getFacilities()%></td>
				</tr>
				<tr>
					<th>복리후생</th>
					<td><%=jvo.getWelfare()%></td>
					<th>우대사항</th>
					<td><%=jvo.getPreferred()%></td>
				</tr>
			</table>
		</section>
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<div id="sideNav-container">
					<h3>채용공고 메뉴</h3>
					<%
					boolean flag = disdao.isExistInter(employNum, disvo.getUserNum());
					if(flag) { %>
						<a href="javascript:companyBookmark()" id="bookmark">
							<img src="image/bookmark_on.svg" aria-hidden="true">
							<span>관심공고 해제</span>
						</a>
					<%} else {%>
						<a href="javascript:companyBookmark()" id="bookmark">
							<img src="image/bookmark_off.svg" aria-hidden="true">
							<span>관심공고 등록</span>
						</a>
					<%} %>
						<!-- 관심공고 등록 폼 -->
						<form aria-hidden="true" name="bookmarkFrm" method="get" action="addInterCom.jsp">
							<input type="hidden" name="user" value="<%=disvo.getUserNum()%>">
							<input type="hidden" name="employNum" value="<%=employNum%>">
							<input type="hidden" name="flag" value="<%=flag%>">
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
						<form name="applyFrm" method="post" action="apply_proc.jsp">
							<input type="hidden" name="user" value="<%=disvo.getUserNum()%>" aria-hidden="true">
							<input type="hidden" name="employNum" value="<%=employNum%>" aria-hidden="true">
							<select class="selectResume" name="resume" id="resume">
								<%for(int i = 0; i < rvoList.size(); i++)  { 
									ResumeVO revo = rvoList.get(i);%>
									<option value="<%=revo.getResumeNum()%>"><%=revo.getTitle()%></option>
								<%}%>
							</select>
							<br>
							
							<!-- 새 탭으로 현재 선택된 이력서를 자세히 보도록 a태그에 url을 달아줘야함 -->
							<a href="" target="_blank" class="btn" id="resPreview">미리보기</a>
							<!-- 
							<script>
								const a = document.getElementByID('resPreview');
								const select = document.getElementByID('resume');
								a.href="myResume.jsp?resumeNum="+select.value;
							</script>
							 -->
							
							<br>
							<input id="agreementChk" type="checkbox" required>
							<label for="agreementChk">
								<span>채용공고 및 이력서를</span>
								<br>
								<span>모두 확인하였습니다.</span>
							</label>
							<br>
							<input type="button" class="btn" id="apply" value="지원하기" role="button" 
								onclick="applyRecru()">
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
<script defer src="js/recruitmentDetail.js"></script>
</html>