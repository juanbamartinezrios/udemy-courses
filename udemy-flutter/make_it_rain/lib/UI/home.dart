import 'package:flutter/material.dart';

// Extiende de StatefulWidget, permitirá crear un State que luego se tomará y se guardará en
// un objeto State y luego se devolverá cuando se necesite
class Home extends StatefulWidget {
  // Se crea el estado del widget y se devuelve
  // Se tiene que sobreescribir el createState y devolver la clase del State que creemos
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

// Extiende de State y éste va a recibir un Widget que extienda de StatefulWidget (Home)
// Se tiene que sobreescribir build y armar el layout
class HomeState extends State<Home> {
  int _moneyCounter = 0;

  // El State se guarda cuando se hacer el setState y no se pierde salvo que se
  // haga reload de la app
  void _rainMoney() {
    // setState se llama cada vez que necesite actualizar la UI
    setState(() {
      _moneyCounter += 100;
    });
  }

  void _cleanMoney() {
    setState(() {
      _moneyCounter = 0;

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Make it rain!"),
            backgroundColor: Colors.lightGreen
        ),
        body: new Container(
            color: Colors.white70,
            alignment: Alignment.center,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                      flex: 0,
                      child: new Container(
                          color: Colors.limeAccent,
                          width: 200.0,
                          padding: new EdgeInsets.all(25.0),
                          child: new Center(
                              child: new Text(
                                  "Get rich!",
                                  textDirection: TextDirection.ltr
                              )
                          )
                      )
                  ),
                  new Flexible(
                      flex: 2,
                      child: new Container(
                          color: Colors.lightGreen,
                          width: 200.0,
                          padding: new EdgeInsets.all(25.0),
                          child: new Center(
                              child: new Text(
                                '\$$_moneyCounter',
                                textDirection: TextDirection.ltr,
                                style: new TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w800,
                                    color: _moneyCounter > 0 ? Colors.black87 : Colors.black12
                                ),
                              )
                          )
                      )
                  ),
                  new Flexible(
                      flex: 0,
                      child: new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new FlatButton(
                                onPressed: _rainMoney,
                                child: new Container(
                                  width: 125.0,
                                  padding: new EdgeInsets.all(20.0),
                                  decoration: new BoxDecoration(
                                      color: Colors.lightGreenAccent),
                                  child: new Center(
                                    child: new Text("Let it rain!"),
                                  ),
                                ),
                              ),
                              new FlatButton(
                                onPressed: _cleanMoney,
                                child: new Container(
                                  width: 125.0,
                                  padding: new EdgeInsets.all(20.0),
                                  decoration: new BoxDecoration(
                                      color: Colors.lightGreenAccent),
                                  child: new Center(
                                    child: new Text("Clean"),
                                  ),
                                ),
                              )
                            ],
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}