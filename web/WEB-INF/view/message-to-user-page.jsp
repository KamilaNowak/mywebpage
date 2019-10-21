<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <style>
        .image-bg {
            background-image: url('https://www.newegg.com/insider/wp-content/uploads/2018/04/Aorus-X370-Gaming-3-Motherboard-1-of-1-21.jpg');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;

        }
    </style>
</head>
<body>

<div class="image-bg">
    <form:form  method="post" modelAttribute="messageFromUser" >
        <div class="card" style="margin-left:50px; margin-right:80px;margin-top:20px">
            <div class="card-header">
                PC-Configurer.pl
            </div>
            <div class="card-body">
                <h5 class="card-title">${messageFromUser.username}</h5>
                <p class="card-text">${messageFromUser.message}</p>
            </div>
            <div class="card-footer text-muted">
                Dodano: ${messageFromUser.date}
            </div>
        </div>
    </form:form>
        <br><br><br>
   <form:form action="${pageContext.request.contextPath}/adminManager/proceedSendReply" method="post" modelAttribute="messageToUser">
        <article class="card" style="margin-left:200px; margin-right:80px;margin-top:20px" >


            <div class="form-group input-group">
                <span class="input-group-text"></span>
                <form:textarea path="message" rows="13" class="form-control"/>
            </div>
            <input type="submit" class="btn btn-primary"/>


        </article>
    </form:form>
</div>
</body>