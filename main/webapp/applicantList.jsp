<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.ApplicantListVO" %>
    
<%
	request.setCharacterEncoding("UTF-8");
//	int userNum = (int)session.getAttribute("lgnUserNum");
	int userNum = 1;
	//int comNum = (int) session.getAttribute("lgnComNum");
	int comNum = 1;
	
	
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
	
	List<ApplicantListVO> list = dao.getApplicantList(comNum, startRow, pageSize);
	int cnt = dao.getApplicantCount(comNum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 지원자 리스트</title>
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/applicantList.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<div class="title-div">
			<img src="image/applyList.png" aria-hidden="true" class="title-img">
			<p>지원자 리스트</p>
		</div>
		

		<table>
			<thead>
			<tr class="tr1">
				<th>제목</th>
				<th>지원자</th>
				<th>지원 날짜</th>
				<th>이력서</th>
			</tr>
			</thead>
			
		<%for(int i = 0; i < list.size(); i++) { 
			ApplicantListVO vo = list.get(i);%>
			<tbody>
			<tr class="tr2">
				<td><%=vo.getResumeTitle() %></td>
				<td><%=vo.getUserName() %></td>
				<td><%=vo.getRegiDate() %></td>
				<td><a href="myResume.jsp?resumeNum=<%=vo.getResumeNum()%>">
				<img src="./image/resumeList.png" alt="이력서 보기 이미지">이력서 보기</a></td>
			</tr>
			</tbody>
		<%}%>
		</table>
		
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<h3>가이드 메뉴</h3>
				<img src="image/guide.png" aria-hidden="true">
					<ul>
						<li><img src="./image/resume.png" aria-hidden="true">
							<a href="postJobOpening.jsp" role="button">채용공고 등록</a></li>
						<li><img src="./image/myPage.svg"  aria-hidden="true">
							<a href="myPageForGeneral.jsp" role="button">기업정보 관리</a></li>
						<li><img src="image/applyList.png" aria-hidden="true">
							<a href="applicantList.jsp" role="button">지원자 현황</a></li>
					</ul>
			</aside>
		</div> 
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>