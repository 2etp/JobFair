<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.generalDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.OpeningListVO" %>


<%
	request.setCharacterEncoding("UTF-8");
	// 전체 채용공고를 보는 것인지, 검색해서 나온 채용공고를 보는것인지
	String pageType = request.getParameter("pageType");
	if(pageType == null) {
	    pageType = "default";
	}
	
	List<OpeningListVO> list = new ArrayList<OpeningListVO>();
	int cnt = 0;
	
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
	
	
	String item = null;
	String companyName = null;
	String sectors = null;
	String workArea = null;
	String workType = null;
	// 검색해서 나온 채용공고를 볼 경우
	if(pageType.equals("search")) {
		// 기업명으로 검색했는지, 다른 조건으로 검색했는지
		item = request.getParameter("item");
		if(item.equals("name")) {
			// 기업명으로 검색했을 경우
			companyName = request.getParameter("companyName");
			// 기업명이 공백인채 검색헀다면 평소와 같게 모든 채용공고 출력
			if(companyName.equals("")) {
				list = dao.getOpeningList(startRow, pageSize);
				cnt = dao.getOpeningCount();
				
			} else{
				list = dao.getSearchName(companyName, startRow, pageSize);
				cnt = dao.getSearchNameCount(companyName);
			}
			
		} else if(item.equals("other")) {
			// 다른조건으로 검색했을 경우
			sectors = request.getParameter("sectors");
			workArea = request.getParameter("workArea");
			workType = request.getParameter("workType");
			
			if(sectors.equals("sectors")) sectors = "";
			if(workArea.equals("workArea")) workArea = "";
			if(workType.equals("workType")) workType = "";
			
			list = dao.getSearchOther(sectors, workArea, workType, startRow, pageSize);
			cnt = dao.getSearchOtherCount(sectors, workArea, workType);
		}
		
	} 
	// 검색으로 보는 경우가 아닐 때
	else {
		list = dao.getOpeningList(startRow, pageSize);
		cnt = dao.getOpeningCount();
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용관</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/recruitment.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<div>
		<section>
			<form name="searchFrm" method="post" action="search.jsp">
				<div class="div-search">
					<img src="./image/search.svg" alt="검색 이미지">
					<input id="companyName" type="text" name="companyName" placeholder="기업명을 입력하세요" title="기업명" value="">
					<a id="submit-button" href="javascript:" role="button"
					 onclick="searchName()">검색</a>
				</div>
				<div>
					<select id="sectors" name="sectors" title="직종">
						<option value="sectors" selected>직종</option>
						<option value="제조업">제조업</option>
						<option value="서비스">서비스</option>
						<option value="도소매업">도소매업</option>
						<option value="보건업">보건업</option>
						<option value="숙박업">숙박업</option>
						<option value="사회복지">사회복지</option>
						<option value="교욱서비스업">교욱 서비스업</option>
						<option value="외식업">외식업</option>
					</select>
					<select id="workArea" name="workArea" title="근무지역">
						<option value="workArea" selected>근무지역</option>
						<option value="강서구">강서구</option>
						<option value="금정구">금정구</option>
						<option value="기장군">기장군</option>
						<option value="남구">남구</option>
						<option value="동구">동구</option>
						<option value="동래구">동래구</option>
						<option value="부산진구">부산진구</option>
						<option value="북구">북구</option>
						<option value="사상구">사상구</option>
						<option value="사하구">사하구</option>
						<option value="서구">서구</option>
						<option value="수영구">수영구</option>
						<option value="연제구">연제구</option>
						<option value="영도구">영도구</option>
						<option value="해운대구">해운대구</option>
						<option value="김해시">김해시</option>
					</select>
					<select id="workType" name="workType" title="근무형태">
						<option value="workType" selected>근무형태</option>
						<option value="주5일">주5일</option>
						<option value="주3~4일">주3~4일</option>
						<option value="협의">협의</option>	
					</select>
					<a id="submit-button" href="javascript:" role="button" 
					onclick="searchOther()">검색</a>
				</div>
			</form>		
		</section>
		
		<script>
		<%if(pageType.equals("search")) { 
			if(item.equals("name")){%>
				const comNameField = $("#companyName");
				comNameField.prop("value",'<%=companyName%>');
			<%}else if(item.equals("other")){%>
				const sectorsField = $("#sectors");
				const workAreaField = $("#workArea");
				const workTypeField = $("#workType");
				let sectors = 'sectors';
				let workArea = 'workArea';
				let workType = 'workType';
				<%if(!sectors.equals("")){%>
					sectors = '<%=sectors%>';
				<%}if(!workArea.equals("")){%>
					workArea = '<%=workArea%>';
				<%}if(!workType.equals("")){%>
					workType = '<%=workType%>';
				<%}%>
				sectorsField.val(sectors).prop("selected",true);
				workAreaField.val(workArea).prop("selected",true);
				workTypeField.val(workType).prop("selected",true);
			<%}%>
		<%} %>
		</script>
		
		<section>
			<div class="div-list">
				<img src="./image/building.png" alt="건물이미지">
				<p>참여기업 리스트</p>
			</div>
			<!-- 채용공고 리스트 -->
			<div>
				<%for(int i = 0; i < list.size(); i++) { 
					OpeningListVO vo = list.get(i);%>
					<div class="div-frame"><!-- 로고 이미지 -->
						<div class="company-image">
							<img alt="로고 이미지" src="./image/<%=vo.getLogoName()%>" width="200px" height="150px"><br>
						</div>
						<div class="company-contents"> <!-- 채용글 -->
							<a href="recruitmentDetail.jsp?employNum=<%=vo.getEmployNum()%>" role="button"><%=vo.getComName() %></a>
							<p><span>근무지역</span> <%=vo.getWorkArea() %></p>
							<p><span>직무</span> <%=vo.getTask() %></p>
							<p>지원기간 | <%=vo.getOpeningDate() %></p>
						</div>
					</div>
				<% }%>
			</div>
		</section>
		<section>
			<!-- 게시글 페이징 -->
			<div class="div-boardpaging">
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
		    			if(pageType.equals("default")) {
				    		if(startPage > pageBlock) { %>
				    			<a href="recruitment.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
				    		<%}
			    			// 몇번 페이지로 갈 것인지 번호를 a태그로 생성
			    			for(int i = startPage; i <= endPage; i++) { %>
			    				<a href="recruitment.jsp?pageNum=<%=i%>"><%=i %></a>
			    			<%}
			    			
			    			// 10페이지 건너뛰는 버튼
			    			// 남은 페이지가 10 이하라면 다음으로 가는 버튼을 만들 필요가 없다.
			    			if(endPage < pageCnt) { %>
			    				<a href="recruitment.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
			    			<%}
		    			} else {
		    				// 검색했을 경우 페이징 번호에 다른 url을 붙여줘야한다.
		    				item = request.getParameter("item");
		    				companyName = request.getParameter("companyName");
		    				if(item.equals("name")) {
		    					// 기업명으로 검색했을 경우
		    					if(startPage > pageBlock) { %>
				    				<a href="recruitment.jsp?pageNum=<%=startPage - pageBlock%>&companyName=<%=companyName%>&pageType=search&item=name">이전</a>
					    		<%}
				    			for(int i = startPage; i <= endPage; i++) { %>
				    				<a href="recruitment.jsp?pageNum=<%=i%>&companyName=<%=companyName%>&pageType=search&item=name"><%=i %></a>
				    			<%}
				    			if(endPage < pageCnt) { %>
				    				<a href="recruitment.jsp?pageNum=<%=startPage + pageBlock%>&companyName=<%=companyName%>&pageType=search&item=name">다음</a>
				    			<%}
			    			} else if(item.equals("other")) {
			    				sectors = request.getParameter("sectors");
			    				workArea = request.getParameter("workArea");
			    				workType = request.getParameter("workType");
			    				
			    				if(startPage > pageBlock) { %>
				    				<a href="recruitment.jsp?pageNum=<%=startPage - pageBlock%>&sectors=<%=sectors%>&workArea=<%=workArea%>&workType=<%=workType%>&pageType=search&item=other">이전</a>
					    		<%}
				    			for(int i = startPage; i <= endPage; i++) { %>
				    				<a href="recruitment.jsp?pageNum=<%=i%>&sectors=<%=sectors%>&workArea=<%=workArea%>&workType=<%=workType%>&pageType=search&item=other"><%=i %></a>
				    			<%}
				    			if(endPage < pageCnt) { %>
				    				<a href="recruitment.jsp?pageNum=<%=startPage + pageBlock%>&sectors=<%=sectors%>&workArea=<%=workArea%>&workType=<%=workType%>&pageType=search&item=other">다음</a>
				    			<%}
			    				
			    			}
		    			}
		    		}
				%>
			 </div>				
		</section>
	</div>
</main>

<jsp:include page="commonJSP/footer.jsp"/>
<script>
	function searchName() {
		let companyName = document.getElementById("companyName").value;
		location.href="recruitment.jsp?companyName=" + companyName + "\&item=name\&pageType=search";
	}
	
	function searchOther() {
		let sectors = document.getElementById("sectors").value;
		let workArea = document.getElementById("workArea").value;
		let workType = document.getElementById("workType").value;
		location.href="recruitment.jsp?sectors=" + sectors + "\&workArea=" + workArea + "\&workType=" + workType + "\&item=other\&pageType=search";
	}
</script>
</body>
</html>