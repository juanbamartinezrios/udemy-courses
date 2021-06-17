import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      // La acción del botón
      onTap: () {
        // Se pueden agregar más propiedades a la instancia de SnackBar
        final snack = new SnackBar(content: new Text("Gesto obtenido desde un Custom button."));
        // Esta linea es para insertar el context de la clase (activity) que lo está utilizando
        Scaffold.of(context).showSnackBar(snack);
      },
      // El botón
      child: new Container(
          padding: new EdgeInsets.all(13.0),
          decoration: new BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: new BorderRadius.circular(5.5)
          ),
          child: new Center(
              child: new Text("Show Snackbar")
          )
      ),
    );
  }
}