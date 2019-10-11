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
        <p class="text-center">Utwórz nowe konto, aby móc korzystać ze wszystkich możliwości</p>
        <br>
        <hr>
        <br>
        <form:form action="${pageContext.request.contextPath}/register" method="post" class="form-horizontal">
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <form:input path="username" placeholder="Username" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <form:input path="password" placeholder="password" name="password" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="fa fa-eye-slash"></i></span>
                <form:input path="confirmPassword" placeholder="confirm password" name="password" class="form-control"/>
            </div>
            <br>
            <div class="form-group input-group">
                <span class="input-group-text"><i class="far fa-envelope"></i></span>
                <form:input path="email" placeholder="email" class="form-control"/>
            </div>
            <br>
            <button type="submit" style="margin-left:250px" class="btn btn-outline-success">Zarejestruj</button>
            <button type="button" class="btn btn-primary">Logowanie</button>
        </form:form>
    </article>
</div>
<footer>
    <div class="footer" style="background-color:#808080">
        <div class="row text-center">
            <div class="col-12" style="margin-top: 15px; margin-bottom:15px">
                <h4>&copy;PC-Configurer.pl  | 2019</h4>
            </div>
        </div>
    </div>
</footer>

</body>
