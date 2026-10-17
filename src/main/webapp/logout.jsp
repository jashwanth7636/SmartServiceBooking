<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
session.invalidate();   // destroy session
response.sendRedirect("login.jsp");  // go to login page
%>