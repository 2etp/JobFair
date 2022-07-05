<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("lgnName");
	boolean flag = false;
	if(name != null) {
		flag = dao.isCompany(name);
	}

%>
<script defer src="js/header.js"></script>
<header>
	<section>
		<div class="header-img">
			<div>
				<a href="index.jsp">
					<img src="image/logo.png">
				</a>
			</div>
			<div class="header-godaebi">
				<label class="switch">
				  	<input type="checkbox">
				  	<span class="slider round"></span>
				</label>
				<p class="p-godaebi">꺼짐</p>
			</div>
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
		<% } else { 
			if(flag) {%>
				<a href="myPageForGeneral.jsp" id="signUp">마이페이지</a>						
			<%} else {%>
				<a href="myPageForDisability.jsp" id="signUp">마이페이지</a>
			<%}%>
			<div>|</div>
			<a href="logout.jsp">로그아웃</a>
			<div>|</div>
		<% } %>
		</nav>
	</section>
</header>

