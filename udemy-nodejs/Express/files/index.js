var express = require("express");
var app = express();
var path = require('path');

// se pueden servir esos archivos de forma estática
app.use(express.static(path.dirname(__dirname) + '/public'));
// cargar contenido estático definiendo un camino "virtual"
//app.use("/virtual", express.static(path.dirname(__dirname) + '/public'));

app.get("/", function(req, resp){
	resp.sendFile(__dirname + "/" + "index.html");
});

app.listen(3000, function(){
	console.log("Aplicación corriendo en el puerto 3000.");
});