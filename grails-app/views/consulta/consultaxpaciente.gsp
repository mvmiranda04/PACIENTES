<%@ page import="pacientes.Paciente" %>
<%@ page import="pacientes.Medicamento" %>

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

									<g:sortableColumn property="tratamiento" title="${message(code: 'consulta.tratamiento.label', default: 'Tratamiento')}" />

                  <g:sortableColumn property="medicamento" title="${message(code: 'consulta.tratamiento.label', default: 'Medicamentos')}" />

                  <g:sortableColumn property="practicas" title="${message(code: 'consulta.tratamiento.label', default: 'Practicas')}" />
								</tr>
							</thead>
							<tbody>
							<g:each in="${consultaList}" status="i" var="consultaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                  <td><g:link action="show" id="${consultaInstance.id}"><g:formatDate format="yyyy-MM-dd" date="${consultaInstance?.fecha_consulta}" /></g:link></td>
									<td>${fieldValue(bean: consultaInstance, field: "hora_consulta")}</td>

									<td>${fieldValue(bean: consultaInstance, field: "diagnostico")}</td>

									<td>${fieldValue(bean: consultaInstance, field: "motivo_consulta")}</td>

									<td>${fieldValue(bean: consultaInstance, field: "tratamiento")}</td>

                  <td><g:if test="${consultaInstance?.medicamento}">
                      <!-------------------------------------------------------------------- -->
                      <div class="container">
                      <!-- Trigger the modal with a button -->
                      <button type="button" class="btn btn-default btn-lg" id="myBtn">Ver Medicamentos</button>

                      <!-- Modal -->
                      <div class="modal fade" id="myModal" role="dialog">
                      <div class="modal-dialog">

                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-header" style="padding:35px 50px;">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4><span class="glyphicon glyphicon-lock"></span> MEDICAMENTOS</h4>
                        </div>
                      <div class="modal-body" style="padding:40px 50px;">
                        <div class="container">
                          <table class="table">
                              <thead>
                                  <tr>
                                      <th>Medicamento</th>
                                      <th>Indicacion</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <g:if test="${consultaInstance?.medicamento}">
                                      <g:each in="${consultaInstance.medicamento}" var="m">
                                        <tr>
                                            <td>${fieldValue(bean: m.medicamento, field: "des_medicamento")}</td>
                                            <td>${fieldValue(bean: m, field: "indicaciones")}</td>
                                        </tr>
                                      </g:each>
                                    </g:if>
                                </tbody>
                            </table>
                          </div>
                          </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                    </div>
                    </div>

                    </div>
                    </div>
                    </div>

                    <script>
                        $(document).ready(function(){
                            $("#myBtn").click(function(){
                                $("#myModal").modal();
                            });
                        });
                    </script>

                    <!-------------------------------------------------------------------- -->
                    </g:if></td>

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
