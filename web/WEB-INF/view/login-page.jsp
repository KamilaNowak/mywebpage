<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <form:form action="${pageContext.request.contextPath}/login" method="post" class="form-horizontal">
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <form:input path="username" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <form:input path="password" class="form-control"/>
            </div>
            <br>
            <button type="submit" class="btn btn-outline-success" style="margin-left:350px">Zaloguj</button>
            <p><button type="button" class="btn btn-primary" style="margin-left:0px">Zarejestruj</button></p>
        </form:form>
    </article>
</div>

<footer>
    <div class="footer">
        <div class="row text-center">
            <div class="col-12" style="margin-top:15px; margin-bottom:15px">
                <h4>&copy;PC-Configurer.pl</h4>
            </div>
        </div>
    </div>
</footer>
</body>