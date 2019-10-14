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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <style>
        .footer
        {
            background-color:#808080;
        }
    </style>
</head>

<body>
<br>
<div class="container">
    <div class="row">
        <div class="col-12 text-center">
            <p>Powered by PC-Configurer.pl</p>
        </div>
    </div>
</div>
<hr>

<div class="card bg-light" style="margin-left:600px; margin-right:600px; margin-top:20px; margin-bottom:20px">
    <article class="card-body mx-auto">
        <div class="card-title mt-3 text-center">
            <h3>Zaloguj się</h3>
        </div>
        <div class="text-center">
            <p>Jeśli nie masz jeszcze - konta kliknij przycisk  <span class="badge badge-primary">Zarejestruj</span>
        </div>
        <hr>
        <div class="form-group">
            <div class="col-sm-10 text-center">
                <div class="validMessage">
                    <c:if test="${param.error!=null}">

                        <div class="alert alert-danger col-sm-10">
                            <i class="	far fa-frown"> Invalid username or password!</i>
                        </div>

                    </c:if>
                </div>
            </div>
        </div>
        <form:form action="${pageContext.request.contextPath}/loginProceed" method="post" class="form-horizontal">
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <input type="text" name="username" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <input type="password" name="password" class="form-control"/>
            </div>
            <br>
            <button type="submit" class="btn btn-outline-success" style="margin-left:350px">Zaloguj</button>
            <a href ="${pageContext.request.contextPath}/register" class="btn btn-primary" style="margin-left:0px">Zarejestruj</a>
            <a href="${pageContext.request.contextPath}/ " class="btn btn-info" style="margin-left:10px;color:white"  >Strona główna</a>
        </form:form>
    </article>
</div>

<footer>
    <div class="footer">
        <div class="row text-center">
            <div class="col-12" style="margin-bottom:0px">
                <h4>&copy;PC-Configurer.pl</h4>
            </div>
        </div>
    </div>
</footer>
</body>
