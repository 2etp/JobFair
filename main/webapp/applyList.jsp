<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.ApplyListVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	//int userNum = (int)session.getAttribute("lgnUserNum");
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
	
	List<ApplyListVO> list = dao.getApplyList(userNum, startRow, pageSize);
	int cnt = dao.getApplyCount(userNum);

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 기업지원 현황</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/applyList.css">
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<div class="div-list">
			<img src="./image/building.png" alt="건물이미지">
			<p>기업지원 현황</p>
		</div>
		<div class="applyList">
			<%for(int i = 0; i < list.size(); i++) { 
				ApplyListVO vo = list.get(i);%>
				<div class="applyList-item">
					<div class="applyList-item-img">
						<img src="./image/<%=vo.getLogoName()%>">
					</div>
					<div class="content" >
						<a href="#" role="button"><%=vo.getComName()%></a>
						<p><%=vo.getTask() %></p>
						<img src="./image/resume.png" alt="이력서 이미지">
						<a href="javascript:" role="button">지원한 이력서</a>
					</div>
					<div class="progress">
						<p>진행현황</p>
						<p>서류합격</p>
						<a href="javascript:" role="button">지원취소</a>
					</div>
					<div class="dueDate">
						<p>마감</p>
						<p><%=vo.getOpeningDate().substring(10) %></p>
					</div>
				</div><!-- 지원공고 1줄 끝 -->
			<% }%>
		</div>
		
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