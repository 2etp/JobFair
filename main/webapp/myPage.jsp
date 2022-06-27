<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/myPage.css">
	<link rel="stylesheet" href="css/aside.css">
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<section>
			<jsp:include page="aside.jsp"></jsp:include>
		</section>
		<section class="section-table">
			<table>
				<tr>
					<th>성명</th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td>123456-1234567</td>
				</tr>
				<tr>
					<th>거주지역</th>
					<td>부산광역시 강서구</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>010-1234-5678</td>
				</tr>
				<tr>
					<th>장애유형</th>
					<td>지체장애</td>
				</tr>
				<tr>
					<th>장애등급</th>
					<td>1급</td>
				</tr>
			</table>
		</section>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>