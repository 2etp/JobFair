<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 회원가입</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<seciton>
		<form name="signupFrm" method="post" action="signupProc.jsp?type=Disability">
			<label>성명</label>
			<input type="text" name="name">
			<label>주민등록번호</label>
			<input type="number" name="prefixNum"> -
			<input type="number" name="suffixNum">
			
			<label>거주지역</label>
			<select>
				<option value="">
				<option value="">
				<option value="">
				<option value="">
			</select>
			
			<label>연락처</label>
			<input type="tel" name="mobile">
			
			<label>장애유형</label>
			<select>
				<option value="">
				<option value="">
				<option value="">
				<option value="">
				<option value="">
			</select>
			
			<label>장애등급</label>
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

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>