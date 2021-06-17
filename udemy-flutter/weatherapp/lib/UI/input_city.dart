import 'package:flutter/material.dart';

class InputCity extends StatefulWidget {
  final String city;

  InputCity({Key key, this.city}) : super(key: key);

  @override
  _InputCityState createState() => _InputCityState();
}

class _InputCityState extends State<InputCity> {
  var _cityFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Weather - Ciudad'
        ),
        backgroundColor: Colors.pink
      ),
      body: new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  controller: _cityFieldController,
                  decoration: new InputDecoration(
                    labelText: 'Ingrese ciudad'
                  ),
                  keyboardType: TextInputType.text,
                )
              ),
              new ListTile(
                title: new FlatButton(
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  child: new Text('Actualizar'),
                  onPressed: (){
                    Navigator.pop(context, {
                      'info': _cityFieldController.text
                    });
                  }
                )
              )
            ]
      )
    );
  }
}
