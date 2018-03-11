<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <title>Sample title</title>
    </head>
    <body>
        <g:form controller="BuscarPaciente" action="buscar" method="post" class="navbar-form navbar-right">
            <div class="form-group">
                <input type="number" class="form-control" name="nro_docu" placeholder="DNI Paciente">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="apellido" placeholder="Apellido">
            </div>
                <button type="submit" name="buscar" class="btn btn-default">Buscar</button>
        </g:form>
    </body>
</html>
