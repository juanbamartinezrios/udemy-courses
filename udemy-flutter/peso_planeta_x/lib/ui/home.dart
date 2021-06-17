import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _pesoController = new TextEditingController();

  int radioValue = 0;
  double _result = 0.0;
  String _formattedText = "";

  void handleRadioValueChange(int paramValue) {
    setState(() {
      debugPrint("Radio button seleccionado: $paramValue");
      radioValue = paramValue;
      switch(radioValue) {
        case 0:
          _result = calcularPeso(_pesoController.text.isEmpty ? "0" : _pesoController.text, 0.86);
          _formattedText = "Tu peso en Plutón: ${_result.toStringAsFixed(2)} KG.";
          break;
        case 1:
          _result = calcularPeso(_pesoController.text.isEmpty ? "0" : _pesoController.text, 0.38);
          _formattedText = "Tu peso en Marte: ${_result.toStringAsFixed(2)} KG.";
          break;
        case 2:
          _result = calcularPeso(_pesoController.text.isEmpty ? "0" : _pesoController.text, 0.91);
          _formattedText = "Tu peso en Venus: ${_result.toStringAsFixed(2)} KG.";
      }
    });
  }

  double calcularPeso(String peso, double multiplicador) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0){
      return int.parse(peso) * multiplicador;
    } else {
      print("Sin peso no hay resultado");
      return int.parse("0") * 1.00;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "Peso en planeta X",
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              width: 100.0,
              height: 100.0,
            ),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Container(
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Peso en la Tierra",
                      hintText: "En KG.",
                      icon: new Icon(Icons.person_outline)
                    )
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Radio<int>(
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                          activeColor: Colors.redAccent
                      ),
                      new Text(
                        "Plutón",
                        style: new TextStyle(color: Colors.white30, fontWeight: FontWeight.w600)
                      ),
                      new Radio<int>(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                          activeColor: Colors.redAccent
                      ),
                      new Text(
                          "Marte",
                          style: new TextStyle(color: Colors.white30, fontWeight: FontWeight.w600)
                      ),
                      new Radio<int>(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange,
                          activeColor: Colors.redAccent
                      ),
                      new Text(
                          "Venus",
                          style: new TextStyle(color: Colors.white30, fontWeight: FontWeight.w600)
                      )
                    ]
                  ),
                  new Padding(padding: EdgeInsets.all(20.0)),
                  new Container(
                    padding: EdgeInsets.all(10.0),
                    child: new Text(
                      _pesoController.text.isEmpty ? "Ingrese su peso." : "$_formattedText",
                      style: new TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0)
                    )
                  )
                ]
              )
            )
          ]
        ),
      )
    );
  }
}