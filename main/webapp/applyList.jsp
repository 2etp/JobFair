<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 기업지원 현황</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/applyList.css?after">
</head>
<body>

<jsp:include page="header.jsp"/>

<main>

	<h2 class="title">기업지원 현황</h2>
	<section>

			<div class="applyList">
				<img src="./image/mjt.png">
				
				<div class="content">
					<a href="#" role="button"><b>(주식회사)엠제이티</b></a>
					<p>CNC, MCT, 가공후처리(버핑)</p>
				</div>
				
				<div class="progress">
					<h3>진행현황</h3>
					<p>서류합격</p>
				</div>
				
				<img src="./image/resume.png" alt="이력서 이미지">
				<div class="buttons">
					<a href="javascript:" role="button">지원한 이력서</a>
					<a href="javascript:" role="button">지원취소</a>
				</div>
			</div>
			
		<aside class="sideBar">
			<a href="javascript:" role="button">내 정보 관리</a>
			<a href="javascript:" role="button">이력서 관리</a>
			<a href="javascript:" role="button">관심기업 관리</a>
			<a href="javascript:" role="button">기업지원 현황</a>
		</aside>
	</section>
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>