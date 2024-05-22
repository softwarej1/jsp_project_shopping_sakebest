<%@page import="sake.reviewDTO"%>
<%@page import="sake.sakeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="sakeDAO" class="sake.sakeDAO" />
<jsp:useBean id="reviewDTO" class="sake.reviewDTO" />
<jsp:setProperty name="reviewDTO" property="*" />

<% 
	int su = sakeDAO.reviewUpd(reviewDTO);
	
	if(su != 0){
		response.sendRedirect("./../index.jsp");
	}


%>

<!--  -->