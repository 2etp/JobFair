<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("lgnName");
%>
<header>
	<section>
		<div class="header-img">
			<a href="index.jsp"><img src="image/logo.png"></a>
		</div>
		<nav class="header-navigation">
			<div>|</div>
			<a href="introduce.jsp">소개</a>
			<div>|</div>
			<a href="recruitment.jsp">채용관</a>
			<div>|</div>
		<% if(name == null) {%>
			<a href="signup.jsp">회원가입</a>
			<div>|</div>
			<a href="login.jsp">로그인</a>
			<div>|</div>
		<% } else { %> 
			<a href="myPageForDisability.jsp">마이페이지</a>
			<div>|</div>
			<a href="logout.jsp">로그아웃</a>
			<div>|</div>
		<% } %>
		</nav>
	</section>
</header>
