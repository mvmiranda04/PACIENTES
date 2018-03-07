<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pacientes</title>
                <asset:stylesheet src="style.css"/>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="page-body" role="main">
			<%--<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>--%>
                        <div class="example">
                            <ul id="nav">
                                <li class="current"><g:link controller="paciente" >Pacientes</g:link></li>

                                <li><a href="">Administracion</a>
                                    <ul>
                                        <li><g:link controller="monodrogas" >AMB Monodroga</g:link></li>
                                        <li><g:link controller="medicamento" >AMB Medicamentos</g:link></li>
                                     </ul>
                                </li>
                                <li><a href="http://www.script-tutorials.com/category/jquery/">Acerca De</a></li>
                                <li><a href="http://www.script-tutorials.com/category/javascript/">Cerrar sesion</a></li>
                            </ul>
                        </div>
		</div>
	</body>
</html>
