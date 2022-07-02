<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO"/>
<jsp:useBean id="gdao" class="jobFairMgr.GeneralDAO"/>
<jsp:useBean id="vo" class="jobFairMgr.GeneralVO"/>

<%
	// 로그인 대상이 기업인지 개인인지 item으로 구분
	String item = request.getParameter("item");
	String name = request.getParameter("name");
	String phoneNum = request.getParameter("mobile");
	int num = 0;

	if(item.equals("dis")) {
		num = dao.login(name, phoneNum);
	} else if(item.equals("com")) {
		num = gdao.login(name, phoneNum);
	}
	
	String url = "login.jsp";
	String msg = "";
	
	switch(num) {
	case 1: 
		if(item.equals("dis")) {
			msg = "일치하는 이름이 없습니다.";
		} else{
			msg = "아이디가 없습니다.";
		}
		break;
	case 2: 
		if(item.equals("dis")) {
			msg = "휴대폰번호가 일치하지 않습니다.";
		} else{
			msg = "비밀번호가 일치하지 않습니다.";
		}
		break;
	case 3: {
		if(item.equals("dis")) {
			url = "myPageForDisability.jsp";			
		} else if(item.equals("com")) {
			url = "index.jsp";
			name = gdao.getComName(name);
		}
		
		msg = "로그인에 성공하였습니다.\\n" + name + "님 환영합니다!";
		session.setAttribute("lgnName", name);
		break;
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>


