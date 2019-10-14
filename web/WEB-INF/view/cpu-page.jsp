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
<div class="jumbotron text-center"
     style="background-size: 100%;margin-top:0px; background-image: url(https://mdbootstrap.com/img/Photos/Others/gradient1.jpg)">
    <h1> Procesory</h1>
</div>
<div class="container" style="margin-top:35px">
    <div class="row">
        <div class="col-sm-4">
            <h2> Procesor Intel i7 8700K </h2>
            <h5>Zdjęcie poglądowe</h5>
            <br>
            <img class="img-fluid" class="rounded" src="https://images.morele.net/full/978219_1_f.jpg"
                 style="width:190px">
            <br>
            <hr>
            <h2> Zobacz także</h2>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="#">RAM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Płyty główne</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">SSD</a>
                </li>

            </ul>
        </div>
        <div class="col-sm-8">
            <h3>Garść informacji..</h3>
            <p>Nowe procesory AMD miały premierę na początku 2017. Wykorzystują one całkowicie nową mikroarchitekturę
                Zen. Produkowane są modele pod dwa sockety – AM4 oraz TR4. Pierwszy z nich przeznaczony jest do platform
                konsumenckich, umożliwia montaż CPU z serii Ryzen R3, R5 oraz R7. Drugi to przedstawiciel segmentu HEDT
                czyli High End Desktop dla procesorów Threadripper. Wybór między nimi zależy od budżetu i tego, do czego
                chcesz używać komputera. Jeśli budujesz stację roboczą i nie dbasz specjalnie o koszta być może
                zainteresują Cię propozycje w segmencie HEDT. Przy bardziej ograniczonym budżecie być może Twoją uwagę
                zwrócą procesory konsumenckie, w szczególności Ryzeny 7 oraz trochę tańsze Ryzeny 5. Jeśli chodzi o gry
                to z czystym sumieniem możemy polecić Ci Ryzeny 3 oraz 5. Wszystkie polecane modele zostaną
                wyszczególnione poniżej, wraz z ich zaletami i wadami, mocnymi i słabymi stronami.</p>

            <p>Zaczniemy od omówienia proceosorów dobrych do komputerów budowanych z myślą o grach. Na pierwszy ogień
                weźmiemy Ryzeny 3 1200 oraz 2200G. Aby przenieść się do ich dokładnego opisu naciśnij którykolwiek
                obrazek poniżej.</p>

            <p>Ryzen 3 2200GRyzen 3 2200G
                Ryzen 3 1200Ryzen 3 1200
                Wraith SpireWraith Spire
                Ryzen 3 2200GRyzen 3 2200G
                Ryzen 3 1200Ryzen 3 1200
                Wraith SpireWraith Spire
                Ryzen 3 2200GRyzen 3 2200G</p>

            Nieco droższe są czterordzniowe ale tym razem już ośmiowątkowe (dzięki SMT) procesory Ryzen 5 1400 oraz
            nowszy 2400G. Dokładniejszy opis po kliknięciu w którykolwiek obraz poniżej.
            Zegar bazowy to odpowiednio 3.2 GHz oraz 3.6 GHz a zegary turbo – 3400 i 3900 MHz. Ryzen 2400G tak jak
            2200G wyposażony jest w zintegrowaną kartę graficzną. Jest nią układ o nazwie Vega 11 czyli bardziej
            rozbudowana wersja z 2200G, ponadto pracująca z taktowaniem rdzenia na poziomie 1250 MHz. Oznacza to, że
            nawet bez podkręcania przy zastosowaniu odpowiednio szybkich pamięci dysponuje on wydajnością podobną to
            przedstawionego wcześniej duetu Pentiuma i GT1030. A podkręcać można zarówno CPU jak i GPU.</p>
        </div>
    </div>
</div>
<footer>
    <div class="footer">
        <div class="row text-center">
            <div class="col-12">
                <h4>&copy; PC-Configurer.pl | 2019</h4>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
