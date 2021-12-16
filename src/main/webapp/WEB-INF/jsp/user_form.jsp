<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.model.Manager" %>
<%@ page import="com.personeltakip.services.UserService" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user = (User) request.getSession().getAttribute("user");
    Manager manager = (Manager) request.getSession().getAttribute("manager");
    if (manager == null)
        response.sendRedirect("/employee_login");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Kullanıcı Ekle / Güncelle </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <spring:url value="/user/addUser" var="addURL" /><br>
    <h2 align="center">Kullanıcı Ekle / Güncelle </h2><br>
    <form:form name="form" modelAttribute="userForm" method="post" action="${addURL}" cssClass="form" >
        <!-- 2 column grid layout with text inputs for the first and last names -->
        <form:hidden path="id"/>
        <div class="form-outline mb-4">
            <label class="form-label" for="username">Kullanıcı Adı</label>
            <form:input path="username" cssClass="form-control" id="username" maxlength="20"/>
        </div>
        <!-- Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="password">Password</label>
            <form:input path="password" cssClass="form-control" id="password" maxlength="20"/>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4"> Ekle/güncelle </button>
    </form:form>

</div>
</body>
</html>