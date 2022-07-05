<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO" />
<jsp:useBean id="vo" class="jobFairMgr.JobOpeningVO" />
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	// 채용공고 지원기간 데이터가공
	String startDate =  request.getParameter("jobOpeningStart");
	String endDate = request.getParameter("jobOpeningEnd");
	String year, month, day;
	
	// 시작 날짜
	year = startDate.substring(0, 4);
	month = startDate.substring(5, 7);
	day = startDate.substring(8);
	
	String frontDate = year + "." + month + "." + day;
	
	// 마감 날짜
	year = endDate.substring(0, 4);
	month = endDate.substring(5, 7);
	day = endDate.substring(8);
	
	String backDate = year + "." + month + "." + day;
	// 병합
	String openingDate = frontDate + " ~ " + backDate;
	

	vo.setComNum(Integer.parseInt(request.getParameter("comNum")));
	vo.setTitle(request.getParameter("title"));
	vo.setPosition(request.getParameter("position"));
	vo.setPeople(Integer.parseInt(request.getParameter("people")));
	vo.setTask(request.getParameter("task"));
	vo.setWorkArea(request.getParameter("workArea"));
	vo.setEducation(request.getParameter("education"));
	vo.setCareer(request.getParameter("career"));
	vo.setEmployType(request.getParameter("employType"));
	vo.setWorkType(request.getParameter("workType"));
	vo.setPay(request.getParameter("pay"));
	vo.setInsurance(request.getParameter("insurance"));
	vo.setOfficeHours(request.getParameter("officeHours"));
	vo.setEtc(request.getParameter("etc"));
	vo.setMajor(request.getParameter("major"));
	vo.setCertificate(request.getParameter("certificate"));
	vo.setComputerLevel(request.getParameter("certificate"));
	vo.setFacilities(request.getParameter("facilities"));
	vo.setWelfare(request.getParameter("welfare"));
	vo.setPreferred(request.getParameter("preferred"));
	vo.setOpeningDate(openingDate);
	vo.setOvertime(request.getParameter("overtime"));
	vo.setBonus(request.getParameter("bonus"));
	vo.setSeverancePay(request.getParameter("severancePay"));
	
	boolean flag = dao.insertJobOpening(vo);
	String url = "postJobOpening.jsp";
	String msg = "채용공고 등록에 실패했습니다. \\n 다시 시도해 주십시오";
	if(flag) {
		url = "recruitment.jsp";
		msg = "성공적으로 채용공고를 등록했습니다.";
	} 
%>
<script>
 	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
