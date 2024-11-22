<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="org.iesbelen.model.Fabricante" %>
<%@page import="java.util.List" %>
<%@ page import="org.iesbelen.model.FabricanteDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fabricantes</title>
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

        <%@ include file="../fragmentos/estilos.jspf" %>
    </style>

</head>
<body>

<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>

<div id="contenedora" style="float:none; margin: 0 auto; width: 900px;">
    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1>Fabricantes</h1>
        </div>
        <div style="float: none; width: auto; overflow: hidden; min-height: 80px; position: relative;">
            <div style="position: absolute; left: 39%; top: 39%;">
                <form action="${pageContext.request.contextPath}/tienda/fabricantes/crear">
                    <input type="submit" value="Crear">
                </form>
            </div>
        </div>
    </div>

    <div class="clearfix">
        <hr/>
    </div>

    <div class="clearfix">
        <div style="float: left; width: 25%">Código</div>
        <div style="float: left; width: 25%">Nombre</div>
        <div style="float: left; width: 25%">Cantidad</div>
        <div style="float: none; width: auto; overflow: hidden;">Acción</div>
    </div>

    <div class="clearfix">
        <hr/>
    </div>

    <%
        if (request.getAttribute("listaFabricantes") != null) {
            List<FabricanteDTO> listaFabricante = (List<FabricanteDTO>) request.getAttribute("listaFabricantes");

            for (FabricanteDTO fabricante : listaFabricante) {
    %>

    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left; width: 25%">
            <%= fabricante.getIdFabricante() %>
        </div>
        <div style="float: left; width: 25%">
            <%= fabricante.getNombre() %>
        </div>
        <div style="float: left; width: 25%">
            <%= fabricante.getNumProducto() %>
        </div>
        <div style="float: none; width: auto; overflow: hidden;">
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/<%= fabricante.getIdFabricante() %>"
                  style="display: inline;">
                <input type="submit" value="Ver Detalle"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/editar/<%= fabricante.getIdFabricante() %>"
                  style="display: inline;">
                <input type="submit" value="Editar"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/borrar/" method="post"
                  style="display: inline;">
                <input type="hidden" name="__method__" value="delete"/>
                <input type="hidden" name="codigo" value="<%= fabricante.getIdFabricante() %>"/>
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

    <form method="get" action="${pageContext.request.contextPath}/tienda/fabricantes/">
        <fieldset>
            <legend>Ordenar por</legend>
            <select name="ordenarPor" id="ordenarPor">
                <option value="nombre">Nombre</option>
                <option value="codigo">Código</option>
            </select>

            <select name="modoOrdenar" id="modoOrdenar">
                <option value="asc">Ascendente</option>
                <option value="desc">Descendente</option>
            </select>

            <button type="submit" id="botonFinal">Aplicarlo</button>
        </fieldset>
    </form>
</div>

<%@ include file="/WEB-INF/jsp/fragmentos/footer.jspf" %>

</body>
</html>