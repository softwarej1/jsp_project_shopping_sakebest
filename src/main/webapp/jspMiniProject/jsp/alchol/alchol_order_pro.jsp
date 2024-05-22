<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="sake.sakeDAO" %>
    
    <%
    String id = request.getParameter("id");
    String no = request.getParameter("no");
    String ea = request.getParameter("ea");
    
    sakeDAO dao = new sakeDAO();
    
    String[] noAry = no.split("-");
    String[] eaAry = ea.split("-");
    int su = 0;
    
    for(int i=0; i<noAry.length; i++){
    	su = dao.payIns(id, noAry[i], eaAry[i]);
    }
    response.sendRedirect("./../../index.jsp");
    %>