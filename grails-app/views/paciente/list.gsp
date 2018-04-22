<html>
	<head>
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.8.14.custom.css')}" />
        <g:javascript library="jquery.min" />
        <g:javascript library="jquery-ui-1.8.14.custom.min" />
		<g:javascript>
			$(document).ready(function() {
			   $('#city').autocomplete({
				 source: '<g:createLink controller='paciente' action='ajaxFindCity'/>'
			   });

			});
		</g:javascript>
	</head>
	<body>

	<div class="demo">

	<div class="ui-widget">
		<label for="city">city: </label>
		<input id="city">
	</div>

	</div>

	</body>
</html>
