<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp"); //로그아웃이후 index페이지 호출
%>