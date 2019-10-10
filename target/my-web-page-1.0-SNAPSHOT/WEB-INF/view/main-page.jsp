<!DOCTYPE html>
<html lang="pl">
<head>
    <title>PC-Configurer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .jumbotron{
            background-image:url("https://i.imgur.com/srtxVv6.jpg");
            background-size:100%;
        }
    </style>

</head>
<body>
<header>
    <nav class="navbar 	 navbar-dark navbar-expand-lg" style="background-color: #808080">
        <a class="navbar-brand" href="#"><img src="" width="50" height="50" alt=""
                                              class="d-inline-block mr-1">PC-Configurer.pl</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu_bar"
                aria-controls="#menu_bar" aria-expanded="false" aria-label="nav_switch">
	<span class=navbar-toggler-icon</span>
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


    <div class="jumbotron text-center" >
        <h1 style="color:white">Informator podzespołów komputera</h1>
        <p style="color:white">Poczytaj, o każdej z części twojej przyszłej jednostki</p>
        <p style="color:white">Po zalogowaniu masz możliwość zrobienie zamówienia na profesjonalne składanie PC</p>

    </div>

</header>
<div class="container-fluid">
    <div class="row welcome text-center">
        <div class="col-12">
            <h2 class="display-4">Buduj z pacją i wyczuciem.</h2>
        </div>
        <hr>
        <div class="col-12">
            <p class="lead">
                Pamiętaj, aby przy wyborze podzespołów kierować się trzema najważniejszymi aspektami.
            </p>
        </div>
    </div>
    <div class="container-fluid padding">
        <div class="row text-center">
            <div class="col-xs-12 padding">
                <i class="fa fa-wrench"></i>
                <h3>Zgodność</h3>
                <p>Zadbaj o to, aby podzespoły pasowały do siebie pod względem sprzętowej kompatybilności"</p>
            </div>
            <hr>
            <div class="col-xs-12 padding">
                <i class=fas fa-code"></i>
                <h3>Dopasowanie do potrzeb</h3>
                <p>Dobieraj podzespoły tak, aby najmocniejsze części były wykorzystywane do codzinnej pracy"</p>
            </div>
            <hr>
            <div class="col-xs-12 padding">
                <i class=fas fa-code"></i>
                <h3>Maksymalna Wydajność, a dobry wygląd</h3>
                <p>Staraj się nie przesadzać z ilością elementów, która nie przynosi jakiejś funkcjonalności. </p>
                </p>Zachowanie minimalizmu pozwoli na skomponowanie wydajnej, ale i przykuwającej oko jednostki</p>
            </div>
        </div>
    </div>
</div>




