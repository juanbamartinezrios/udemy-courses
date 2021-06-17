var sId = setTimeout(function() {
    console.log("Corriendo...");
}, 1000);

//Cancelar el timeout mediante su ID
clearTimeout(sId);

//Corre la función cada cierto tiempo hasta que se indique que pare
var count = 0;
var sId2 = setInterval(function() {
    count += 1;
    console.log("Corriendo... " + count);
    if (count == 10) {
        console.log("Terminado");
        console.log("clearInterval");
        clearInterval(sId2);
    }
}, 1000);