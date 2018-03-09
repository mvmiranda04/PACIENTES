<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pacientes</title>
                <asset:stylesheet src="style.css"/>
	</head>
	<body>
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"></a>ApliPacientes
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><g:link controller="paciente" >Pacientes</g:link></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Administracion <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><g:link controller="monodrogas" >AMB Monodroga</g:link></li>
						<li><g:link controller="medicamento" >AMB Medicamentos</g:link></li>
					</ul>
				</li>
				<li><a href="#">Acerca De</a></li>
				<li><a href="#">Cerrar sesion</a></li>
			</ul>
		</div>
	</nav>
	</body>



</html>
