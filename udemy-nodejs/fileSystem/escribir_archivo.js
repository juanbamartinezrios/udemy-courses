var fs = require("fs");

var texto = "";

var crearArchivo = function() {
    fs.writeFile("archivo_escrito.txt", texto, function(err) {
        if (err) {
            throw err;
        } else {
            console.log("El archivo fue creado exitosamente.");
            process.exit();
        }
    });
};

console.log("Ingrese el texto que desee escribir en el archivo y finalice el mismo con el texto 'Fin de archivo'");

process.stdin.on("data", function(data){
	if (data.toString().toLowerCase().replace(/\s/g, "")  == 'findearchivo'){
		crearArchivo();
	} else {
		texto = texto.concat(data.toString());
	}
});

