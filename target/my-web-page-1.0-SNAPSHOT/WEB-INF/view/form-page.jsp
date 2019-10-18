<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        .card {
            background-color: #66ccff;

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

<div class="card bg-light" style="margin-left:100px; margin-right:100px; margin-top:20px; margin-bottom:20px">
    <article class="card-body">
        <div class="card-title mt-3">
            <h3>Formularz kontaktowy</h3>
        </div>
        <hr>
        <br>
        <form:form action="${pageContext.request.contextPath}/sendForm" method="post" class="form-horizontal"
                   modelAttribute="dataFromContactForm">
            <form:input type="hidden" path="username" value="${dataFromContactForm.username}"/>

        <c:if test="${passedAlert!=null}">
                <div class="alert alesrt-success col-xs-4">
                    ${passedAlert}
                </div>

        </c:if>

<br>
<label>Maksymalny budżet</label>
<div class="form-gorup input-group">
    <span class="input-group-text"><i class="fas fa-money-bill-wave"></i></span>
    <div class="col-xs-2">
        <form:input path="max_cost" class="form-control"/>
    </div>
</div>
<br>
<label>Posiadane podzespoły</label>
<div class="form-group input-group">
    <span class="input-group-text"><i class="fa fa-tasks"></i></span>
    <form:textarea path="having_comps" class="form-control" rows="4"/>
</div>
<br>
<label>Dodatkowe uwagi</label>
<div class="form-group input-group">
    <span class="input-group-text"><i class="fa fa-shopping-cart"></i></span>
    <form:textarea path="additional_notes" class="form-control" rows="7"/>
</div>
<br>
<label>System operacyjny</label><br>
<div class="form-check form-check-inline">
    <input class="form-check-input" type="checkbox">
    <label class="form-check-label"> Chcę aby był zainstalowany</label>
</div>
<br>
<hr>
<a href="${pageContext.request.contextPath}/ " class="btn btn-info" style="margin-left:10px;color:white">Strona
    główna</a>
<input type="submit" class="btn btn-primary" value="Wyślij">


</form:form>
</article>

</div>
</body>
</html>
