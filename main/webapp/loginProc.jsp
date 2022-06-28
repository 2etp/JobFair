<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO"/>

<%
	// 로그인 대상이 기업인지 개인인지 item으로 구분
//	String item = request.getParameter("item");
	String name = request.getParameter("name");
	String phoneNum = request.getParameter("mobile");
	
//	if(itme.equlas(""))
	int num = dao.login(name, phoneNum);
	String url = "login.jsp";
	String msg = "";
	
	switch(num) {
	case 1: msg = "아이디가 없습니다.";
		break;
	case 2: msg = "비밀번호가 일치하지 않습니다.";
		break;
	case 3: {
		msg = "로그인에 성공하였습니다.\\n" + name + "님 환영합니다!";
		url = "myPage.jsp";
		session.setAttribute("lgnName", name);
		break;
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>


