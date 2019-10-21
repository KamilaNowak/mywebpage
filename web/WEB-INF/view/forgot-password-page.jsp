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
</head>
<body>
<html>
<body>

<h1> Zrezetuj hasło</h1>
<hr>
E- mail:
<form:form action="${pageContext.request.contextPath}/resetPassword">
    <div class="form-group input-group">
        <span class="input-group-text"><i class="fa fa-user"></i></span>
        <input type="text" name="email" class="form-control"/>
    </div>
    <button type="submit" class="btn btn-primary"> Potwierdz</button>
</form:form>



</body>
</html>
