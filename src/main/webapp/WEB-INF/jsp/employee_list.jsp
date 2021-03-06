<%@ page import="com.personeltakip.model.Employee" %>
<%@ page import="com.personeltakip.model.Department" %>
<%@ page import="com.personeltakip.model.User" %>
<%@ page import="com.personeltakip.services.DepartmentService" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.personeltakip.model.Manager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
    User user = (User) request.getSession().getAttribute("user");
  //  Manager manager = (Manager) request.getSession().getAttribute("manager");
  // if (manager == null)
   //     response.sendRedirect("/employee_login");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Personel Bilgileri</title>
    <%--    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />--%>
    <%--    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
    <%--    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>--%>
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
            <h3>Proje Takip Sistemi</h3>
            <ul class="nav nav-pills nav-stacked">
                <br/>

                <%--
                                <li><a href="/student/list">????renci Bilgileri</a></li>--%>
                <li>               <a href="/user/list">Kullan??c?? Bilgileri</a></li>
                <li>               <a href="/manager/list" >Y??netici Bilgileri</a></li>
                <li class="active"><a href="/employee/list">Personel Bilgileri</a></li>
                <li>               <a href="/department/list">Departman Bilgileri</a></li>
                <li>               <a href="/project/list">Proje Bilgileri</a></li>
                <%--            <li><a href="/danisman/list">Dan????man Bilgileri</a></li>
                                <li><a href="/sirketbilgisi/list">??irket Bilgileri</a></li>
                                <li><a href="/stajbirim/list">Staj Birim Bilgileri</a></li>
                                <li><a href="/stajbilgisi/list">Staj Bilgileri</a></li>--%>
            </ul><br>
            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="????k???? Yap">
            </form:form>

        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">

                <spring:url value="/employee/addEmployee/" var="addURL" />
                <a class="btn btn-success pull-right" href="${addURL}" role="button" >Yeni Kay??t</a>

                <c:if test="${message != null}">
                    <div class="alert alert-success" role="alert"> ${message} </div>
                </c:if>

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Id</th>
                    <th scope="row">??sim</th>
                    <th scope="row">Soyisim</th>
                    <th scope="row">E-mail</th>
                    <th scope="row">Telefon</th>
                    <th scope="row">Cinsiyet</th>
                    <th scope="row">Do??um Tarihi</th>
                    <th scope="row">Departman</th>
                    <th scope="row">G??ncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>

                    <c:forEach items="${employeeList}" var="employee" >
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.firstname}</td>
                            <td>${employee.lastname}</td>
                            <td>${employee.email}</td>
                            <td>${employee.phone}</td>
                            <td>${employee.gender}</td>
                            <td>${employee.birthday}</td>
                            <td>${employee.department.name}</td>

                            <td>
                                <spring:url value="/employee/editEmployee/${employee.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >G??ncelle</a>
                            </td>

                            <td>
                                <spring:url value="/employee/deleteEmployee/${employee.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
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