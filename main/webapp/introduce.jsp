<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/introduce.css">
	
</head>
<body>
	<jsp:include page="commonJSP/header.jsp"></jsp:include>
	<main>
		<section>
			<article>
				<img src="image/Introduce1.png">
			</article>
			<article>
				<img src="image/Introduce1.png">
			</article>
			<article class="article-leftarrow">
				<div>처음으로</div>
				<a href="index.jsp" role="button">
					<img src="image/arrow.png">
				</a>
			</article>
		</section>
	</main>
	<jsp:include page="commonJSP/footer.jsp"></jsp:include>
</body>
</html>