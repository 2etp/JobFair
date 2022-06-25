<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 관심기업 관리</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/pickedList.css?after">
</head>
<body>

<jsp:include page="header.jsp"/>

<main>

	<h2 class="title">관심기업</h2>
	<section>
		<div class="jobOpening">
			<img src="./image/mjt.png">
			<div class="content">
				<a href="#" role="button"><b>(주식회사)엠제이티</b></a>
				<p>근무지역</p>
				<p>사상구</p>
				<p>직무</p>
				<p>CNC, MCT, 가공후처리(버핑)</p>
			</div>
			
			<a href="#" role="button">접수마감</a>
			<p>~ 7/26</p>
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