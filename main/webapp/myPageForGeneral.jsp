<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdao" class="jobFairMgr.GeneralDAO" />
<jsp:useBean id="vo" class="jobFairMgr.GeneralVO" />

<%

	String name = (String)session.getAttribute("lgnName");
	vo = gdao.getGeneral(name);
	String pNum1 = vo.getComTel().substring(0, 3);
	String pNum2 = vo.getComTel().substring(3, 7);
	String pNum3 = vo.getComTel().substring(7);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 내 정보 관리</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/myPageForGeneral.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"></jsp:include>

<main>
	<section class="section-table">
		<p>기업정보 관리</p>
		<table>
			<thead>
				<tr class="tr1">
					<th>제목</th>
					<th>내용</th>
				</tr>
			</thead>
		
			<tbody>
				<tr>
					<th>기업명</th>
					<td><%=vo.getComName() %></td>
				</tr>
				<tr>
					<th>기업주소</th>
					<td><%=vo.getComAddress()%></td>
				</tr>
				<tr>
					<th>대표자 이름</th>
					<td><%=vo.getCeoName()%></td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td><%=vo.getComUrl() %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=pNum1 %> - <%=pNum2%> - <%=pNum3%></td>
				</tr>
				<tr>
					<th>업종</th>
					<td><%=vo.getSectors() %></td>
				</tr>
				<tr>
					<th>사업내용</th>
					<td><%=vo.getBusinessInfo() %></td>
				</tr>
				<tr>
					<th>규모</th>
					<td><%=vo.getComSize()%></td>
				</tr>
				<tr>
					<th>설립시기</th>
					<td><%=vo.getFoundedDate()%></td>
				</tr>			
			</tbody>
		</table>
		
			<div class="div-sideNav">
				<aside id="sideNav" role="navigation">
					<h3>가이드 메뉴</h3>
					<img src="image/guide.png" aria-hidden="true">
					<ul>
						<li><img src="./image/resume.png" aria-hidden="true">
							<a href="postResume.jsp" role="button">채용공고 등록</a></li>
						<li><img src="./image/myPage.svg"  aria-hidden="true">
							<a href="myPageForGeneral.jsp" role="button">기업정보 관리</a></li>
						<li><img src="./image/myResume.png" aria-hidden="true">
							<a href=".jsp" role="button">채용공고 관리</a></li>
						<li><img src="image/applyList.png" aria-hidden="true">
							<a href=".jsp" role="button">지원자 현황</a></li>
					</ul>
				</aside>
			</div> 
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"></jsp:include>
</body>
</html>