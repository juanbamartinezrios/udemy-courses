var fs = require("fs");

fs.unlink("text.txt", function(err){
	if (err){
		throw err;
	} else {
		console.log("El archivo se eliminó con éxito.");
	}
});
