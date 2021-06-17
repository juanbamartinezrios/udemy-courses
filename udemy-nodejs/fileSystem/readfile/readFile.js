var fs = require("fs");

// readFile --> leer información de un archivo
fs.readFile("archivos/ejemplo.txt", "UTF-8", function(err, data){
	if (err){
		throw err;
	} else {
		console.log("Contenido: \n");
		console.log(data);
	}
});