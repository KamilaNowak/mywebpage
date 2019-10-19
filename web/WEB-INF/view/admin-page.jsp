<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
                <a class="nav-link" href="#">Dyski</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">Obudowy</a>
            </li>
        </ul>
    </div>
    <c:if test="${pageContext.request.userPrincipal.name!=null}">
        <button type="button" class="btn btn-warning btn-lg btn-rounded dropdown-toggle" style="color:white"
                data-toggle="dropdown" id="accountButton"><i
                class="fa fa-user"> ${pageContext.request.userPrincipal.name}</i></button>
        <div class="dropdown-menu" aria-labelledby="accountButton" style="position:relative">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/account"> Moje konto</a>
            <form:form action="${pageContext.request.contextPath}/logout">
                <button type="submit" class="dropdown-item"  style="background-color:red;color:white">
                    Wyloguj
                </button>
            </form:form>
        </div>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name==null}">
        <button type="button" class="btn btn-warning btn-lg btn-rounded dropdown-toggle" style="color:white"
                data-toggle="dropdown" id="accountButton"><i class="fa fa-user"> Niezalogowany
        </i></button>
        <div class="dropdown-menu" aria-labelledby="accountButton" style="position:relative">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/account">Moje konto</a>
            <form:form action="${pageContext.request.contextPath}/logout">
                <button type="submit" class="dropdown-item"  style="background-color:red;color:white">
                    Wyloguj
                </button>
            </form:form>
        </div>
    </c:if>
</nav>
<div class="container" style="margin-top:35px">
    <div class="row">
        <div class="col-sm-4">
            <h2>Zalogowany użytkownik</h2>
            <hr>
            <p><span class="input-group-text"><i class="fa fa-user"> <security:authentication
                    property="principal.username"/></i></span></p>
            <hr>
            <h2>Role</h2>
            <p><span class="input-group-text"><i class="fa fa-align-left"> <security:authentication
                    property="principal.authorities"/></i></span></p>
            <hr>
            <br>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/ "> Strona główna</a>
            <br><br>
            <form:form action="${pageContext.request.contextPath}/logout">
                <button type="submit" class="btn btn-outline-warning"> Wyloguj</button>
            </form:form>
        </div>

        <br>

        <div class="col-sm-8">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#Forms">Formularze</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#Messages">Wiadomości</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#Users">Użytkownicy</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="Forms" class="container tab-pane active"><br>
                    <h3><span class="badge badge-dark">Formularze</span></h3>
                    <br>
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th>Klient</th>
                            <th>Budżet</th>
                            <th>Podzespoły</th>
                            <th>Uwagi</th>
                            <th>Akcja</th>
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
                                <td><a href="${deleteRecord}" onclick="if (!(confirm('Czy napewno chcesz usunąć ten formularz?'))) return false">Usuń</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="Messages" class="container tab-pane fade"><br>
                    <h3><span class="badge badge-dark">Wiadomości</span></h3>
                    <br>
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th>Klient</th>
                            <th>Treść</th>
                            <th>Akcja</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tmp" items="${messagesList}">
                            <c:url var="deleteMessage" value="/adminManager/deleteMessage">
                                <c:param name="Message_id" value="${tmp.id}"/>
                            </c:url>
                            <tr>
                                <td>${tmp.username}</td>
                                <td>${tmp.message}</td>
                                <td><a href="${deleteMessage}" onclick="if (!(confirm('Czy napewno chcesz usunąć tą wiadomość?'))) return false">Usuń</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="Users" class="container tab-pane fade"><br>

                    <h3><span class="badge badge-dark">Użytkownicy</span></h3>
                    <p> Aby dezaktywować konto naciśnij przycisk dezaktywacji. Ta operacja jest nieodwracalna.</p>
                    <hr>
                    <br>
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th>Nazwa</th>
                            <th>E-mail</th>
                            <th>Numer</th>
                            <th>Data urodzenia</th>
                            <th>Akcja</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tmp" items="${usersList}">
                            <c:url var="deleteUser" value="/adminManager/deleteUser">
                                <c:param name="User_id" value="${tmp.id}"/>
                            </c:url>
                            <tr>
                                <td>${tmp.username}</td>
                                <td>${tmp.email}</td>
                                <td>${tmp.phone}</td>
                                <td>${tmp.birthDate}</td>
                                <td><a href="${deleteUser}" onclick="if (!(confirm('Czy napewno chcesz dezaktywować kontro użytkownika?'))) return false">Usuń</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>