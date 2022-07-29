<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String) request.getAttribute("msg");
	String location = (String) request.getAttribute("location");
	request.setAttribute("msg", msg);
	
	request.getRequestDispatcher(location).forward(request, response);
%>