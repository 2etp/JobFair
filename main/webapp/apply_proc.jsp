<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<jsp:useBean id="vo" class="jobFairMgr.ApplyVO" />

<%
	int userNum = Integer.parseInt(request.getParameter("user"));
	int employNum = Integer.parseInt(request.getParameter("employNum"));
	int resumeNum = Integer.parseInt(request.getParameter("resume"));
	
	vo.setUserNum(userNum);
	vo.setEmployNum(employNum);
	vo.setResumeNum(resumeNum);
	
	String url = "recruitmentDetail.jsp?employNum=" + Integer.toString(employNum);
	String msg = "채용공고 지원에 실패했습니다. \\n 다시 시도해 주십시오.";
	
	boolean flag = dao.apply(vo);
	if(flag) {
		msg = "성공적으로 지원했습니다. \\n좋은 결과가 있기를 바랍니다.";
		url = "recruitment.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
