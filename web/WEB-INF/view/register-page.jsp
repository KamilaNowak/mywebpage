<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>
<br>
<div class="container">
    <div class="row ">
        <div class="col-12 text-center">
            <p> Powered by PC-Configurer.pl</p>
        </div>
    </div>
</div>
<hr>

<div class="card bg-light" style="margin-left:600px; margin-right:600px; margin-bottom:20px; margin-top:20px">
    <article class="card-body mx-auto" style="max-width: 400px">
        <h3 class="card-title mt-3 text-center">Zarejestruj się</h3>
        <div class="text-center">
            <p class="text-center">Utwórz nowe konto, aby móc korzystać ze wszystkich możliwości</p>
            <p>Kliknij<span class="badge badge-primary">Logowanie</span> jeśli masz już konto.</p>
        </div>
        <br>
        <hr>
        <br>
        <form:form action="${pageContext.request.contextPath}/proceedRegisteration" method="post"
                   class="form-horizontal" modelAttribute="validationUser">
            <c:if test="${fieldError!=null}">
                <div class="alert alert-danger col-xs-4">
                        ${fieldError}
                </div>
            </c:if>
            <c:if test="${successRegisterMessage!=null}">
                <div class="alert alert-success col-xs-4">
                        ${successRegisterMessage}
                </div>
            </c:if>

            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <form:input path="username" placeholder="Username" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <form:password path="password" placeholder="password" name="password" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <form:password path="confirmPassword" placeholder="confirm password" name="password"
                               class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="far fa-envelope"></i></span>
                <form:input path="email" placeholder="email" class="form-control"/>
            </div>
            <br>
            <button type="submit" id="registerButton" style="margin-left:290px" class="btn btn-outline-success">
                Zarejestruj
            </button>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary"
               style="margin-left:0px">Logowanie</a>
            <a href="${pageContext.request.contextPath}/ " class="btn btn-info" style="margin-left:10px;color:white">
                Strona główna</a>
        </form:form>
    </article>
</div>
</body>
