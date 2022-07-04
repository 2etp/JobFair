<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.GeneralDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("lgnName");
	boolean flag = false;
	if(name != null) {
		flag = dao.isCompany(name);
	}

	String godabi = (String)session.getAttribute("godabi");
%>
<script defer src="js/header.js?godabi=<%=godabi%>"></script>
<header>
	<p><%=session.getAttribute("godabi")%></p>
	<section>
		<div class="header-img">
			<div>
				<a href="index.jsp">
					<img src="image/logo.png">
				</a>
			</div>
			<div class="header-godaebi">
				<% if(godabi == null) {%>
				<label class="switch">
				  	<input type="checkbox">
				  	<span class="slider round"></span>
				</label>
				<p class="p-godaebi">고대비 OFF</p>
				<% } else { %>
				<label class="switch">
				  	<input type="checkbox" checked>
				  	<span class="slider round"></span>
				</label>
				<p class="p-godaebi">고대비 ON</p>
				<% } %>
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
<script>
	let inputEl = document.querySelector(".header-godaebi input");
	inputEl.addEventListener("change", function(){
		
		let htmlEl = document.querySelector("html");
		let pEl = document.querySelector(".p-godaebi");
		
		//고대비 활성화
		if(inputEl.checked == true)
		{
			//offEl.style.display = "none";
			//onEl.style.display = "inline-block";
			<%session.setAttribute("godabi",1);%>
			pEl.innerHTML = "고대비 ON"
			htmlEl.classList.add("godabiON");
			
			
		}
		//고대비 비활성화
		else
		{
			//offEl.style.display = "inline-block";
			//onEl.style.display = "none";
			<%session.setAttribute("godabi",null);%>
			htmlEl.classList.remove("godabiON");
			pEl.innerHTML = "고대비 OFF"
			
		}
	})
</script>
