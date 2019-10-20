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

    <style>
        .image-bg{
            background-image: url('https://wallpaperbro.com/img/308276.jpg');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;

        }
    </style>
</head>

<body>
<div class="image-bg">
    <br>
    <div class="container">
        <div class="row ">
            <div class="col-12 text-center" style="color:white">
                <p> Powered by PC-Configurer.pl</p>
            </div>
        </div>
    </div>
    <hr>

    <div class="card bg-light" style="margin-left:600px; margin-right:500px; margin-bottom:20px; margin-top:20px">
        <article class="card-body mx-auto" style="max-width: 400px">
            <h3 class="card-title mt-3 text-center">Zmień hasło</h3>
            <div class="text-center">
                <p class="text-center">Zadbaj o bezpieczeństwo. Zmień hasło jeśli to potrzebne.</p>
                <p>Kliknij <span class="badge badge-primary"> powrót </span> jeśli nie chcesz nic zmieniać.</p>
            </div>
            <br>
            <hr>
            <br>
            <form:form action="${pageContext.request.contextPath}/account/proceedChangePassword" method="post"
                       class="form-horizontal" modelAttribute="validationPassword">

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
                    <span class="input-group-text"><i class="fa fa-unlock-alt"></i></span>
                    <form:input path="oldPassword" placeholder="Obecne hasło" class="form-control" type="password"/>
                </div>
                <br>
                <div class="form-group input-group">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <form:input class="form-control" path="newPassword" placeholder="Nowe hasło" type="password" />
                </div>
                <br>
                <div class="form-group input-group">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <form:input class="form-control" placeholder="Potwierdź hasło" path="confirmPassword" type="password"/>
                </div>
                <br><hr><br>
                <button type="submit" id="registerButton" style="margin-left:290px" class="btn btn-outline-success">
                    Zmień
                </button>
                <a href="${pageContext.request.contextPath}/account" class="btn btn-primary"
                   style="margin-left:0px">Powrót</a>
                <a href="${pageContext.request.contextPath}/ " class="btn btn-info" style="margin-left:10px;color:white">
                    Strona główna</a>
            </form:form>
        </article>
    </div>
</div>
</body>