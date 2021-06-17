/*
require("ruta de modulo") importa el módulo

require("nombre_modulo") si el modulo está instalado en node_modules
*/
var conversion = require("conversion");
var p = 3;

process.stdout.write("Ingrese cantidad de pulgadas: \n");
process.stdin.on("data", function(data) {
    var p = parseInt(data.toString().trim());
    if (p != null) {
        console.log(p + " pulgadas son " + conversion.pulgadasMetros(p) + " metros.\n");
        process.exit();
    }
});

var millasMetros = function() {
    process.stdout.write("Ingrese cantidad de millas: \n");
    process.stdin.on("data", function(data) {
        var m = parseInt(data.toString().trim());
        if (m != null) {
            console.log(m + " millas son " + conversion.millasMetros(m) + " metros.\n");
            process.exit();
        }
    });
}


/*
Cuando se precisa algo que sea capaz de recibir más de un llamado, se utilizan EventEmitters
*/
var events = require("events");
var EventEmitter = events.EventEmitter;
var ee = new EventEmitter();