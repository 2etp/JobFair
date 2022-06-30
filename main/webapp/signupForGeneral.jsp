<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 등록(장애인용)</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/signupForGeneral.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<form name="signupFrm" method="post" action="signup" enctype="multipart/form-data">
			<p>회원가입</p>
			<div class="profile">
				<img src="./image/company.svg" alt="기업로고 이미지">
				<p>[가로 300픽셀, 세로 200픽셀 크기의 사진을 올려주세요.]</p> 
				<label for="fileUpload"><img src="./image/camera.svg"><span>파일선택</span></label>
				<input type="file" id="fileUpload" name="filename" style="display: none;"/>

			</div>
			
			<div class="signupFrm1">
				<label for="companyName">기업명</label>
				<input type="text" name="companyName" id="companyName" placeholder="ex) 삼성" title="기업명">
			</div>
			
			<div class="signupFrm2"	>
				<label for="address">기업주소</label>
				<input type="text" name="address" id="address" placeholder="ex) 부산광역시 부산진구 서면대로 110번길 20" title="기업주소">
			</div>
				
			<div class="signupFrm3">
				<label for="name">대표자 이름</label>
				<input type="text" name="ceoName" id="name" placeholder="ex) 홍길동" title="대표자 이름">
			</div>
			
			<div class="signupFrm4">	
				<label for="homepage">홈페이지</label>
				<input type="text" name="homepage" id="homepage" placeholder="ex) abc@naver.com" title="홈페이지">
			</div>	
			
			<div class="signupFrm5">
				<label for="mobile">연락처</label>
				<input type="tel" name="mobile" id="mobile" placeholder="'-' 를 빼고 입력해 주세요" title="연락처">
			</div>	
			
			<div class="signupFrm6">
				<label><input type="checkbox" name="collectInfo" value="" title="개인정보 수집 및 활용 동의 여부">개인정보 수집 및 활용에 동의</label>
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