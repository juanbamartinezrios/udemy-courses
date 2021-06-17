import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;

void main() async {
  _data = await getQuakes();
  _features = _data['features'];

  runApp(new MaterialApp(
    title: 'Quakes',
    home: new Quake(),
  ));
}

class Quake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new Center(
       child: new ListView.builder(
         itemBuilder: (BuildContext context, int index){
           if(index.isOdd) return new Divider();
           final i = index ~/2; // se divide la posición por 2 y se retorna un entero como resultado
           var format = new DateFormat.yMMMd("en_US");
           var date = format.format(new DateTime.fromMillisecondsSinceEpoch(_features[i]['properties']['time']*1000, isUtc: true));
           return new ListTile(
             title: new Text(
               "Magnitude: ${_features[i]['properties']['mag']}",
               style: new TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.w500)
             ),
             subtitle: new Text(
               "${_features[i]['properties']['place']}",
               style: new TextStyle(fontSize: 12.0, color: Colors.blueGrey, fontWeight: FontWeight.w300),
             ),
             leading: new CircleAvatar(
               backgroundColor: Colors.red,
               child: new Text(
                 "${_features[i]['properties']['mag']}",
                 style: new TextStyle(fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w500)
               )
             ),
             onTap: (){
               _showAlert(context, "${_features[i]['properties']['type']}");
             }
           );
         },
         itemCount: _features.length,
         padding: const EdgeInsets.all(10.0),
       )
      )
    );
  }

  void _showAlert(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: new Text('Quakes'),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: new Text('Aceptar'))
      ],
    );
    showDialog(context: context,  builder: (context) { return alert; });
  }
}

Future<Map> getQuakes() async {
  String api = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(api);
  return json.decode(response.body);
}