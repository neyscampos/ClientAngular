<!doctype html>
<html ng-app="app">

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.4/angular-route.js"></script>

</head>

<body>
	<p />
	<ul>
		<li><a href="#/!">Main</a></li>
		<li><a href="#/inclusao">inclusao</a></li>
		<li><a href="#/listar"></a>listar</li>
	</ul>


	<hr />

	<br />
	<br />Respostas :
	<br />
	<div ng-view></div>
</body>


<script type="text/javascript">
	var app = angular.module('app', '["ngRoute"]');
	app.config(function($routeProvider) {
		$routeProvider

		.when("/", {
			templateUrl : "main.html",
		}).when("/inclusao", {
			templateUrl : "inclusao.html",
			controller : "gravarctl"
		}).when("/listar", {
			templateUrl : "listar.html",
			controller : "listarctl"
		});
	});

	app.controller("gravarctl", function($scope, $http) {

		$scope.pessoa = {
			codigo : '',
			nome : '',
			sexo : '',
			idade : ''
		};
		$scop.cadastrar = function() {
			$http.get(
					"http://localhost:8080/ServAngular/json/pessoa/gravar"
							+ $scope.pessoa.nome + "/" + $scope.pessoa.sexo
							+ "/" + $scope.pessoa.idade).success(function(msg) {
				$scope.message = msg;
			});
			//limpar
			$scope.pessoa = {
				codigo : '',
				nome : '',
				sexo : '',
				idade : ''
			};
		}
	});

	app.controller("listarctl", function($scope, $http) {

		$scope.pessoa = {
			codigo : '',
			nome : '',
			sexo : '',
			idade : ''
		};
		$scop.cadastrar = function() {
			$http.get("http://localhost:8080/ServAngular/json/pessoa/listar")
					.success(function(dados) {
						$scope.linha = dados;
					});
			//limpar
			$scope.pessoa = {
				codigo : '',
				nome : '',
				sexo : '',
				idade : ''
			};
		}
	});
</script>
</html>