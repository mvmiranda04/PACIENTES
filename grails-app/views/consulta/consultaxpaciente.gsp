<%@ page import="pacientes.Paciente" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-consulta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-consulta" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

                        <span class="property-label"><g:message code="consultaList.Paciente" default="Paciente" /></span>
                        ${consultaList[0].paciente?.apellido + " " + consultaList[0].paciente?.nombre}


    					<table>
						<thead>
								<tr>

									<g:sortableColumn property="fecha_consulta" title="${message(code: 'consulta.fecha_consulta.label', default: 'Fechaconsulta')}" />

									<g:sortableColumn property="hora_consulta" title="${message(code: 'consulta.hora_consulta.label', default: 'Horaconsulta')}" />

									<g:sortableColumn property="diagnostico" title="${message(code: 'consulta.diagnostico.label', default: 'Diagnostico')}" />

									<g:sortableColumn property="motivo_consulta" title="${message(code: 'consulta.motivo_consulta.label', default: 'Motivoconsulta')}" />

									<!--<th><g:message code="consulta.paciente.label" default="Paciente" /></th>-->

									<g:sortableColumn property="tratamiento" title="${message(code: 'consulta.tratamiento.label', default: 'Tratamiento')}" />

								</tr>
							</thead>
							<tbody>
							<g:each in="${consultaList}" status="i" var="consultaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


                                    <td><g:link action="show" id="${consultaInstance.id}"><g:formatDate format="yyyy-MM-dd" date="${consultaInstance?.fecha_consulta}" /></g:link></td>


									<td>${fieldValue(bean: consultaInstance, field: "hora_consulta")}</td>

									<td>${fieldValue(bean: consultaInstance, field: "diagnostico")}</td>

									<td>${fieldValue(bean: consultaInstance, field: "motivo_consulta")}</td>

									<!--<td>${fieldValue(bean: consultaInstance, field: "paciente")}</td>-->

									<td>${fieldValue(bean: consultaInstance, field: "tratamiento")}</td>

                                    <td><g:if test="${consultaInstance?.medicamento}">
                    				<li class="fieldcontain">
                    						<g:each in="${consultaInstance.medicamento}" var="m">
                    						                  <g:link controller="medicamentos_X_Consulta" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link>
                    						</g:each>
                    				</li>
                    				</g:if></td>
                                    <!--<g:if test="${consultaInstance?.medicamento}">
                    				<li class="fieldcontain">
                    					<span id="medicamento-label" class="property-label"><g:message code="consulta.medicamento.label" default="Medicamento" /></span>

                    						<g:each in="${consultaInstance.medicamento}" var="m">
                    						<span class="property-value" aria-labelledby="medicamento-label"><g:link controller="medicamentos_X_Consulta" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
                    						</g:each>

                    				</li>
                                </g:if>-->

								</tr>
							</g:each>
							</tbody>
						</table>
            <div class="pagination">
                <g:paginate total="${consultaCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
