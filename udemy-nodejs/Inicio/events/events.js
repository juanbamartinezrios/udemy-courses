/*
callbacks --> sirve para sólo un llamado
evenEmitters --> sirve para recibir y manejar varios llamados
*/

var events = require("events");
var eventEmitter = events.EventEmitter;

var obj = new eventEmitter();

// escuchando por el evento (la primera vez que se emita)
obj.once("cansado", function(data){
	console.log("El jugador está cansado por primera vez. El jugador es el número " + data);
});

// escuchando por el evento
obj.on("cansado", function(data){
	console.log("El jugador está cansado. El jugador es el número " + data);
});


obj.on("lesionado", function(data){
	console.log("El jugador " + data + " está lesionado");
});

// emitiendo el evento
obj.emit("cansado", "10");
obj.emit("lesionado", "10");
obj.emit("cansado", "2");

// remover todos los listeners del evento "nombre_evento" hasta este punto
// remover todos los listeners --> obj.removeAllListeners();
obj.removeAllListeners("cansado");

obj.emit("cansado", "3");
obj.emit("lesionado", "3");
obj.emit("cansado", "9");