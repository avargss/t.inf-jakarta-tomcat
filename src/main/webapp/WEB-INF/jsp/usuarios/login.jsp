<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 28/11/2024
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <%@ include file="../fragmentos/estilos.jspf" %>

    <style>
        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }
    </style>

</head>
<body>

<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>

<div id="contenedora" style="float:none; margin: 0 auto; width: 900px;">

    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1 class="header mt-5">Iniciar Sesion</h1>
        </div>
    </div>

    <hr>

    <form action="${pageContext.request.contextPath}/tienda/usuarios/login" method="post">
        <div style="margin-top: 6px;" class="clearfix">
            <div style="float: left;width: 50%">
                Usuario
            </div>

            <div style="float: none;width: auto;overflow: hidden;">
                <input type="text" name="usuario" required pattern="[A-Za-z0-9]+"
                       title="Solo se permiten letras y números"/>
            </div>
        </div>

        <div style="margin-top: 6px;" class="clearfix">

            <div style="float: left;width: 50%">
                Password
            </div>

            <div style="float: none;width: auto;overflow: hidden;">
                <input type="password" minlength="6" title="minimo 6 caracteres" name="password" required/>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <input type="hidden" name="__method__" value="login">
            <button class="button bg-primary text-white mt-5" type="submit" name="inicioSesion">Iniciar
            </button>
        </div>

    </form>

    <%@ include file="/WEB-INF/jsp/fragmentos/footer.jspf" %>

</div>

</body>
</html>