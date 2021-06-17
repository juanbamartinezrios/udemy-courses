/*
Paquetes que contienen cierta funcionalidad que se pueden incluir en proyectos.
Se cargan utilizando 'require'

var modulo = require('nombre_modulo');
--> para modulos del núcleo o instados con NPM

var modulo = require('./../modulo');
var modulo = require('/../modulo');
--> para cargar nuestros módulos

NodeJS busca módulos desde: 
-módulos del núcleo
-caminos absolutos o relativos ('/' o './')
	-como archgivo '.js' o '.node'
	-como directorio '/package.json' o '/index.js'
-módulo instalado con NPM
	-'/node_modules'


-Instalación de módulos por NPM de forma local (para proyecto):
'npm ls' en consola para ver módulos instalados en el directorio
npm install nombre_modulo

-Desinstalar módulos por NPM:
npm uninstall nombre_modulo

-Actualizar módulos por NPM:
npm update nombre_modulo
npm update (para actualizar todos los módulos)
*/