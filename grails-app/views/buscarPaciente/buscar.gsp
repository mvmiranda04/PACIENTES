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
                <button type="submit" name="buscar" class="glyphicon glyphicon-search">Buscarrrrr</button>
                <button type="button" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Search
                </button>

        </g:form>
        <table>
			<thead>
					<tr>

						<g:sortableColumn property="tipo_docu" title="${message(code: 'paciente.tipo_docu.label', default: 'Tipodocu')}" />

						<g:sortableColumn property="nro_docu" title="${message(code: 'paciente.nro_docu.label', default: 'Nrodocu')}" />

						<g:sortableColumn property="apellido" title="${message(code: 'paciente.apellido.label', default: 'Apellido')}" />

						<g:sortableColumn property="nombre" title="${message(code: 'paciente.nombre.label', default: 'Nombre')}" />

						<g:sortableColumn property="sexo" title="${message(code: 'paciente.sexo.label', default: 'Sexo')}" />

						<g:sortableColumn property="email" title="${message(code: 'paciente.email.label', default: 'Email')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${pacienteInstanceList}" status="i" var="pacienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link controller="Paciente" action="show" id="${pacienteInstance.id}">${fieldValue(bean: pacienteInstance, field: "tipo_docu")}</g:link></td>

						<td>${fieldValue(bean: pacienteInstance, field: "nro_docu")}</td>

						<td>${fieldValue(bean: pacienteInstance, field: "apellido")}</td>

						<td>${fieldValue(bean: pacienteInstance, field: "nombre")}</td>

						<td>${fieldValue(bean: pacienteInstance, field: "sexo")}</td>

						<td>${fieldValue(bean: pacienteInstance, field: "email")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>


    </body>
</html>
