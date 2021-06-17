var Reloj = require("./reloj.js");

var r = new Reloj();

r.on("tick-tock", function(data){
	if (data == 10){
		process.exit();
	} else {
		console.log(data.toString() + " segundos");
	}
});

r.once("tick-tock", function(){
	console.log("Evento por primera vez.")
});