var express = require("express");
var app = express();

// ver si hay algún llamado "get" a la url 
app.get("/", function(req, resp){
	console.log("Se realizó un llamdo GET.");
	resp.send("Hola mundo!");
});

// escuchar el puerto 3000
app.listen(3000, function(){
	console.log("Aplicación corriendo en puerto 3000.");
});