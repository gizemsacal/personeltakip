<%@ page import="com.personeltakip.model.Employee" %>
<%@ page import="com.personeltakip.services.EmployeeService" %>
<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.model.Manager" %>
<%@ page import="com.personeltakip.services.UserService" %>
<%@ page import="com.personeltakip.model.Department" %>
<%@ page import="com.personeltakip.services.DepartmentService" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user = (User) request.getSession().getAttribute("user");
    Manager manager = (Manager) request.getSession().getAttribute("manager");
/*    if (manager == null)
        response.sendRedirect("/employee_login");*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Personel Ekle / Güncelle </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <spring:url value="/employee/addEmployee" var="addURL" /><br>
    <h2 align="center">Personel Ekle / Güncelle </h2><br>
    <form:form name="form" modelAttribute="employeeForm" method="post" action="${addURL}" cssClass="form" >
        <!-- 2 column grid layout with text inputs for the first and last names -->
        <form:hidden path="id"/>
        <div class="form-group">

            <label>Kullanıcı Adı</label>

            <form:select path = "user" id = "user" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
                <form:options items = "${userList}" itemLabel="username"/>

            </form:select>

            <div class="form-group">

            <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <label class="form-label" for="firstname">İsim</label>
                    <form:input path="firstname" cssClass="form-control" id="firstname" maxlength="30"/>
                </div>
            </div>
            <div class="col">
                <div class="form-outline">
                    <label class="form-label" for="lastname">Soyisim</label>
                    <form:input path="lastname" cssClass="form-control" id="lastname" maxlength="30"/>
                </div>
            </div>
        </div>

        <!-- Email input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="email">Email</label>
            <form:input path="email" cssClass="form-control" id="email" maxlength="50"/>
        </div>

        <!-- Number input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="phone">Telefon</label>
            <form:input path="phone" type="number" cssClass="form-control" id="phone" maxlength="20"/>
        </div>

        <div class="form-outline mb-4">
            <label class="form-label" for="gender">Cinsiyet</label>
            <form:select path = "gender" id = "gender" cssClass="form-control">
                <form:option value = "K" label = "Kadın" />
                <form:option value = "E" label = "Erkek" />
            </form:select>
        </div>

        <div class="form-outline mb-4">
            <label class="form-label" for="birthday">Doğum Tarihi</label>
            <form:input path="birthday" type="date" cssClass="form-control"  id="birthday"/>
        </div>

        <div class="form-outline mb-4">
            <label class="form-label" for="department">Departman</label>
            <form:select path = "department" id = "department" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Departman Seçiniz" />
                <form:options items = "${departmentList}" itemLabel="name"/>

            </form:select>

        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4"> Ekle/güncelle </button>
    </form:form>

</div>
</body>
</html>