<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2022 부산 장애인 온라인 채용 박람회 | 회원가입</title>
</head>
<body>

	<form name="signupFrm" method="post" action="signupProc.jsp">
		<input type="text" name="name">
		<input type="number" name="prefixNum">
		<input type="number" name="suffixNum">
		<select>
			<option value="">
			<option value="">
			<option value="">
			<option value="">
		</select>
		<input type="text" name="residence">
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
</body>
</html>