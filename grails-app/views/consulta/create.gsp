<%@ page import="pacientes.Paciente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-consulta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-consulta" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.consulta}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.consulta}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.consulta}" method="POST">
                <!--<fieldset class="form">
                    <f:all bean="consulta"/>
                </fieldset>-->

                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'paciente', 'error')} required">
                	<label for="paciente">
                		<g:message code="consulta.paciente.label" default="Paciente" />
                		<span class="required-indicator">*</span>
                	</label>
                	<!--<g:select id="paciente" name="paciente.id" from="${pacientes.Paciente.list()}" optionKey="id" required="" value="${consultaInstance?.paciente?.id}" class="many-to-one"/>-->
                    <!--<g:select id="paciente" name="paciente.id" from="${pacientes.Paciente.list()}" optionKey="id" required="" value="${consultaInstance?.paciente?.apellido}"/>-->
                    <g:textField name="paciente.id"  value="${PacienteInstance?.paciente?.apellido}"/>


                    <span id="paciente-label" class="property-label"><g:message code="consulta.paciente.label" default="Paciente" /></span>

                    <!--<span class="property-value" aria-labelledby="paciente-label"><g:link controller="paciente" action="show" id="${consultaInstance?.paciente?.id}">${consultaInstance?.paciente?.encodeAsHTML()}</g:link></span>-->
                    <span class="property-value" aria-labelledby="paciente-label"><g:link controller="paciente" action="show" id="${consultaInstance?.paciente?.id}">${pacienteInstance?.paciente.apellido+' '+pacienteInstance?.paciente.nombre}</g:link></span>

                    <!--<g:textField name="paciente.id" value="${consultaInstance?.paciente?.apellido }"/>-->

                </div>

                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'fecha_consulta', 'error')} required">
                	<label for="fecha_consulta">
                		<g:message code="consulta.fecha_consulta.label" default="Fechaconsulta" />
                		<span class="required-indicator">*</span>
                	</label>
                	<g:datePicker name="fecha_consulta" precision="day"  value="${consultaInstance?.fecha_consulta}"  />

                </div>

                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'hora_consulta', 'error')} required">
                	<label for="hora_consulta">
                		<g:message code="consulta.hora_consulta.label" default="Horaconsulta" />
                		<span class="required-indicator">*</span>
                	</label>
                	<g:textField name="hora_consulta" required="" value="${consultaInstance?.hora_consulta}"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'diagnostico', 'error')} required">
                	<label for="diagnostico">
                		<g:message code="consulta.diagnostico.label" default="Diagnostico" />
                		<span class="required-indicator">*</span>
                	</label>
                	<g:textField name="diagnostico" required="" value="${consultaInstance?.diagnostico}"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'motivo_consulta', 'error')} required">
                	<label for="motivo_consulta">
                		<g:message code="consulta.motivo_consulta.label" default="Motivoconsulta" />
                		<span class="required-indicator">*</span>
                	</label>
                	<g:textField name="motivo_consulta" required="" value="${consultaInstance?.motivo_consulta}"/>

                </div>


                <div class="fieldcontain ${hasErrors(bean: consultaInstance, field: 'tratamiento', 'error')} required">
                	<label for="tratamiento">
                		<g:message code="consulta.tratamiento.label" default="Tratamiento" />
                		<span class="required-indicator">*</span>
                	</label>
                	<g:textField name="tratamiento" required="" value="${consultaInstance?.tratamiento}"/>

                </div>





                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
