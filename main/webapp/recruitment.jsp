<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.generalDAO" />
<%@ page import = "java.util.*" %>
<%@ page import = "jobFairMgr.OpeningListVO" %>


<%
	List<OpeningListVO> list = dao.getOpeningList();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용관</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main style="display: block; margin:auto">
	<section>
		<form name="searchFrm" method="post" action="recruitmentProc.jsp">
			<input type="text" name="companyName" placeholder="기업명을 입력하세요">
			<a href="javascript:" role="button">검색</a>
			
			<select name="firstSection">
				<option value="businessClass" selected>기업체구분</option>
				<option value="general">일반기업</option>
				<option value="disabledStandard">장애인표준사업장</option>
				<option value="rehabilitationFacility">장애인직업재활시설</option>
				<option value="socialEnterprise">사회적경제기업</option>
			</select>
			
			<select name="secondSection">
				<option value="categoryOfOccupation" selected>직종</option>
				<option value="general">제조업</option>
				<option value="disabledStandard">서비스</option>
				<option value="rehabilitationFacility">전문, 과학서비스업</option>
				<option value="socialEnterprise">도소매업</option>
				<option value="socialEnterprise">보건업</option>
				<option value="socialEnterprise">숙박업</option>
				<option value="socialEnterprise">사회복지, 노인의료복지</option>
				<option value="socialEnterprise">교욱 서비스업</option>
				<option value="socialEnterprise">숙박 및 음식점업</option>
			</select>
			
			<select name="thirdSection">
				<option value="workArea" selected>근무지역</option>
				<option value="gangseogu">강서구</option>
				<option value="geumjeonggu">금정구</option>
				<option value="gijanggun">기장군</option>
				<option value="namgu">남구</option>
				<option value="donggu">동구</option>
				<option value="dongnaegu">동래구</option>
				<option value="busanjingu">부산진구</option>
				<option value="bukgu">북구</option>
				<option value="sasanggu">사상구</option>
				<option value="sahagu">사하구</option>
				<option value="seogu">서구</option>
				<option value="suyeonggu">수영구</option>
				<option value="yeonjegu">연제구</option>
				<option value="yeongdogu">영도구</option>
				<option value="haeundae">해운대구</option>
				<option value="gimhaesi">김해시</option>
			</select>
			
			<select name="fourthSection">
				<option value="workType" selected>근무형태</option>
				<option value="fiveDays">주5일</option>
				<option value="fourDays">주3~4일</option>
				<option value="discussion">협의</option>	
			</select>
			
			<select name="fifthSection">
				<option value="preferred" selected>우대사항</option>
				<option value="young">청년층</option>
				<option value="female">여성층</option>
				<option value="senior">장년층</option>	
				<option value="old">장년(고령자)</option>	
				<option value="nearby">인근거주자</option>	
				<option value="driving">운전가능자</option>	
				<option value="vehicle">차량소지자</option>	
			</select>
			
			<a href="javascript:" role="button">검색</a>
		</form>
	</section>
	<!-- 채용공고 리스트 -->
	<div>
		<%for(int i = 0; i < list.size(); i++) { 
			OpeningListVO vo = list.get(i);%>
			<div style="height:150px; margin-top: 20px; padding-bottom:20px; border-bottom: 1px solid gray;"><!-- 로고 이미지 -->
				<div style="float: left; margin-right: 40px;">
					<img alt="로고 이미지" src="./image/<%=vo.getLogoName()%>" width="200px" height="150px"><br>
				</div>
				<div style="float: left; height:150px;"> <!-- 채용글 -->
					<p><%=vo.getComName() %></p>
					<p>근무지역 : <%=vo.getWorkArea() %></p>
					<p>직무 : <%=vo.getTask() %></p>
					<p>지원기간 : <%=vo.getOpeningDate() %></p>
				</div>
			</div>
		<% }%>
	</div>
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>