<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<jsp:useBean id="vo" class="jobFairMgr.DisabilityVO" />
<%

	String name = (String)session.getAttribute("lgnName");
	//String name = "관리자";
	vo = dao.getUser(name);
	String pNum1 = vo.getPhoneNum().substring(0, 3);
	String pNum2 = vo.getPhoneNum().substring(3, 7);
	String pNum3 = vo.getPhoneNum().substring(7);
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>2022 부산 장애인 온라인 채용 박람회 | 내 정보 관리</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/myPageForDisability.css">
</head>

<body>
	<jsp:include page="commonJSP/header.jsp"></jsp:include>
	<main>		
		<section class="section-table">
			<div class="title-div">
				<img src="./image/account.svg" aria-hidden="true" class="title-img">
				<p>내 정보 관리</p>
			</div>
			<table>
				<thead>
					<tr class="tr1">
						<th>제목</th>
						<th>내용</th>
					</tr>
				</thead>
			
				<tbody>
					<tr>
						<th>성명</th>
						<td><%=vo.getName() %></td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td><%=vo.getPrefixNum()%> - <%=vo.getSuffixNum()%></td>
					</tr>
					<tr>
						<th>거주지역</th>
						<td>부산광역시 <%=vo.getLivingArea()%></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><%=pNum1 %> - <%=pNum2%> - <%=pNum3%></td>
					</tr>
					<tr>
						<th>장애유형</th>
						<td><%=vo.getDisType() %></td>
					</tr>
					<tr>
						<th>장애등급</th>
						<td><%=vo.getDisLevel() %></td>
					</tr>
				</tbody>
			</table>
			
			<div class="div-sideNav">
				<aside id="sideNav" role="navigation">
					<h3>마이페이지 메뉴</h3>
					<ul>
						<li><a href="myPageForDisability.jsp" >
							<img src="./image/account.svg"  aria-hidden="true">
							내 정보 관리</a></li>
						<li><a href="postResume.jsp" >
							<img src="./image/write_res.svg" aria-hidden="true">
							이력서 작성</a></li>
						<li><a href="myResume.jsp" >
							<img src="./image/resume.svg" aria-hidden="true">
							이력서 관리</a></li>
						<li><a href="pickedList.jsp" >
							<img src="image/bookmark_on.svg" aria-hidden="true">
							관심 채용공고</a></li>
						<li><a href="applyList.jsp" >
							<img src="image/list.svg" aria-hidden="true">
							기업지원 현황</a></li>
					</ul>
				</aside>
			</div> 
		</section>
	</main>
	<jsp:include page="commonJSP/footer.jsp"></jsp:include>
</body>
</html>