<!DOCTYPE html>
<html ng-app="app">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.4/angular-route.js"></script>
</head>
<body>
   <p/>
     <ul>
           <li><a href="#/!">main</a></li>
           <li><a href="#!inclusao">inclusao</a></li>
           <li><a href="#!listar">listar</a></li>
     </ul>

<br/><br/>Respostas :<br/>
 <hr/>
<div  ng-view>



</div>
</body>


<script>
   var app= angular.module('app',["ngRoute"]);
   
   app.config(function ($routeProvider){
	                    $routeProvider
	                    
	     .when("/", {
               templateUrl :	"main.html" ,    	 
	     })
	     .when("/inclusao", {
             templateUrl :	"inclusao.html" ,
             controller :  "gravarctl"
	     })
     .when("/listar", {
             templateUrl : "listar.html" ,
             controller :  "listarctl"
	     });
  });
   
   
  app.controller("gravarctl", function($scope, $http){
	  //essa é a classe
	$scope.model={ codigo : '',   nome : '',   sexo : '',  idade : ''     };
	      
	  $scope.cadastrar = function(){
		  
	  $http.get("http://localhost:8080/ServAngular/json/pessoa/gravar/" +
	   $scope.model.nome + "/" +$scope.model.sexo + "/"+ $scope.model.idade  	 
	             	 )
	        	      .then(function(msg){
	                   $scope.message = msg.data; 
	        	 }).catch(function(msg){
	                  $scope.message = msg.data;
	   	   	      });
	  
	   //area de limpaeza dos Campos ...
	          $scope.model.nome="";
	          $scope.model.sexo="";
	          $scope.model.idade="";
	      
	      }
  });
  
  
  
  
  app.controller("listarctl", function($scope, $http){
	  
	  $scope.consultar = function(){
	          $http.get("http://localhost:8080/ServAngular/json/pessoa/listar"   	 
	             	 )
	        	 .then(function(dados){
	        		  $scope.listagem= dados.data;  
	        	 });
	   }
	  
	  
	  
	  $scope.excluir = function(cod){
          $http.get("http://localhost:8080/ServAngular/json/pessoa/excluir/"
        		  + cod
             	 )
        	 .then(function(dados){
        		  $scope.listagem= dados.data;  
        	 });
          window.location.reload();
          $scope.mensagem= "Dados Excluidos ...";
   		}
  });
   

</script>





</html>