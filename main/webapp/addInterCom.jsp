<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />

<%
	int userNum = Integer.parseInt(request.getParameter("user"));
	int employNum = Integer.parseInt(request.getParameter("employNum"));
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	
	if(!flag) {
		dao.addInterCom(employNum, userNum);		
	} else {
		dao.deleteInterCom(employNum, userNum);
	}
	
%>
<script>
	location.href="recruitmentDetail.jsp?employNum=<%=employNum%>";
</script>