<!DOCTYPE html>
<html lang="en">
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    <style>
        .footer {
            background-color: #d9d9d9;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<nav class="navbar 	 navbar-dark navbar-expand-lg" style="background-color: #a6a6a6">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/ "><img src="" width="50" height="50" alt=""
                                                                             class="d-inline-block mr-1">PC-Configurer.pl</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu_bar"
            aria-controls="#menu_bar" aria-expanded="false" aria-label="nav_switch">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div id="menu_bar" class="collapse navbar-collapse">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/cpu">Procesory</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Płyty główne</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Pamięci RAM</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Karty Graficzne</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Zasilacze</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" href="#">Dyski</a>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"> HDD </a>
                    <a class="dropdown-item" href="#">SSD </a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Obudowy</a>
            </li>
        </ul>
    </div>
</nav>

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
        <div class="col-sm-8">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/ ">Strona główna</a>
                </li>
                </li>
                <li class="nav item">
                    <a class="nav-link active" href="#">Zarządzaj użytkownikami</a>
                </li>
                <br>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger"> Wyloguj się </a>
            </ul>
            <br>
            <h3><span class="badge badge-dark">Formularze</span></h3>
            <br>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Klient</th>
                    <th>Budżet</th>
                    <th>Podzespoły</th>
                    <th>Uwagi</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tmp" items="${formsList}">
                    <c:url var="deleteRecord" value="/managerForm/deleteRecord">
                        <c:param name="User_id" value="${tmp.id}"/>
                    </c:url>
                    <tr>
                        <td> ${tmp.username}</td>
                        <td>${tmp.max_cost}</td>
                        <td>${tmp.having_comps}</td>
                        <td>${tmp.additional_notes}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>

