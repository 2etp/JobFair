<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 등록(장애인용)</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main>
	<seciton>
		<form name="signupFrm" method="post" action="signupProc.jsp?type=General">
			<label>기업명</label>
			<input type="text" name="companyName">
			
			<label>대표자 이름</label>
			<input type="text" name="name">
			
			<label>기업주소</label>
			<input type="text" name="address">
			
			<label>홈페이지</label>
			<input type="text" name="homepage">
			
			<label>연락처</label>
			<input type="tel" name="mobile">
			
			<select>
				<option value="">
				<option value="">
				<option value="">
				<option value="">
				<option value="">
			</select>
			<select>
				<option value="">
				<option value="">
				<option value="">
				<option value="">
				<option value="">
			</select>
			
			<label><input type="checkbox" name="collectInfo" value="">개인정보 수집 및 활용에 동의</label>
			
			<a href="javascript:signupCheck();" role="button">회원가입</a>
			
		</form>
	</seciton>
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>