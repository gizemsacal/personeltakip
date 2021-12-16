<%@ page import="com.personeltakip.model.Department" %>
<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.model.Manager" %>
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
    <title>Departman Ekle / Güncelle </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <spring:url value="/department/addDepartment" var="addURL" /><br>
    <h2 align="center">Departman Ekle / Güncelle </h2><br>

    <form:form modelAttribute="departmentForm" method="post" action="${addURL}" cssClass="form" >

        <form:hidden path="id"/>

        <div class="form-outline mb-4">
            <label class="form-label" for="name">Departman Adı</label>
            <form:input path="name" cssClass="form-control" id="name" maxlength="30"/>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4"> Ekle/güncelle </button>
    </form:form>

</div>
</body>
</html>