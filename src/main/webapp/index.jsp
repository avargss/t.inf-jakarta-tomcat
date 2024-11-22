<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        #contenedor {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        <%@include file="WEB-INF/jsp/fragmentos/estilos.jspf" %>
    </style>

</head>
<body>

<%@ include file="WEB-INF/jsp/fragmentos/estilos.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/header.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/nav.jspf" %>

<main>
    <section>
        <div class="d-grid gap-2" style="margin: 100px 100px 210px 100px" id="contenedor">
            <a class="btn btn-primary btn-lg"
               href="<%=application.getContextPath()%>/tienda/fabricantes">FABRICANTES</a>
            <a class="btn btn-success btn-lg" href="<%=application.getContextPath()%>/tienda/productos">PRODUCTOS</a>
            <a class="btn btn-danger btn-lg" href="<%=application.getContextPath()%>/tienda/usuarios">USUARIOS</a>
        </div>
    </section>
</main>


<%@include file="boostrap.jspf" %>
<%@ include file="/WEB-INF/jsp/fragmentos/footer.jspf" %>

</body>
</html>