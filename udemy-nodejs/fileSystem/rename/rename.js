var fs = require("fs");

// (ruta del archivo/carpeta a renombrar, ruta (o nueva ruta) del archivo/carpeta renombrado, callback)
fs.rename("archivos/renombrar.txt", "archivos/archivo_renombrado.txt", function(err){
	if (err){
		throw err;
	} else {
		console.log("Archivo renombrado con éxito.");
	}
});

fs.rename("archivos/sub_archivos1/sub_archivo1.txt", "archivos/sub_archivos2/sub_archivos1_movido.txt", function(err){
	if (err){
		throw err;
	} else {
		console.log("Archivo movido con éxito.");
	}
});