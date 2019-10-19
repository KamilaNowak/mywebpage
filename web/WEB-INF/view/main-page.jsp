<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>PC-Configurer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .jumbotron {
            background-image: url("https://i.imgur.com/srtxVv6.jpg");
            background-size: 100%;
            color: white;
        }

        .social a {
            padding: 3rem;
        }

        .footer {
            background-color: #d9d9d9;
            color: black;
            padding-top: 2rem;
        }
    </style>

</head>
<body>
<header>
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
                    <a class="nav-link " href="#">Dyski</a>
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
                <a class="dropdown-item" href="#">Moje konto</a>
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
                <a class="dropdown-item" href="#">Moje konto</a>
                <a class="dropdown-item" href="#" style="background-color:red;color:white">Wyloguj</a>
            </div>
        </c:if>

    </nav>


    <div class="jumbotron text-center">
        <h1 style="color:white">Informator podzespołów komputera</h1>
        <p style="color:white">Poczytaj, o każdej z części twojej przyszłej jednostki</p>
        <p style="color:white">Po zalogowaniu masz możliwość zrobienie zamówienia na profesjonalne składanie PC</p>
        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light">Zaloguj się</a>
    </div>

</header>
<div class="container-fluid">
    <div class="row welcome text-center">
        <div class="col-12">
            <h2 class="display-4">Buduj z uwagą i wyczuciem.</h2>
        </div>
        <br>
        <hr>
        <div class="col-12">
            <p class="lead">
                Pamiętaj, aby przy wyborze podzespołów kierować się trzema najważniejszymi aspektami.
            </p>
        </div>
    </div>
    <br><br>
    <div class="container-fluid padding">
        <div class="row text-center">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <h1><i class="fa fa-wrench"></i></h1>
                <h3>Zgodność</h3>
                <p>Zadbaj o to, aby podzespoły pasowały do siebie pod względem sprzętowej kompatybilności</p>
            </div>
            <hr>
            <div class="col-xs-12 col-sm-6 col-md-4">
                <h1><i class="fab fa-get-pocket"></i></h1>
                <h3>Dopasowanie do potrzeb</h3>
                <p>Dobieraj podzespoły tak, aby najmocniejsze części były wykorzystywane do codzinnej pracy</p>
            </div>
            <hr>
            <div class="col-xs-12 col-sm-6 col-md-4">
                <h1><i class="fas fa-gem"></i></h1>
                <h3>Maksymalna Wydajność, a dobry wygląd</h3>
                <p>Staraj się nie przesadzać z ilością elementów, która nie przynosi jakiejś funkcjonalności.
                    Zachowanie minimalizmu pozwoli na skomponowanie wydajnej, ale i przykuwającej oko jednostki</p>
            </div>
        </div>
    </div>

    <hr>
    <br>
    <div class="container-fluid">
        <div class="row ml-5">
            <div class="col-md-12 col-lg-6 ">
                <h1>Jak to działa?</h1>
                <span class="badge badge-primary">1. Opcja</span>
                <p>W formularzu wypełniasz odpowiednie pola wpisując podzespoły, które wybrałeś. Możesz także napisać w
                    wiadomości do jakich celów będzie używany komputer, czy masz obecnie jakieś
                    podzespoły, które można użyć przy budowaniu jednostki oraz podajesz maksymalny budżet. Resztą
                    zajmuję się ja.
                    Zamawiam części z najlepszych sklepów za możliwiwe najniszą cenę. Składam komputer dokładnie, dbając
                    o cable-management. Następnie kontaktuję się z klientem w sprawie odbioru jednostki</p>
                <a href="${pageContext.request.contextPath}/contactForm " type="button" class="btn btn-outline-primary">Wypełnij
                    formularz</a>
                <br><br>
                <span class="badge badge-primary">2. Opcja</span>
                <p> Możesz także napisać wiadomość z dowolnym pytaniem, dotyczącym oferowanych usług.</p>
                <a href="${pageContext.request.contextPath}/contactMessage" type="button"
                   class="btn btn-outline-primary">Wyślij wiadomość</a>
            </div>
            <div class="col-lg-6">
                <img class=img-fluid" class="rounded" src="http://www.naprawa-komputera.waw.pl/skladanie_komputera.jpg"
                     alt="skl">
            </div>

        </div>
    </div>
    <hr>
    <br>
    <div class="container-fluid text-cente">
        <div class="row form-group text-center ">
            <div class="col-12">
                <h2>Kontakt</h2>
            </div>
            <br>
            <div class="col-12 social">
                <a href="https://www.linkedin.com/in/kamila-nowak-7b267816b/"><i class="fa fa-linkedin-square"
                                                                                 style="font-size:50px; color:#2867B2"></i></a>
                <a href="https://github.com/KamilaNowak"><i class="fa fa-github"
                                                            style="font-size:50px; color:black"></i></a>
                <a href="mailto:knowak242@gmail.com"><i class="	far fa-address-card"
                                                        style="font-size:50px;color:#D44638"></i></a>
            </div>
        </div>
    </div>
    <br>
    <footer>
        <div class="footer">
            <div class="row text-center">
                <div class="col-12">
                    <h4>&copy; PC-Configurer.pl | 2019</h4>
                    <a href="${pageContext.request.contextPath}/adminManager">Admin Panel</a>
                </div>
            </div>
        </div>
    </footer>
    <br>
</div>
</body>

</body>
</html>