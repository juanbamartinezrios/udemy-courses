/*
exports. exporta las funciones que se requieran del módulo
*/
exports.pulgadasMetros = function(pulgadas){
	return pulgadas * 0.0254;
}

exports.millasMetros = function(millas){
	return millas * 1609.34;
}

exports.yardasMetros = function(yardas){
	return yardas * 0.9144;	
}

exports.piesMetros = function(pies){
	return pies * 0.3048;
}