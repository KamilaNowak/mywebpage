<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#accessDeniedModal').modal('show');
            setTimeout(function(){
                $('#accessDeniedModal').modal('hide');
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="modal fade" data-backdrop="static" id="accessDeniedModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Błąd!</h4>
                </div>
                <div class="alert alert-danger" style="margin-top:10px">
                    Nie masz wystarczających uprawnień aby otworzyć tę stronę. Wyjdź do menu głównego lub zaloguj się za pośrednictwem konta administratora.
                </div>

                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath}/ " type="button" class="btn btn-danger" > Menu głowne</a>
                    <a href="${pageContext.request.contextPath}/login " type="button" class="btn btn-danger" > Logowanie</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
