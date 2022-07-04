<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.ApplyListVO" %>
    
<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 지원자 리스트</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/applicantList.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<div class="title-div">
			<img src="image/applyList.png" aria-hidden="true" class="title-img">
			<p>지원자 리스트</p>
		</div>
		<table>
			<thead>
			<tr class="tr1">
				<th>번호</th>
				<th>제목</th>
				<th>지원자</th>
				<th>지원 날짜</th>
				<th>이력서</th>
			</tr>
			</thead>
			
			<tbody>
			<tr class="tr2">
				<td>1</td>
				<td>열정으로 보답하겠다.</td>
				<td>닝겐</td>
				<td>2022.07.04</td>
				<td><a href="#"><img src="./image/resumeList.png" alt="이력서 보기 이미지">이력서 보기</a></td>
			</tr>
			</tbody>
		</table>
		
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<h3>가이드 메뉴</h3>
				<img src="image/guide.png" aria-hidden="true">
					<ul>
						<li><img src="./image/resume.png" aria-hidden="true">
							<a href="postJobOpening.jsp" role="button">채용공고 등록</a></li>
						<li><img src="./image/myPage.svg"  aria-hidden="true">
							<a href="myPageForGeneral.jsp" role="button">기업정보 관리</a></li>
						<li><img src="image/applyList.png" aria-hidden="true">
							<a href="applicantList.jsp" role="button">지원자 현황</a></li>
					</ul>
			</aside>
		</div> 
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>