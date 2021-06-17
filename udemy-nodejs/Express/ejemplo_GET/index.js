var express = require("express");
var app = express();

app.get("/", function(req, resp) {
    console.log("Se hizo un llamado GET.");
});

// permite ver el formulatio si se hace un request a esa página desde el browser
app.get("/form.html", function(req, resp) {
	// se envía la respuesta con el archivo que se quiere leer
    resp.sendFile(__dirname + "/" + "form.html");
});

app.get("/paginaGET", function(req, resp) {
	// se extraen los parámetros del request GET con 'query'
    var n = req.query.nombre;
    var a = req.query.apellido;
    resp.send("El nombre completo es: " + n + " " + a);
});

app.listen(3000, function() {
    console.log("La aplicación está corriendo en el puerto 3000.");
});