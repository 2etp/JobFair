<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 홈</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/signup.css">
</head>
<body>
<jsp:include page="commonJSP/header.jsp"/>
<main>
	<section>
		<h1>회원가입</h1>
		<div class="div-signuplink-form">
			<div class="div-signuplink-left">
				
				<div class="div-signuplink disability">
					<a href="signupForDisability.jsp"><img src="image/signup_w.svg" aria-hidden="true">
					개인 회원가입</a>
				</div>
			</div>
			<div class="div-signuplink-right">
				<div class="div-signuplink general">
					<a href="signupForGeneral.jsp"><img src="image/buildings_w.svg" aria-hidden="true">
					기업 회원가입</a>
				</div>
			</div>
			
		</div>
	</section>
</main>
<jsp:include page="commonJSP/footer.jsp"/>
</body>
</html>

