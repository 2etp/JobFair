<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 로그인</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>
	
<jsp:include page="header.jsp"/>

<main>
	<seciton>
		<form name="logFrm" method="post" action="loginProc.jsp">
			<input type="text" name="id	">	
			<input type="password" name="pw">
			<a href="javascript:loginCheck();" role="button">로그인</a>
		</form>
	</seciton>
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>