<%@ page import="org.iesbelen.dao.UsuarioDAO" %>
<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Usuarios</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }

        #contenedor {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

    <%@ include file="../fragmentos/estilos.jspf" %>

</head>
<body>

<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>

<div id="contenedora" style="float:none; margin: 0 auto; width: 900px;">
    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1>Usuarios</h1>
        </div>
        <div style="float: none; width: auto; overflow: hidden; min-height: 80px; position: relative;">
            <div style="position: absolute; left: 39%; top: 39%;">
                <form action="${pageContext.request.contextPath}/tienda/usuarios/crear">
                    <input type="submit" value="Crear">
                </form>
            </div>
        </div>
    </div>

    <div class="clearfix">
        <hr/>
    </div>

    <div class="clearfix">
        <div style="float: left; width: 25%">ID_USUARIO</div>
        <div style="float: left; width: 25%">USUARIO</div>
        <div style="float: left; width: 25%">PASSWORD</div>
        <div style="float: none; width: auto; overflow: hidden;">ROL</div>
    </div>

    <div class="clearfix">
        <hr/>
    </div>

    <%
        if (request.getAttribute("listaUsuarios") != null) {
            List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listaUsuarios");

            for (Usuario usuario : listaUsuarios) {
    %>

    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left; width: 25%">
            <%= usuario.getIdUsuario() %>
        </div>
        <div style="float: left; width: 25%">
            <%= usuario.getIdUsuario() %>
        </div>
        <div style="float: left; width: 25%">
            <%= usuario.getPassword().substring(0, 4) %>
        </div>
        <div style="float: left; width: 25%">
            <%= usuario.getRol() %>
        </div>
        <div style="float: none; width: auto; overflow: hidden;">
            <form action="${pageContext.request.contextPath}/tienda/usuarios/<%= usuario.getIdUsuario() %>"
                  style="display: inline;">
                <input type="submit" value="Ver Detalle"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/usuarios/editar/<%= usuario.getIdUsuario() %>"
                  style="display: inline;">
                <input type="submit" value="Editar"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/usuarios/borrar/" method="post"
                  style="display: inline;">
                <input type="hidden" name="__method__" value="delete"/>
                <input type="hidden" name="codigo" value="<%= usuario.getIdUsuario() %>"/>
                <input type="submit" value="Eliminar"/>
            </form>
        </div>
    </div>

    <%
        }
    } else {
    %>
    No hay registros de fabricante
    <% } %>

</div>

<%@ include file="/WEB-INF/jsp/fragmentos/footer.jspf" %>

</body>
</html>
