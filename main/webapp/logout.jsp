<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%
	session.invalidate();
	
%>

<script>
	window.sessionStorage.setItem("godabi", "null");
	alert("로그아웃 되었습니다.");
	document.location = "index.jsp"
</script>