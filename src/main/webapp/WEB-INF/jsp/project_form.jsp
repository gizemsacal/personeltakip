<%@ page import="com.personeltakip.model.Project" %>
<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.services.ProjectService" %>
<%@ page import="com.personeltakip.model.Department" %>
<%@ page import="com.personeltakip.model.Manager" %>
<%@ page import="com.personeltakip.model.Employee" %>
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
    <title>Proje Oluştur / Güncelle </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <spring:url value="/project/addProject" var="addURL" /><br>
    <h2 align="center">Proje Oluştur / Güncelle </h2><br>
    <form:form name="form" modelAttribute="projectForm" method="post" action="${addURL}" cssClass="form" >

        <form:hidden path="id"/>

        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <label class="form-label" for="name">İsim</label>
                    <form:input path="name" cssClass="form-control" id="name" maxlength="60"/>
                </div>
            </div>
        </div>
            <div class="form-outline mb-4">
                <label class="form-label" for="startDate">Başlangıç Tarihi</label>
                <form:input path="startDate" type="date" cssClass="form-control"  id="startDate"/>
            </div>
            <div class="form-outline mb-4">
                <label class="form-label" for="endDate">Bitiş Tarihi</label>
                <form:input path="endDate" type="date" cssClass="form-control"  id="endDate"/>
            </div>
            <div class="form-outline mb-4">
                <label class="form-label" for="status">Durumu</label>
                <form:select path = "status" id = "status" cssClass="form-control">
                    <form:option value = "Yeni" label = "Yeni" />
                    <form:option value = "Devam ediyor" label = "Devam" />
                    <form:option value = "Problem" label = "Problem" />
                    <form:option value = "Tamamlandı" label = "Tamamlandı" />
                </form:select>
            </div>

        <div class="form-outline mb-4">
            <label class="form-label" for="department">Departman</label>
            <form:select path = "department" id = "department" cssClass="form-control">
                <form:option disabled="true" value = "" label = "Departman Seçiniz" />
                <form:options items = "${departmentList}" itemLabel="name"/>
            </form:select>
        </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="manager">Proje Yöneticisi</label>
                <form:select path = "manager" id = "manager" cssClass="form-control">
                    <form:option disabled="true" value = "" label = "Yönetici Seçiniz" />
                    <form:options items = "${managerList}" itemLabel="firstname"/>
                </form:select>
            </div>

        <div class="form-outline mb-4">
            <label class="form-label" for="employee">Personel</label>
            <form:select path = "employee" id = "employee" cssClass="form-control">
                <form:option disabled="true" value = "" label = "Personel Seçiniz" />
                <form:options items = "${employeeList}" itemLabel="firstname"/>
            </form:select>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4"> Ekle/güncelle </button>
    </form:form>

</div>
</body>
</html><%----%>
