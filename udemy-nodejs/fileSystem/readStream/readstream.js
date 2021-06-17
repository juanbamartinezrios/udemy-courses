var fs = require("fs");

var archivo = "";
var stream = fs.createReadStream("archivos/samuel_l_quotes.txt");

// cuanto el evento "data" se ejecute, se escucha y se lanza un callback
stream.on("data", function(data){
	archivo += data;
	// stream.pause(); --> pausar la lectura del stream
	// stream.resume(); --> reanudar la lectura del stream
});

// cuando termina de leer el archivo
stream.on("end", function(){
	console.log("Tamaño total del archivo leído: "+archivo.length + "\n");
	console.log(archivo);
});