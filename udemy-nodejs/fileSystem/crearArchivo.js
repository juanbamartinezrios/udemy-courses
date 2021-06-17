var fs = require("fs");

var texto = "Aprende Node.js Fácil";

// nombre_archivo, texto del archivo, función callback que se llama cuando el archivo sea escrito
// writeFile es asincrónico porque no tiene 'Sync' al final.. por eso se le pasa un callback
fs.writeFile("archivo_prueba.txt", texto, function(err){
	if (err){
		throw err;
	} else {
		console.log("El archivo fue creado");
	}
});

console.log("Comenzando a crear archivos.");