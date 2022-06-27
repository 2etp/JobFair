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
	<section>
		<form name="signupFrm" method="post" action="signupProc.jsp?type=Disability">
			<label>성명</label>
			<input type="text" name="name">
			<label>주민등록번호</label>
			<input type="number" name="prefixNum"> -
			<input type="number" name="suffixNum">
			
			<label>거주지역</label>
			<select name="livingArea">
				<option value="gangseogu" selected>강서구</option>
				<option value="geumjeonggu">금정구</option>
				<option value="gijanggun">기장군</option>
				<option value="namgu">남구</option>
				<option value="donggu">동구</option>
				<option value="dongnaegu">동래구</option>
				<option value="busanjingu">부산진구</option>
				<option value="bukgu">북구</option>
				<option value="sasanggu">사상구</option>
				<option value="sahagu">사하구</option>
				<option value="seogu">서구</option>
				<option value="suyeonggu">수영구</option>
				<option value="yeonjegu">연제구</option>
				<option value="yeongdogu">영도구</option>
				<option value="haeundae">해운대구</option>
				<option value="gimhaesi">김해시</option>
			</select>
			
			<label>연락처</label>
			<input type="tel" name="mobile">
			
			<label>장애유형</label>
			<select>
				<option value="physical" selected>지체장애</option>
				<option value="brain">뇌병변장애</option>
				<option value="eyes">시각장애</option>
				<option value="ears">청각장애</option>
				<option value="language">언어장애</option>
				<option value="face">안면장애</option>
				<option value="kidney">신장장애</option>
				<option value="heart">심장장애</option>
				<option value="liver">간장애</option>
				<option value="respiratory">호흡기장애</option>
				<option value="stoma">장루·요루장애</option>
				<option value="epilepsy">뇌전증장애</option>
				<option value="intellectual">지적장애</option>
				<option value="autism">자폐성장애</option>
				<option value="mental">정신장애</option>	
			</select>
			
			<label>장애등급</label>
			<select>
				<option value="grade1" selected>1등급</option>
				<option value="grade2">2등급</option>
				<option value="grade3">3등급</option>
				<option value="grade4">4등급</option>
				<option value="grade5">5등급</option>
				<option value="grade6">6등급</option>
			</select>
			
			<label><input type="checkbox" name="collectInfo" value="">개인정보 수집 및 활용에 동의</label>
			
			<a href="javascript:signupCheck();" role="button">회원가입</a>
			
		</form>
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>