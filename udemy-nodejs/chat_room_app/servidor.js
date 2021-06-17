var express = require("express");
// socket.io lo precisa
var http = require("http");
var socket = require("socket.io");

var app = express();
var servidor = http.createServer(app);

var users = [];

servidor.listen(3000, function() {
    console.log("El servidor está corriendo en el puerto 3000");
});

// se le pasa el servidor para poder escuchar si hay algún evento en el socket
var io = socket.listen(servidor);


// se "sirve" la vista
app.get("/", function(req, resp) {
    resp.sendFile(__dirname + "/cliente.html");
});

// se escucha lo que está pasando en el socket
io.on("connection", function(socket) {
    // evento que proviene desde el cliente
    socket.on("newUser", function(usuario, callback) {
        if (users.indexOf(usuario) != -1) {
            callback(false);
        } else {
            callback(true);
            // variable que existe dentro de socket.. la creo y le asigno el valor del evento
            socket.usuario = usuario;
            users.push(usuario);
            actualizarListaUsuarios();
            io.emit("message", {message: "se ha conectado", usuario: socket.usuario});
        }
    });

    // se recibe nuevo mensaje del cliente al servidor
    socket.on("newMessage", function(message) {
        // se emite evento para que ese mensaje sea recibido por todos los clientes (y también se pasa el usaurio que mandó el mensaje)
        io.emit("message", { message: message, usuario: socket.usuario });
    });

    function actualizarListaUsuarios() {
        // la funcion emite el evento y pasa la lista de usuarios
        io.emit("actualizarListaUsuarios", users);
    }

    socket.on("disconnect", function(data){
        users.splice(users.indexOf(socket.usuario), 1);
        io.emit("message", {message: "se ha desconectado", usuario: socket.usuario});
        actualizarListaUsuarios();
    });
});