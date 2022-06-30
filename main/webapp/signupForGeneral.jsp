<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 등록(장애인용)</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/signupForGeneral.css">
<script defer src="js/signupForGeneral.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<form name="signupFrm" method="post" action="signup" enctype="multipart/form-data">
			<p>기업 회원가입</p>
			<div class="profile">
				<img src="./image/company.svg" alt="기업로고 이미지">
				<p>[가로 300픽셀, 세로 200픽셀 크기의 사진을 올려주세요.]</p> 
				<label for="fileUpload"><img src="./image/camera.svg"><span>파일선택</span></label>
				<input type="file" id="fileUpload" name="filename" style="display: none;"/>

			</div>
			
			<div class="signupFrm1">
				<label for="companyName">기업명</label>
				<input type="text" name="companyName" id="companyName" placeholder="예시) 삼성" title="기업명">
			</div>
			
			<div class="signupFrm2"	>
				<label for="address">기업주소</label>
				<input type="text" name="address" id="address" placeholder="예시) 부산광역시 부산진구 서면대로 110번길 20" title="기업주소">
			</div>
				
			<div class="signupFrm3">
				<label for="name">대표자 이름</label>
				<input type="text" name="ceoName" id="name" placeholder="예시) 홍길동" title="대표자 이름">
			</div>
			
			<div class="signupFrm4">	
				<label for="homepage">홈페이지</label>
				<input type="text" name="homepage" id="homepage" placeholder="예시) abc.co.kr" title="홈페이지">
			</div>	
			
			<div class="signupFrm5">
				<label for="mobile">연락처</label>
				<input maxlength="11" type="tel" name="mobile" id="mobile" placeholder="숫자만 입력해 주세요." title="연락처">
			</div>
			
			<div class="signupFrm6">	
				<label for="sectors">업종</label>
				<select id="sectors" name="sectors" title="업종">
					<option value="제조업" selected>제조업</option>
					<option value="서비스">서비스</option>
					<option value="도소매업">도소매업</option>
					<option value="보건업">보건업</option>
					<option value="숙박업">숙박업</option>
					<option value="사회복지">사회복지</option>
					<option value="교욱서비스업">교욱 서비스업</option>
					<option value="외식업">외식업</option>
				</select>
			</div>
			
			<div class="signupFrm7">
				<label for="businessInfo">사업내용</label>
				<select id="businessInfo" name="businessInfo" title="사업내용">
					<option value="기계부품" selected>기계부품</option>
					<option value="청소">청소</option>
					<option value="	소프트웨어개발">	소프트웨어 개발</option>
					<option value="자동차용부품">자동차용 부품</option>
					<option value="커피가공">커피가공</option>
					<option value="신발제조">신발제조</option>
					<option value="자동차부품_운송장비_정밀가공업">자동차부품 운송장비 정밀가공업</option>
					<option value="중개업">중개업</option>
					<option value="치아_임플란트_등_제조">치아 임플란트 등 제조</option>
					<option value="인쇄">인쇄</option>
					<option value="식품접객업">식품접객업</option>
					<option value="제과제빵">제과제빵</option>
					<option value="사무용품">사무용품</option>
					<option value="디자인">디자인</option>
					<option value="의료기기_개발_및_생산">의료기기 개발 및 생산</option>
					<option value="병원">병원</option>
					<option value="스마트팜">스마트팜</option>
					<option value="소방내진자재_제조_및_판매">소방내진자재 제조 및 판매</option>
					<option value="주변압기">주변압기</option>
					<option value="제조업_식품가공_OEM생산">제조업 식품가공 OEM생산</option>
				</select>
			</div>
			
			<div class="signupFrm8">
				<label for="comSize">규모</label>
				<select id="comSize" name="comSize" title="규모">
					<option value="max50" selected>50명 이하</option>
					<option value="max100">100명 이하</option>
					<option value="max100">101~300</option>
					<option value="max100">301~600</option>
					<option value="more300">1000명 이상</option>
				</select>
			</div>
			
			<div class="signupFrm9">
				<label><input id="checkbox" type="checkbox" name="collectInfo" value="" title="개인정보 수집 및 활용 동의 여부">개인정보 수집 및 활용에 동의</label>
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