var express = require("express");
var bodyParser = require("body-parser");
var session = require("cookie-session");

// instanciando 
var app = express();
var tareas = [];

// se usa para guardar la sesión de forma segura
app.use(session({ secret: "nodejs" }));
// se le dice al bodyParser que la codificación que se espera es desde el browser, no JSON (no tipo extendido)
app.use(bodyParser.urlencoded({ extended: false }));
// ayuda a crear templates
app.set("view engine", "ejs");

// POST al darle submit al formulario
// se toma el valor del input newTask y se guarda en el array de tareas
app.post("/new", function(req, resp){
	console.log("--Elemento '"+req.body.newTask+"' agregado");
	var t = req.body.newTask;
	tareas.push(t);
	resp.redirect("/");
});

// se toma la información que va en la variable id
app.get("/delete/:id", function(req, resp){
	console.log("--Elemento "+req.params.id+" eliminado");
	tareas.splice(req.params.id, 1);
	resp.redirect("/");
});

app.listen(3000, function(){
	console.log("--Corriendo en el puerto 3000");
});

app.get("/", function(req, resp){
	resp.render("form.ejs", {tareas: tareas});
});