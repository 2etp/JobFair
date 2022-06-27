<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 홈</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/common.css">
</head>
<body>
<header>
	<div class="logo">
		<img src="images/head_00.png" alt="2021 부산 장애인 온라인 채용 박람회">
	</div>
</header>
<main>
	<div class="main-img">
		<img src="image/main.png">
	</div>
	<nav>
		<section class="sign">
			<a href="signUp.jsp" id="signUp">회원가입</a>
			<a href="login.jsp" id="signIn">로그인</a>
		</section>
		<section class="how-to">
			<a href="" id="howTo">사이트 이용방법</a>
		</section>
		<section class="nav-main">
			<a href="introduce.jsp" id="introFair">박람회 소개</a>
			<a href="recruitment.jsp" id="employee">채용관</a>
		</section>
	</nav>
</main>
<jsp:include page="commonJSP/footer.jsp"/>
</body>
</html>