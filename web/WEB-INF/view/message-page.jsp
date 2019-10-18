<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="card bg-light" style="margin-left:100px; margin-right:100px; margin-top:20px; margin-bottom:20px">
    <article class="card-body">
        <div class="card-title mt-3 text-center">
            <h2>Napisz bezpośrednią wiadomość</h2>
            <p>Postaram się odpowiedzieć najszybciej jak to możliwe</p>
        </div>
        <br>
        <hr>
        <br>

        <form:form action="${pageContext.request.contextPath}/proceedSendingMessage" class="form-horizontal"
                   method="post" modelAttribute="messageModel">

            <c:if test="${passedAlert!=null}">
                <div class="alert alert-success col-xs-4">
                    ${passedAlert}
                </div>
            </c:if>
            <form:input type="hidden" path="username" value="${messageModel.username}"/>
            <br>
            <h4>Treść wiadomości</h4>
            <div class="form-group input-group">
                <div class="input-group-text">
                    <div class="col-xs-2">
                        <form:textarea path="message" rows="12" class="form-control"/>
                    </div>
                </div>
            </div>
            <input type="submit" value="Wyślij" class="btn btn-primary" style="margin-left:10px;color:white">
            <a href="${pageContext.request.contextPath}/ " class="btn btn-info">Strona główna</a>
        </form:form>
    </article>
</div>
</body>
</html>
