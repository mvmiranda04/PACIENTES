<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-paciente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-paciente" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

           <div class="fieldcontain">
                <label for="apellido">Apellido y Nombre</label>
                <f:display bean="paciente"  property="apellido"/> <f:display bean="paciente"  property="nombre"/>
            </div>
            <div class="fieldcontain">
                <label for="dni">Tipo y Nro DNI</label>
                <f:display bean="paciente" property="tipo_docu"/><f:display bean="paciente"  property="nro_docu"/>
            </div>
            <div class="fieldcontain">
                <label for="sexo">Sexo</label>
                <f:display bean="paciente" property="sexo"/>
            </div>
            <div class="fieldcontain">
                <label for="dni">Fecha Nac.</label>
                <f:display bean="paciente" property="fecha_nac">
                    <g:formatDate format="yyyy-MM-dd"  date="${value}"/>
                </f:display>
            </div>
            <div class="fieldcontain">
                <label for="domicilio">Domicilio</label>
                <f:display bean="paciente" property="domicilio"/>
            </div>
            <div class="fieldcontain">
                <label for="telefono">Telefono</label>
                <f:display bean="paciente" property="telefono"/>
            </div>
            <div class="fieldcontain">
                <label for="email">email</label>
                <f:display bean="paciente" property="email"/>
            </div>
            <div class="fieldcontain">
                <label for="observaciones">Observaciones</label>
                <f:display bean="paciente" property="observaciones"/>
            </div>

                <g:form resource="${this.paciente}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.paciente}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        <g:link class="consultas" controller="consulta" action="consultasxpaciente" id="${this.paciente.id}"><g:message code="default.button.consultas.label" default="Consultas" /></g:link>
                    </fieldset>
                </g:form>
        </div>
    </body>
</html>
