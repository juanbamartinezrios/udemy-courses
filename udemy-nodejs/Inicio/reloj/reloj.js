var EventEmitter = require("events").EventEmitter;
var util = require("util"); // permite heredar la funcionalidad de una clase a otra clase

// se define la clase Reloj que sólo va a tener una función que va a emitir un evento cada segundo
var Reloj = function(){
	var self = this;
	var i = 1;
	setInterval(function(){
		self.emit("tick-tock", i++);
	}, 1000);
};

// La clase Reloj hereda la funcionalidad de la clase EventEmitter.
// Se utiliza el módulo util --> se le pasa la clase que va a heredar la funcionalidad y luego la clase de la cual se hereda la funcionalidad
util.inherits(Reloj, EventEmitter);
module.exports = Reloj;