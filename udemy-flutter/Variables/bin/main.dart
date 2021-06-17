import 'package:Variables/Variables.dart' as Variables;

main(List<String> arguments) { // Punto de entrada para ejecución
  /*
    Tipos:
    String
    Number (int y double)
    Boolean
    lists
    maps
    ...

    Const y Final
    const = valor constante en tiempo de compilación
    final = valor constante SIEMPRE
   */

  var country = "Argentina";

  String name;
  name = "Juan Bautista";

  num age = 25;
  int cont = 0;
  double numero_double = 3/2;

  bool isTrue = true;
  bool isFalse = false;

  String name_person = "Juan";
  String lastname_person = "Martinez";
  int age_person = 25;

  print('Hello world: ${Variables.calculate()}!');
  print(country);
  print(name);
  print(age);
  print(numero_double);
  print("$name_person ${lastname_person.toUpperCase()} tiene $age_person años");
  print(age_person is String);
  print(age_person is num);
  print(age_person is! num);
  if (age_person is! String){
    print("$age_person no es un String");
  }
  
  var mic = new Microfono("NuevoMic", "Prueba", 00000);
  var mic2 = Microfono.initialize();

  print(mic.nombre);
  print(mic2.nombre);
  // GET & SET se utilizan como variables comunes
  mic.setNombre = "NuevoMicNombreCambiado";
  print(mic.getNombre);

  var ganadores = {
    "first": "JB",
    "second": "JC",
    "third": "BB"
  };

  print(ganadores["second"]);
  ganadores.forEach((key, value) => print(key));
  var keys = ganadores.keys;
  print(keys);
  var valores = ganadores.values;
  print(valores);
}

class Microfono {
  String nombre;
  String modelo;
  int marca;

  // Sugar Syntactic Constructors
  Microfono(this.nombre, this.modelo, this.marca);

  // Inicializador
  Microfono.initialize(){
    nombre = "Prueba";
    modelo = "Sky Gray";
    marca = 00123;
  }

  // GET & SET
  String get getNombre => nombre;
  set setNombre(String value) => nombre = value;
}
