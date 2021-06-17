var fs = require("fs");
var archArr = undefined;

fs.mkdir("lvl1", function(err) {
    if (err) {
        console.log("La carpeta 'lvl1' ya existe.");
    }
});
fs.mkdir("lvl2", function(err) {
    if (err) {
        console.log("La carpeta 'lvl2' ya existe.");
    }
});
fs.mkdir("lvl3", function(err) {
    if (err) {
        console.log("La carpeta 'lvl3' ya existe.");
    }
});

try {
    archArr = fs.readdirSync("temp");
    checkFiles();
} catch (error) {
    throw error;
}

function checkFiles() {
    archArr.forEach(function(a) {
        if (a.indexOf("_1") != -1) {
            moveFiles(a, "lvl1/");
        }
        if (a.indexOf("_2") != -1) {
            moveFiles(a, "lvl2/");
        }
        if (a.indexOf("_3") != -1) {
            moveFiles(a, "lvl3/");
        }
    });
    deleteFolder();
}

function moveFiles(nombre, hash) {
    fs.rename("temp/" + nombre, hash + nombre, function(err) {
        if (err) {
            console.log(nombre + " ya existe en el directorio.");
        } else {
            console.log(nombre + " movido al directorio: " + hash);
        }
    });
}

function deleteFolder() {
    fs.rmdir("temp", function(err) {
        if (err) {
            console.log("La carpeta 'temp' no existe.");
        } else {
            console.log("La carpeta 'temp' fue borrada.");
        }
    })
}