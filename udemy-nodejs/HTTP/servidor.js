var http = require("http");
var fs = require("fs");
// direccion IP donde va a estar el servidor
var host = "127.0.0.1";
// puerto donde se van a escuchar los llamados
var port = "8080";

// callback que se va a llamar cuando el servidor esté creado
// req --> el llamado que se le hizo al sv
// resp --> la respuesta del sv
var servidor = http.createServer(function(req, resp) {
    /*
    console.log(req);
    console.log(resp);
    */
    console.log(req.method + " --> " + req.url);
    if (req.url == "/") {
        fs.readFile("./index.html", "UTF-8", function(err, data) {
            if (err) {
                throw err;
            } else {
                resp.writeHead(200, { "Content-Type": "text/html" });
                resp.end(data);
            }
        });
    } else if (req.url.match(/.png$/)) {
        fs.readFile("." + req.url, function(err, data) {
            if (err) {
                resp.writeHead(404, { "Content-Type": "text/html" });
                resp.end("<h1>La imagen solicitada no existe.</h1>");
            } else {
                resp.writeHead(200, { "Content-Type": "image/png" });
                resp.end(data);
            }
        });

    } else if (req.url.match(/.css$/)) {
        fs.readFile("." + req.url, "UTF-8", function(err, data) {
            if (err) {
                throw err;
            } else {
                resp.writeHead(200, { "Content-Type": "text/css" });
                resp.end(data);
            }
        });
    } else {
        fs.readFile("./404_err.html", "UTF-8", function(err, data) {
            if (err) {
                throw err;
            } else {
                resp.writeHead(404, { "Content-Type": "text/html" });
                // end --> cuando la respuesta del sv termine
                resp.end(data);
            }
        });
    }
});

// listen --> se le pasa el puerto sobre el cual escuchar, el host y un callback para cuando el sv arranque
servidor.listen(port, host, function() {
    console.log("El servidor está corriendo en: " + host + ":" + port);
});