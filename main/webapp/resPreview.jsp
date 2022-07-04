<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="jobFairMgr.DisabilityVO" />
<jsp:useBean id="rvo" class="jobFairMgr.ResumeVO" />
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<jsp:useBean id="gdao" class="jobFairMgr.GeneralDAO" />
<%@ page import="java.util.*" %>
<%@ page import="jobFairMgr.ResumeVO"%>

<%
	String name = (String)session.getAttribute("lgnName");
	//String name = "tom";
	if(name==null || !gdao.isCompany(name)){ //미로그인 또는 기업이 아닌 경우(본인 이력서가 아닌 경우에도 막으려했으나 고민중)
%>
<script>
	locaion.href = "index.jsp";
	alert("접근 권한이 없습니다.");
</script>
<%
	}else{
		String resumeNum_str = request.getParameter("resumeNum");
//		String resumeNum_str = "1";
//		String userName = request.getParameter("userName");
//		String userName = "tom";
		int resumeNum;
		
		if(resumeNum_str == null) {
%>
<script>
	locaion.href = "index.jsp";
	alert("이력서가 존재하지 않습니다.");
</script>
<%
		} else {
			resumeNum = Integer.parseInt(resumeNum_str);
			rvo = dao.getResume(resumeNum);
			vo = dao.getUser(rvo.getUserNum());
			String year = vo.getPrefixNum().substring(0, 4);
			String month = vo.getPrefixNum().substring(4, 6);
			String day = vo.getPrefixNum().substring(6);
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
</body>
</html>
<%}
}%>