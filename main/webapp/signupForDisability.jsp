<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 회원가입</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/signupForDisability.css">
<script defer src="js/signupForDisability.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<div class="title">
			<img src="./image/signup.svg" aria-hidden="true">
			<p>개인 회원가입</p>
		</div>
		<form name="signupFrm" method="post" action="disSignup" enctype="multipart/form-data">
			<div class="signupFrm1">
				<label for="name">성명</label>
				<input type="text" name="name" id="name" placeholder="성과 이름을 띄어쓰기 없이 모두 입력해 주세요.">
			</div>
			
			<div class="signupFrm2">
				<label for="residentNum">주민등록번호</label>
				<input maxlength="6" type="tel" name="prefixNum" id="residentNum" placeholder="주민등록번호 앞 6자리" >-
				<input maxlength="7" id="residentNum2" type="password" name="suffixNum" placeholder="주민등록번호 뒤 7자리" >
			</div>
			
			<div class="signupFrm3">
				<label for="mobile">휴대폰번호</label>
				<input maxlength="11" type="tel" name="mobile" id="mobile" placeholder="숫자만 입력해 주세요.">
			</div>
		
			<div class="signupFrm4">	
				<label for="type">장애유형</label>
				<select name="type" id="type" style="width:100px;height:30px;">
					<option value="" class="select-holder" aria-hidden="true" selected>선택</option>
					<option value="지체장애">지체장애</option>
					<option value="뇌병변장애">뇌병변장애</option>
					<option value="시각장애">시각장애</option>
					<option value="청각장애">청각장애</option>
					<option value="언어장애">언어장애</option>
					<option value="안면장애">안면장애</option>
					<option value="신장장애">신장장애</option>
					<option value="심장장애">심장장애</option>
					<option value="간장애">간장애</option>
					<option value="호흡기장애">호흡기장애</option>
					<option value="장루·요루장애">장루·요루장애</option>
					<option value="뇌전증장애">뇌전증장애</option>
					<option value="지적장애">지적장애</option>
					<option value="자폐성장애">자폐성장애</option>
					<option value="정신장애">정신장애</option>	
				</select>
			</div>
			
			<div class="signupFrm5">
				<label for="grade">장애등급</label>
				<select name="grade" id="grade" style="width:100px;height:30px;">
					<option value="" class="select-holder" aria-hidden="true" selected>선택</option>
					<option value="1등급">1등급</option>
					<option value="2등급">2등급</option>
					<option value="3등급">3등급</option>
					<option value="4등급">4등급</option>
					<option value="5등급">5등급</option>
					<option value="6등급">6등급</option>
				</select>
			</div>
			
			<div class="signupFrm6">
				<label for="livingArea">거주지역</label>
				<select name="livingArea" id="livingArea" style="width:100px;height:30px;">
					<option value="" class="select-holder" aria-hidden="true" selected>선택</option>
					<option value="강서구">강서구</option>
					<option value="금정구">금정구</option>
					<option value="기장군">기장군</option>
					<option value="남구">남구</option>
					<option value="동구">동구</option>
					<option value="동래구">동래구</option>
					<option value="부산진구">부산진구</option>
					<option value="북구">북구</option>
					<option value="사상구">사상구</option>
					<option value="사하구">사하구</option>
					<option value="서구">서구</option>
					<option value="수영구">수영구</option>
					<option value="연제구">연제구</option>
					<option value="영도구">영도구</option>
					<option value="해운대구">해운대구</option>
					<option value="김해시">김해시</option>
				</select>
			</div>
			
			<div class="signupFrm7">
				<label><input id="checkbox" type="checkbox" name="collectInfo">개인정보 수집 및 활용에 동의</label>
			</div>
			
			<div>
				<a href="javascript:signupCheck();" role="button" id="signupBtn">가입하기</a>
			</div>
		</form>
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>
</body>
</html>





















