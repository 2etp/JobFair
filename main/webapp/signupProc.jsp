<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="jobFairMgr.DisabilityDAO" />
<jsp:useBean id="gdao" class="jobFairMgr.generalDAO" />
<jsp:useBean id="vo" class="jobFairMgr.DisabilityVO" />
<jsp:useBean id="gvo" class="jobFairMgr.generalVO" />
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String msg = "회원가입에 실패했습니다";
	String url = "";
	
	if(type.equals("Disability")) {
		// 개인으로 회원가입 할 경우
		url = "signupForDisability.jsp";
		
		vo.setName(request.getParameter("name"));
		vo.setPrefixNum(request.getParameter("prefixNum"));
		vo.setSuffixNum(request.getParameter("suffixNum"));
		vo.setPhoneNum(request.getParameter("mobile"));
		vo.setDisType(request.getParameter("type"));
		vo.setDisLevel(request.getParameter("grade"));
		vo.setLivingArea(request.getParameter("livingArea"));
		
		boolean flag = dao.insertUser(vo);
		if(flag){
			msg = "회원가입에 성공했습니다..";
			url = "login.jsp";
		}
	}  else {
		// 기업으로 회원가입 할 경우
		url = "signupForGeneral.jsp";
		
		gvo.setComName(request.getParameter(""));
	}
%>
<script>
 	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>