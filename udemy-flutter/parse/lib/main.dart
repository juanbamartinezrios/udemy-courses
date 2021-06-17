import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// async le dice al main que puede llamar un método async
void main() async {
  List _data = await getJson();
  
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "JSON Parse",
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                new Divider(
                  height: 10.0
                ),
                new Padding (
                  padding: EdgeInsets.all(5.0)
                ),
                new ListTile(
                  title: new Text(
                    "${_data[index]['name']}",
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  subtitle: new Text(
                    "${_data[index]['body']}",
                      style: new TextStyle(
                          fontSize: 12.0
                      )
                  ),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: new Text(
                      "${_data[index]['body'][0]}"
                    )
                  ),
                  onTap: () {
                    showOnTapMessage(context, _data[index]['body']);
                  },
                ),
                new Padding (
                    padding: EdgeInsets.all(5.0)
                )
              ]
            );
          }
        )
      )
    )
  ));
}

// context = precisamos la información de dónde viene la vista (en el árbol del layout)
void showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text(
      "JSON Parse"
    ),
    content: new Text(
      message
    ),
    actions: <Widget>[
     new FlatButton(
         onPressed: (){
           // Permite controlar las pantallas de la aplicación
           Navigator.pop(context);
         },
         child: new Text(
           "Aceptar"
         )
     )
    ]
  );
  showDialog(
      context: context,
      builder: (context) { return alert; }
  );
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/comments';
  http.Response response = await http.get(apiUrl); // await: pausar la ejecución hasta que el get responda, retorne algo
  return json.decode(response.body); // returns a List type
}