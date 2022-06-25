<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 입사지원</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main>
	<section>
		<p>채용공고</p>
		
	    <form name="appplyFrm" method="post" action="applyProc.jsp">
	    	<a href="javascript:" role="button">입사지원</a>
	    </form>
	</section>	
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>