import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Contact"),
          backgroundColor: Colors.deepOrange
      ),
      body: new Container(
        color: Colors.deepOrangeAccent,
        child: new Center(
          child: new Text(
            "Contacto",
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                fontSize: 34.5,
                color: Colors.white
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => debugPrint("FAB presionado"),
          backgroundColor: Colors.lightGreen,
          tooltip: ("FAB!"),
          child: new Icon(Icons.accessible)
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.add), title: new Text("Agregar")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.remove), title: new Text("Quitar"))
      ], onTap: (int i) => debugPrint("Acción: $i")),
    );
  }
}