<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 로그인</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/login.css">
<script defer src="js/login.js"></script>
</head>
<body>
	
<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<form name="logFrm" method="post" action="loginProc.jsp">
			<div class="div-form">
				<ul>
					<li class="li-private enable">
						<a href="javascript:void(0)" >개인 회원</a>
					</li>
					<li class="li-enterprise">
						<a href="javascript:void(0)" >기업 회원</a>
					</li>
				</ul>
				<div class=div-input>
					<div class=div-name>
						<label for="name">이름을 입력해주세요</label>
						<input id="name" type="text" name="name">	
					</div>
					<div class=div-phone>
						<label for="phone">휴대폰번호를 -를 제외하고 입력해주세요.</label>
						<input id="phone" type="tel" name="mobile">
					</div>
					<div class=div-submit>
						<a id="loginButton" href="javascript:loginCheck();" role="button">로그인</a>
					</div>
				</div>
				<div class="div-register">
					<a href="javascript:void(0)">지금 바로 개인 회원 가입하기</a>
				</div>
			</div>
		</form>
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>