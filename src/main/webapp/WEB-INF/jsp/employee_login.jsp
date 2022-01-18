<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giriş</title>
    <style><%@include file="style.css"%></style>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<br><br><br>
<div class="container login-container">

    <img src='<c:url value="https://cdn.cezannehr.com/wp-content/uploads/2020/01/What-HR-can-do-to-move-the-dial-on-inclusion-1024x577.png"></c:url>' />        </div>

<div class="row">
        <div class="col-md-6 login-form-2">
            <h3>Yönetici Giriş</h3>
            <spring:url value="/manager_login" var="addURL" />
            <form:form modelAttribute="user" method="post" action="${addURL}" cssClass="form" >
                <div class="form-group">
                    <input type="text"     name="username" id="managerUsername" class="form-control" placeholder="Kullanıcı Adınızı Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="password" name="password"  id="managerPassword" class="form-control" placeholder="Şifrenizi Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                    <br><br>
                </div>
            </form:form>
        </div>

        <div class="col-md-6 login-form-1">
            <h3>Personel Giriş</h3>
            <spring:url value="/employee_login" var="addURL" />
            <form:form modelAttribute="user" method="post" action="${addURL}" cssClass="form" >
                <div class="form-group">
                    <input type="text"     name="username"  id="employeeUsername" class="form-control" placeholder="Kullanıcı Adınızı Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="employeePassword" class="form-control" placeholder="Şifrenizi Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                </div>
            </form:form>
        </div>
    </div>
<!--<div class="d-flex flex-row-reverse"></div> --!>




</body>
<script>
    console.log(document.cookie)
    var employeeUsername =  document.getElementById("employeeUsername");
    var employeePassword =  document.getElementById("employeePassword");
    var managerUsername =  document.getElementById("managerUsername");
    var managerPassword =  document.getElementById("managerPassword");
    var cookieEmployeeUsername=document.cookie.split(";")[0].split("=")[1];
    var cookieEmployeePassword=document.cookie.split(";")[1].split("=")[1];
    var cookieManagerUsername=document.cookie.split(";")[2].split("=")[1];
    var cookieManagerPassword=document.cookie.split(";")[3].split("=")[1];
    employeeUsername.value=cookieEmployeeUsername;
    employeePassword.value=cookieEmployeePassword;
    managerUsername.value=cookieManagerUsername;
    managerPassword.value=cookieManagerPassword;
    }
</script>
</html>