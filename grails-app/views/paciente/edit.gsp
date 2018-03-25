<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-paciente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-paciente" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.paciente}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.paciente}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.paciente}" method="PUT">
                <g:hiddenField name="version" value="${this.paciente?.version}" />
                <fieldset class="form">
                    <f:all bean="paciente"/>
                </fieldset>




                <ol class="property-list consulta">

          				<g:if test="${consultaInstance?.fecha_consulta}">
          				<li class="fieldcontain">
          					<span id="fecha_consulta-label" class="property-label"><g:message code="consulta.fecha_consulta.label" default="Fechaconsulta" /></span>

          						<span class="property-value" aria-labelledby="fecha_consulta-label"><g:formatDate date="${consultaInstance?.fecha_consulta}" /></span>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.hora_consulta}">
          				<li class="fieldcontain">
          					<span id="hora_consulta-label" class="property-label"><g:message code="consulta.hora_consulta.label" default="Horaconsulta" /></span>

          						<span class="property-value" aria-labelledby="hora_consulta-label"><g:fieldValue bean="${consultaInstance}" field="hora_consulta"/></span>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.diagnostico}">
          				<li class="fieldcontain">
          					<span id="diagnostico-label" class="property-label"><g:message code="consulta.diagnostico.label" default="Diagnostico" /></span>

          						<span class="property-value" aria-labelledby="diagnostico-label"><g:fieldValue bean="${consultaInstance}" field="diagnostico"/></span>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.medicamento}">
          				<li class="fieldcontain">
          					<span id="medicamento-label" class="property-label"><g:message code="consulta.medicamento.label" default="Medicamento" /></span>

          						<g:each in="${consultaInstance.medicamento}" var="m">
          						<span class="property-value" aria-labelledby="medicamento-label"><g:link controller="medicamentos_X_Consulta" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
          						</g:each>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.motivo_consulta}">
          				<li class="fieldcontain">
          					<span id="motivo_consulta-label" class="property-label"><g:message code="consulta.motivo_consulta.label" default="Motivoconsulta" /></span>

          						<span class="property-value" aria-labelledby="motivo_consulta-label"><g:fieldValue bean="${consultaInstance}" field="motivo_consulta"/></span>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.paciente}">
          				<li class="fieldcontain">
          					<span id="paciente-label" class="property-label"><g:message code="consulta.paciente.label" default="Paciente" /></span>

          						<span class="property-value" aria-labelledby="paciente-label"><g:link controller="paciente" action="show" id="${consultaInstance?.paciente?.id}">${consultaInstance?.paciente?.encodeAsHTML()}</g:link></span>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.practicas}">
          				<li class="fieldcontain">
          					<span id="practicas-label" class="property-label"><g:message code="consulta.practicas.label" default="Practicas" /></span>

          						<g:each in="${consultaInstance.practicas}" var="p">
          						<span class="property-value" aria-labelledby="practicas-label"><g:link controller="practica_X_Consulta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
          						</g:each>

          				</li>
          				</g:if>

          				<g:if test="${consultaInstance?.tratamiento}">
          				<li class="fieldcontain">
          					<span id="tratamiento-label" class="property-label"><g:message code="consulta.tratamiento.label" default="Tratamiento" /></span>

          						<span class="property-value" aria-labelledby="tratamiento-label"><g:fieldValue bean="${consultaInstance}" field="tratamiento"/></span>

          				</li>
          				</g:if>

          			</ol>





                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
