<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용공고 관리</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/jobOpeningList.css">
</head>

<body>

<jsp:include page="commonJSP/header.jsp"></jsp:include>

<main>
	<section>
		<div class="div-search">
			<img src="./image/search.svg" aria-hidden="true">
			<input id="companyName" type="text" name="companyName" placeholder="채용공고 제목을 입력해 주세요." title="기업명" value="">
			<a id="submit-button" href="javascript:" role="button"
			 onclick="searchName()">검색</a>
		</div>	
	</section>
	
	<section>
		<div class="div-list">
			<img src="./image/building.png" aria-hidden="true">
			<p>채용공고 리스트</p>
		</div>

		<div>
			<div class="div-frame"><!-- 로고 이미지 -->

				<div class="company-contents"> <!-- 채용글 -->
					<%-- <a href="recruitmentDetail.jsp?employNum=<%=%>" role="button"><%=%></a> --%>
					<p><span></span></p>
					<p><span></span></p>
					<p></p>
				</div>
			</div>
		</div>
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"></jsp:include>

</body>
</html>