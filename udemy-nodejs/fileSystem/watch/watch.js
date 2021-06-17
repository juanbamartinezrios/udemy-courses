var fs = require("fs");

var txtFromFile = JSON.parse(fs.readFileSync("prueba.json", "UTF-8"));

console.log("Archivo original:");
console.log(txtFromFile);
console.log("\n");

// actual y anterior --> objetos de modulo de estadisticas
fs.watchFile("prueba.json", function(actual, anterior){
	console.log("El archivo 'prueba.json' cambió.");
	var newTxtFromFile = JSON.parse(fs.readFileSync("prueba.json", "UTF-8"));
	console.log(newTxtFromFile);
	console.log("\n");
});