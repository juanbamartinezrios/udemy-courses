console.log("Argument Variable (argv) da acceso a las los argumentos que se le pasan a un proceso.");
console.log(process.argv);

function leerOpcion(opt){
	var index = process.argv.indexOf(opt);
	if (index != -1){
		return process.argv[index+1];
	} else {
		return false;
	}
}

var nombre = leerOpcion("-nombre");

console.log(`El valor de la opción '-nombre' es: ${nombre}`);
//STDOUT y STDIN nos permite comunicarnos con el proceso
//Standard Output write no genera nueva linea
process.stdout.write("Ingrese el apellido: ");
//Standard Input on espera por un evento. Cuando pase el evento, se ejecuta la función dictada.
//El evento que se espera es "data" y se le pasa un callback como función.
process.stdin.on("data", function(data){
	process.stdout.write(`El nombre completo es ${nombre} ${data}`);
	//Termina el proceso
	process.exit();
});