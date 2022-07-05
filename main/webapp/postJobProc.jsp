<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO" />
<jsp:useBean id="vo" class="jobFairMgr.JobOpeningVO" />

<%
	request.setCharacterEncoding("UTF-8");
	vo.setComNum(Integer.parseInt(request.getParameter("comNum")));
	vo.setTitle(request.getParameter("title"));
	vo.setPosition(request.getParameter("postion"));
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
	vo.setOpeningDate(request.getParameter("openingDate"));
	vo.setOvertime(request.getParameter("overtime"));
	vo.setBonus(request.getParameter("bonus"));
	vo.setSeverancePay(request.getParameter("severancePay"));
	
%>