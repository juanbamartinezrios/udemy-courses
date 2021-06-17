var fs = require("fs");

// readdir --> lectura del contenido de un directorio
fs.readdir("archivos", function(err, arc){
	if (err){
		throw err;
	} else {
		console.log(arc);
		console.log("\n");
	}
});


var archivos = fs.readdirSync("archivos");
console.log("Readdir sincrónico:");
console.log(archivos);
console.log("\n");

console.log("Readdir asíncrono:");
