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
				<img src="image/signupDisability.png">
				
				<div class="div-signuplink disability">
					<a href="signupForDisability.jsp" id="introFair">개인회원가입</a>
				</div>
			</div>
			<div class="div-signuplink-right">
				<img src="image/signupGeneral.png">
				<div class="div-signuplink general">
					<a href="signupForGeneral.jsp" id="introFair">기업회원가입</a>
				</div>
			</div>
			
		</div>
	</section>
</main>
<jsp:include page="commonJSP/footer.jsp"/>
</body>
</html>

