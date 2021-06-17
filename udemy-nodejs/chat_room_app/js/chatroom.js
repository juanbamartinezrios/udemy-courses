var io = require("socket.io");
var socket = io.connect();

var formularioUsuario = $("#formularioUsuario");
var formularioChat = $("#formularioChat");

var usuario = $("#usuario");
var listaUsuarios = $("#listaUsuarios");

var mensaje = $("#mensaje");
var chat = $("#ventanaChat");

// cuando se haga submit del formUsuario se emite el evento newUser
formularioUsuario.submit(function(evento) {
    evento.preventDefault();
    socket.emit('newUser', usuario.val(), function(data) {
        if (data) {
            $('#error').hide();
            $('#seccionUsuario').hide();
            $('#seccionPrincipal').show();
        } else {
            $('#error').html('El usuario ya existe.');
            $('#error').show();
        }
    });
    usuario.val('');

    // al escuchar el evento actualizarListaUsuarios, modifica el html obteniendo la lista de usuarios en el servidor y listándolos
    socket.on('actualizarListaUsuarios', function(usuarios) {
        var html = '';
        usuarios.forEach(function(usuario) {
            html += usuario + '<br />';
        });
        listaUsuarios.html(html);
    });

    // cuando se haga submit del formChat se emite el evento newMessage
    formularioChat.submit(function(evento) {
        evento.preventDefault();
        socket.emit('newMessage', mensaje.val());
        mensaje.val('');
    });

    socket.on('message', function(data) {
        chat.append('<strong>' + data.usuario + '</strong> - ' + data.message + '<br/>');
    });
});