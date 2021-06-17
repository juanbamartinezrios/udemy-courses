var express = require("express");
var bodyParser = require("body-parser");
var app = express();

// recibe info del browser o API (jSON)
app.use(bodyParser.urlencoded({ extended: false }));

app.get("/", function(req, resp) {
    console.log("Se hizo un llamado GET.");
});

app.get("/form.html", function(req, resp) {
    resp.sendFile(__dirname + "/" + "form.html");
});

// leer parámetros que son enviados a la app desde un formulario POST
app.post("/recibirPOST", function(req, resp){
	var n = req.body.nombre;
	var a = req.body.apellido;
	resp.send("El nombre completo es: " + n + " " + a);
});

app.listen(3000, function() {
    console.log("La aplicación está corriendo en el puerto 3000.");
});