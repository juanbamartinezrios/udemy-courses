var fs = require("fs");

// readFileSyc --> se utiliza para leer archivos de configuración y luego comenzar con las tareas
var archivo = fs.readFileSync("prueba.json", "UTF-8");

console.log("Archivo de configuración (leído sincrónicamente): ",archivo);

var config = JSON.parse(archivo);

console.log("Nombre de usuario: "+config.user_name);