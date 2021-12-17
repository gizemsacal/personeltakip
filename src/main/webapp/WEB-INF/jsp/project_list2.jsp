<%@ page import="com.personeltakip.model.Employee" %>
<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.model.Project" %>
<%@ page import="com.personeltakip.model.Manager" %>
<%@ page import="com.personeltakip.model.Department" %>
<%@ page import="com.personeltakip.services.ProjectService" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%
    User user = (User) request.getSession().getAttribute("user");
    Employee employee = (Employee) request.getSession().getAttribute("employee");
    if (employee == null)
        response.sendRedirect("/employee_login");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Personel Bilgileri</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        html, body{
            height: 100%;
        }
        .container-fluid{
            height: 100%;
        }
        .row.content{
            height: 100%;
        }
        .sidenav {
            background-color: #ffffff;
            height: 100%;
        }
        h3 {
            margin-top: 20px;
            margin-bottom: 10px;
            margin: 15px;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xl">
            <br/>
            <ul class="nav nav-pills nav-stacked">
                <h3>Proje Takip Sistemi</h3>
                <br/>
                <li>               <a href="/department/list2">Departman Bilgileri</a></li>
                <li class="active"><a href="/project/list2">Proje Bilgileri</a></li>
            </ul><br>
            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>

        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Id</th>
                    <th scope="row">Proje Adı</th>
                    <th scope="row">Başlangıç Tarihi</th>
                    <th scope="row">Bitiş Tarihi</th>
                    <th scope="row">Durumu</th>
                    <th scope="row">Departman</th>
                    <th scope="row">Proje Yöneticisi</th>
                    </thead>
                    <tbody>

                    <c:forEach items="${projectList2}" var="project" >
                        <tr>
                            <td>${project.id}</td>
                            <td>${project.name}</td>
                            <td>${project.startDate}</td>
                            <td>${project.endDate}</td>
                            <td>${project.status}</td>
                            <td>${project.department.name}</td>
                            <td>${project.manager.firstname} ${project.manager.lastname}</td>
                            <td>
                            </td>

                            <td>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>