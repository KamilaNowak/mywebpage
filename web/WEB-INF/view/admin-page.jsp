<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
</head>

<body>
<div class="container" style="margin-top:15px;">
    <ul class="nav nav-tabs nav-justified">
        <li class="nav item">
            <a class="nav-link active" href="#">Strona główna</a>
        </li>
        <li class="nav item">
            <a class="nav-link active" href="#">Wiadomości</a>
        </li>
        </li>
        <li class="nav item">
            <a class="nav-link active" href="#">Zarządzaj użytkownikami</a>
        </li>

        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger"> Wyloguj się </a>
    </ul>
    <div class="container" style="margin-top:35px">
        <div class="row">
            <div class="col-sm-4">
                <h2>Zalogowany użytkownik</h2>
                <p> <span class="input-group-text"><i class="fa fa-user"> <security:authentication property="principal.username"/></i></span></p>
                <hr>
                <h2>Role</h2>
                <p><span class="input-group-text"><i class="fa fa-align-left"> <security:authentication property="principal.authorities"/></i></span></p>
                <hr>
            </div>
        </div>
    </div>
</div>
</body>
</html>