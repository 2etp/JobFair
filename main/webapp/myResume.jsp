<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="jobFairMgr.DisabilityVO" />
<jsp:useBean id="rvo" class="jobFairMgr.ResumeVO" />
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<%@ page import="java.util.*" %>
<%@ page import="jobFairMgr.ResumeVO"%>

<%

	String name = (String)session.getAttribute("lgnName");
	vo = dao.getUser(name);
	String year = vo.getPrefixNum().substring(0, 4);
	String month = vo.getPrefixNum().substring(4, 6);
	String day = vo.getPrefixNum().substring(6);
	
	List<ResumeVO> rvoList = dao.getResumeList(vo.getUserNum());
	String resumeNum_str = request.getParameter("resumeNum");
	int resumeNum;
	
	if(resumeNum_str == null) {
		resumeNum = rvoList.get(0).getResumeNum();	// 최종적으로는 0을 디폴트로 resumeNum이 0이면 등록된 이력서가 없다고 띄움
	} else {
		resumeNum = Integer.parseInt(resumeNum_str);
	}
	rvo = dao.getResume(resumeNum);
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 관리</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/myResume.css">
<script defer src="js/myResume.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<details class="details-resume-list">
			<summary>
				<div><%=rvo.getTitle()%></div>
				<img src="image/downArrow.png" alt="아래 방향 화살표 이미지">
			</summary>
			<ul class="ul-resume-list">
				<%
					for(int i = 0; i < rvoList.size(); i++) { 
					ResumeVO eachVO = rvoList.get(i);%>
						<li class="details-resume-list-item"><a href="myResume.jsp?resumeNum=<%=eachVO.getResumeNum()%>">
						<%=eachVO.getTitle()%></a></li>
					<%}%>
			</ul>
		</details>
		<div class="div-caption">
			<img src="./image/resume.png" alt="이력서 이미지">
			<p>이력서</p>
		</div>
			<div class="div-table">
			<table class="table1" id="table">
				<tr class="tr1">
					<td rowspan="4"><!-- 증명사진 -->
					<img src="./image/<%=rvo.getFileName()%>" width=150px height=165px>
					</td>
					<th>성명</th>
					<td><%=vo.getName()%></td>
					<th>성별</th>
					<td><%=vo.getSex()%></td>
				</tr>
				
				<tr class="tr2">
					<th>연락처</th>
					<td><%=vo.getPhoneNum()%></td>
					<th>생년월일</th>
					<td><%=year%>.<%=month%>.<%=day%></td>
				</tr>
				
				<tr class="tr3">
					<th>주소</th>
					<td colspan="3"><%=vo.getLivingArea()%></td>		
				</tr>
				
				<tr class="tr4">
					<th>병역</th>
					<td colspan="3">
						<%=rvo.getMilitaryService()%>
					</td>
				</tr>
				
				<tr class="tr5">
					<th>장애유형</th>
					<td><%=vo.getDisType()%></td>
					<th>보장구 유/무</th>
					<td colspan="2">
						<%=rvo.getAssistive()%>
					</td>
				</tr>
				
				<tr class="tr6">
					<th>장애등급</th>
					<td><%=vo.getDisLevel()%></td>
					<th>보장구 종류</th>
					<td colspan="2">
						<%=rvo.getAssistiveDevice() %>
					</td>
				</tr>
				
				<tr class="tr7">
					<th rowspan="2">최종학력</th>
					<td><%=rvo.getSchoolName()%></td>
					<td rowspan="2" colspan="3">
						<%=rvo.getEducation() %>
					</td>
				</tr>
				
				<tr class="tr8">
					<td><%=rvo.getMajor()%></td>
				</tr>
				
			</table>
				
			<table class="table2" id="mytable2">
				<tr class="tr10">
					<th rowspan="4">경력<br> 및<br> 교육사항</th>
					<th>사업체명 및 교육기관</th>
					<th>기간</th>
					<th>담당업무 및 교육내용</th>
					<th colspan="2">비고</th>
				</tr>
				
				<tr class="tr11">
					<td><%=rvo.getInstitutionName1()%></td>
					<td><%=rvo.getPeriod1()%></td>
					<td><%=rvo.getContent1()%></td>
					<td colspan="2"><%=rvo.getNote1()%></td>
				</tr>
							
				<tr class="tr12">
					<td><%=rvo.getInstitutionName2()%></td>
					<td><%=rvo.getPeriod2()%></td>
					<td><%=rvo.getContent2()%></td>
					<td colspan="2"><%=rvo.getNote2()%></td>
				</tr>
				
				<tr class="tr13">
					<td><%=rvo.getInstitutionName3()%></td>
					<td><%=rvo.getPeriod3()%></td>
					<td><%=rvo.getContent3()%></td>
					<td colspan="2"><%=rvo.getNote3()%></td>
				</tr>
			</table>
				
			<table class="table3" id="mytable3">
				<tr class="tr15">
					<th rowspan="4" style="border-bottom-left-radius: 19px;">자격면허</th>
					<th>자격종목</th>
					<th>급수</th>
					<th>등록번호</th>
					<th>발행처</th>
					<th>발급일자</th>
				</tr>
				
				<tr class="tr16">
					<td><%=rvo.getCertificate1()%></td>
					<td><%=rvo.getCertificateNum1()%></td>
					<td><%=rvo.getRegistration1()%></td>
					<td><%=rvo.getIssuer1()%></td>
					<td><%=rvo.getIssueDate1()%></td>
				</tr>
				
				<tr class="tr17">
					<td><%=rvo.getCertificate2()%></td>
					<td><%=rvo.getCertificateNum2()%></td>
					<td><%=rvo.getRegistration2()%></td>
					<td><%=rvo.getIssuer2()%></td>
					<td><%=rvo.getIssueDate2()%></td>
				</tr>
				
				<tr class="tr18">
					<td><%=rvo.getCertificate3()%></td>
					<td><%=rvo.getCertificateNum3()%></td>
					<td><%=rvo.getRegistration3()%></td>
					<td><%=rvo.getIssuer3()%></td>
					<td><%=rvo.getIssueDate3()%></td>
				</tr>
			</table>
			</div>
			
			<div class="div-sideNav">
				<aside id="sideNav" role="navigation">
					<h3>가이드 메뉴</h3>
					<img src="image/guide.png" aria-hidden="true">
					<ul>
						<li><img src="./image/resume.png" aria-hidden="true">
							<a href="postResume.jsp" role="button">이력서 작성</a></li>
						<li><img src="./image/myPage.svg"  aria-hidden="true">
							<a href="myPageForDisability.jsp" role="button">내 정보 관리</a></li>
						<li><img src="./image/myResume.png" aria-hidden="true">
							<a href="myResume.jsp" role="button">이력서 관리</a></li>
						<li><img src="image/bookmark_on.svg" aria-hidden="true">
							<a href="pickedList.jsp" role="button">관심 채용공고</a></li>
						<li><img src="image/applyList.png" aria-hidden="true">
							<a href="applyList.jsp" role="button">기업지원 현황</a></li>
					</ul>
				</aside>
			</div> 
	</section>	
</main>
<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>