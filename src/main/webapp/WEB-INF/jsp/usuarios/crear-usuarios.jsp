<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Usuario</title>
    <style>
        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }

    </style>
</head>
<body>

<div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
    <form action="${pageContext.request.contextPath}/tienda/usuarios/crear/" method="post">
        <div class="clearfix">
            <div style="float: left; width: 50%">
                <h1>Crear Usuario</h1>
            </div>
            <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                <div style="position: absolute; left: 39%; top : 39%;">
                    <input type="submit" value="Crear"/>
                </div>

            </div>
        </div>

        <div class="clearfix">
            <hr/>
        </div>

        <div style="margin-top: 6px;" class="clearfix">
            <div style="float: left;width: 50%">
                Usuario
            </div>
            <div style="float: none;width: auto;overflow: hidden;">
                <input name="usuario" />
            </div>
            <div style="float: left;width: 50%">
                Password
            </div>
            <div style="float: none;width: auto;overflow: hidden;">
                <input name="password" />
            </div>
            <div style="float: left;width: 50%">
                Rol
            </div>
            <div style="float: none;width: auto;overflow: hidden;">
                <select name="rol">
                    <option name="admin">Admin</option>
                    <option name="usuario">Usuario</option>
                </select>
            </div>
        </div>

    </form>
</div>

</body>
</html>