<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO" />
<jsp:useBean id="gvo" class="jobFairMgr.GeneralVO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.ApplicantListVO" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	//int userNum = (int)session.getAttribute("lgnUserNum");
	//int userNum = 1;
	String comName = (String)session.getAttribute("lgnName");
	gvo = dao.getGeneral(comName);
	//int comNum = 1;
	
	
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
	
	List<ApplicantListVO> list = dao.getApplicantList(gvo.getComNum(), startRow, pageSize);
	int cnt = dao.getApplicantCount(gvo.getComNum());
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
			<img src="image/list.svg" aria-hidden="true" class="title-img">
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
                <td><a href="resPreview.jsp?resumeNum=<%=vo.getResumeNum()%>" 
                		onClick="window.open(this.href, '', 'width=820, height=800'); return false;">
                	<img src="./image/resume.svg" aria-hidden="true">이력서 보기</a></td>
			</tr>
			</tbody>
        <%}%>
		</table>
		
		<!-- 게시글 페이징 -->
		<div class="applyList-paging">
		 	<%
	    		if(cnt != 0) {
	    			// 전체 페이지 수 계산
	    			int pageCnt = cnt / pageSize + (cnt%pageSize == 0 ? 0 : 1);
	    			// 한 페이지에 보여줄 페이지 번호 개수
	    			int pageBlock = 10;
	    			// 시작하는 페이지 번호  ex) 1, 11, 21...
	    			int startPage = ((currentPage-1) / pageBlock) * pageBlock + 1;
	    			// 끝나는 페이지 번호
	    			int endPage = startPage + pageBlock-1;
	    			
	    			if(endPage > pageCnt) {
	    				endPage = pageCnt;
	    			}
	    			
	    			// 10페이지 이전으로 가는 버튼
	    			// 시작페이지가 11이상이 아니면 이전 버튼을 만들 필요가 없다. 
		    		if(startPage > pageBlock) { %>
		    			<a href="applyList.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
		    		<%}
	    			// 몇번 페이지로 갈 것인지 번호를 a태그로 생성
	    			for(int i = startPage; i <= endPage; i++) { %>
	    				<a href="applyList.jsp?pageNum=<%=i%>"><%=i %></a>
	    			<%}
	    			
	    			// 10페이지 건너뛰는 버튼
	    			// 남은 페이지가 10 이하라면 다음으로 가는 버튼을 만들 필요가 없다.
	    			if(endPage < pageCnt) { %>
	    				<a href="applyList.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
	    			<%}
	    		}
			%>
		</div>
		
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<h3>마이페이지 메뉴</h3>
					<ul>
						<li><a href="myPageForGeneral.jsp" >
							<img src="./image/account.svg"  aria-hidden="true">
							기업정보 관리</a></li>
						<li><a href="postJobOpening.jsp" >
							<img src="./image/write_res.svg" aria-hidden="true">
							채용공고 등록</a></li>
						<li><a href="applicantList.jsp" >
							<img src="image/list.svg" aria-hidden="true">
							지원자 현황</a></li>
					</ul>
			</aside>
		</div> 
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>