<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("inputID");
	String item = request.getParameter("item");
	String url = "";
	
	
	// 아이디가 이미 존재하는지 체크하는 함수(이미 존재하면 true, 없으면 false를 반환)
	boolean flag = dao.isIdExist(id);
	url = "overlap.jsp?id=" + id + "\\&flag=" + flag;		
%>
    
<script>
	location.href = "<%=url%>";
</script>