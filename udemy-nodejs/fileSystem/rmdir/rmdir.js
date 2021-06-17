var fs = require("fs");

var archivos = fs.readdirSync("archivos_relleno");
console.log("Archivos dentro de la carpeta 'archivos_relleno'", archivos);

fs.readdir("archivos_relleno", function(err, archivos){
	if (err){
		throw err;
	} else {
		console.log("Archivos dentro de la carpeta 'archivos_relleno'", archivos);
	}
});
console.log("Leyendo los archivos del directorio 'archivos_relleno' (no sincrónico)");