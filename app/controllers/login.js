angular.module('sacApp',[])
  .controller('LoginCtrl',[function(){
  	var self = this;
  	self.submit = function(){
  		var operador = { login: self.login, senha: self.senha }
  		console.log('usuário clicou em entrar', operador);
  	}
  }])