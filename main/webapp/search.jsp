<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.generalDAO" />
<%
	request.setCharacterEncoding("UTF-8");
	String companyName = request.getParameter("companyName");
	String sectors = request.getParameter("sectors");
	String workArea = request.getParameter("workArea");
	String workType = request.getParameter("workType");
	
	// 입력받지 않은 데이터 처리
	if(companyName.equals("")) companyName = null;
	if(sectors.equals("sectors")) sectors = null;
	if(workArea.equals("workArea")) workArea = null;
	if(workType.equals("workType")) workType = null;

	
%>

<html>
<body>
	<div>
		<p><%=companyName %></p>
		<p><%=sectors %></p>
		<p><%=workArea %></p>
		<p><%=workType %></p>
	</div>
</body>
</html>