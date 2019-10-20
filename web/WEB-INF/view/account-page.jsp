<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <style>
        .nav-tabs .nav-link:not(.active) {
            border-color: transparent !important;
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
            <p><span class="input-group-text"><i class="fa fa-user"> <security:authentication
                    property="principal.username"/></i></span></p>
            <hr>
            <h2>Role</h2>
            <p><span class="input-group-text"><i class="fa fa-align-left"> <security:authentication
                    property="principal.authorities"/></i></span></p>
            <hr>
        </div>
        <div class="col-sm-8">
            <div class="container" style="max-width: 100%;max-height:100%">
                <ul class="nav nav-tabs border-0" role="tablist" id="navTabs">
                    <li class="nav-item">
                        <a class="nav-link active border border-primary border-bottom-0" id="accountDetailsnav"
                           href="#accountDetails"
                           data-toggle="tab" role="tab" aria-selected="true">Szczegóły</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  border border-warning border-bottom-0" id="myFormsnav" href="#myForms"
                           data-toggle="tab"
                           role="tab" aria-selected="false">Moje Formularze</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  border border-danger border-bottom-0" id="myMessagesnav" href="#myMessages"
                           data-toggle="tab" aria-selected="false">Moje Wiadomości</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  border border-info border-bottom-0" id="editAccountnav" href="#editAccount"
                           data-toggle="tab" aria-selected="false">Edytuj konto</a>
                    </li>
                </ul>

                <div class="tab-content ">
                    <div class="tab-pane h-100 p-4 active border border-primary" id="accountDetails" role="tabpanel">
                        <a href="${pageContext.request.contextPath}/account/change-password"  class="btn btn-outline-danger"> Zmień hasło </a>
                        <a href="${pageContext.request.contextPath}/account/edit-account" class="btn btn-info" style="margin-right:10px"> Edytuj konto</a> <hr>

                        <br>
                        <form>
                            <div class="form-group row text-center">
                                <label class="col-sm-2 col-form-label">Nazwa użytkownika  </label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value=" ${user.username}">
                                </div>
                            </div>
                            <hr>
                            <div class="form-group row text-center">
                                <label class="col-sm-2 col-form-label">E-mail  </label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" value=" ${user.email}">
                                </div>
                            </div>
                            <hr>
                            <div class="form-group row text-center">
                                <label class="col-sm-2 col-form-label">Numer telefonu  </label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" value=" ${user.phone}">
                                </div>
                            </div>
                            <hr>
                            <div class="form-group row text-center">
                                <label class="col-sm-2 col-form-label">Data urodzenia  </label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext"
                                           value=" ${user.birthDate}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane h-100 p-5 border border-warning" id="myForms" role="tabpanel">
                        <table class="table">
                            <thead class="thead-light">
                            <tr>
                                <th>Budżet</th>
                                <th>Treść</th>
                                <th>Notatki</th>
                                <th>Akcja</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="tmp" items="${forms}">
                                <c:url var="updateForm" value="/adminManager/updateForm">
                                    <c:param name="User_id" value="${tmp.id}"/>
                                </c:url>
                                <tr>
                                    <th>${tmp.max_cost}</th>
                                    <th>${tmp.having_comps}</th>
                                    <th>${tmp.additional_notes}</th>
                                    <th><a href="${updateForm}">Edytuj</a></th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane h-100 p-5 border border-danger" id="myMessages" role="tabpanel">
                        <table class="table">
                            <thead class="thead-light">
                            <tr>
                                <th>Treść wiadomości</th>
                            </tr>
                            </thead>
                            <div class="tbody">
                                <c:forEach var="tmp" items="${messages}">
                                    <c:url var="updateMessage" value="/adminManager/updateMessage">
                                        <c:param name="Message_id" value="${tmp.id}"/>
                                    </c:url>
                                    <tr>
                                        <td>${tmp.message}</td>
                                    </tr>
                                </c:forEach>
                            </div>
                        </table>
                    </div>
                    <div class="tab-pane h-100 p-5 border border-info" id="editAccount" role="tabpanel">

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
