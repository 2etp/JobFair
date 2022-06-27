<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.OpeningListVO" %>

<%
	request.setCharacterEncoding("UTF-8");
//	int userNum = (int)session.getAttribute("lgnUserNum");
	int userNum = 1;
	
	
	//페이징 넘버 작업

	// 한 페이지에 보여줄 게시글 개수
	int pageSize = 10;
	// 현재 페이지
	String pageNum = request.getParameter("pageNum");
	// pageNum이 null이라는 뜻은 처음 이 사이트에 들어왔다는 뜻이며, 그러한 경우 1번 페이지를 보여준다.
	if(pageNum == null) {
		pageNum = "1";
	}
	
	// 첫번째 글이 전체 게시글중 몇번째인지 계산
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	
	List<OpeningListVO> list = dao.getPickedList(userNum, startRow, pageSize);
	int cnt = dao.getPickedCount(userNum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 관심기업 관리</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/pickedList.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main style="display: block; margin: auto;">

	
	
	<section style="width: 800px;">
	<h2 class="title">관심기업</h2>
	<hr>
		<div class="jobOpening">
			<%for(int i = 0; i < list.size(); i++) { 
				OpeningListVO vo = list.get(i);%>
			<div style="clear:left;">
				<div style="float: left;">
					<img src="./image/<%=vo.getLogoName()%>" width=225px; height=165px;>
				</div>
				<div class="content" style="float: left;">
					<a href="#" role="button"><b><%=vo.getComName()%></b></a>
					<p>근무지역</p>
					<p><%=vo.getWorkArea() %></p>
					<p>직무</p>
					<p><%=vo.getTask() %></p>
				</div>
				
				<div class="deadline">
					<p>접수마감</p>
					<p><%=vo.getOpeningDate().substring(10) %></p>
				</div>
			</div>
			<%}%>
		</div>
		
		
		<aside class="sideBar">
			<fieldset>
				<legend>사이드 메뉴</legend>
					<a href="javascript:" role="button">내 정보 관리</a>
					<a href="javascript:" role="button">이력서 관리</a>
					<a href="javascript:" role="button">관심기업 관리</a>
					<a href="javascript:" role="button">기업지원 현황</a>
			</fieldset>
		</aside>
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>