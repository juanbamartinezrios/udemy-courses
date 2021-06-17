var nombre = "Ricardo Centurion";
var numero = 10;

console.log("Hola");
setTimeout(function cb(){
	console.log("Tiempo");
	console.log(`El es ${nombre} y el número es: ${numero}`);
}, 5000);
console.log("Chau");

console.log("El path:",__filename);
console.log("El path antes de llegar al archivo (el directorio):",__dirname);

