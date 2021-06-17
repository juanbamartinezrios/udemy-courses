import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeText = "";

  void _clearTextFieldsWidgets() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeText = "";
    });
  }

  void _showWelcomeText() {
    setState(() {
      if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeText = "Bienvenido, " + _userController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Login"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue
        ),
        backgroundColor: Colors.white54,
        body: new Container(
            alignment: Alignment.topCenter,
            padding: new EdgeInsets.all(10.0),
            child: new ListView(
                children: <Widget>[
                  new Image.asset(
                      "images/face.png",
                      width: 100.0,
                      height: 100.0,
                      color: Colors.lightBlueAccent
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(10.0)
                  ),
                  new Container(
                      padding: new EdgeInsets.all(10.0),
                      height: 175.0,
                      width: 350.0,
                      color: Colors.white,
                      child: new Column(
                          children: <Widget>[
                            new TextField(
                                controller: _userController,
                                decoration: new InputDecoration(
                                    hintText: "Usuario",
                                    icon: new Icon(Icons.person_outline)
                                )
                            ),
                            new TextField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: new InputDecoration(
                                    hintText: "Password",
                                    icon: new Icon(Icons.lock_outline)
                                )
                            ),
                            new Padding(
                                padding: new EdgeInsets.all(10.0)
                            ),
                            new Center(
                                child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new RaisedButton(
                                          onPressed: _showWelcomeText,
                                          color: Colors.blue,
                                          child: new Text(
                                            "Ingresar",
                                            style: new TextStyle(
                                                color: Colors.white
                                            ),
                                          )
                                      ),
                                      new RaisedButton(
                                          onPressed: _clearTextFieldsWidgets,
                                          color: Colors.redAccent,
                                          child: new Text(
                                              "Limpiar",
                                              style: new TextStyle(
                                                  color: Colors.white
                                              )
                                          )
                                      )
                                    ]
                                )
                            )
                          ]
                      )
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(10.0)
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                          "$_welcomeText",
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0
                          )
                      )
                    ]
                  )
                ]
            )
        )
    );
  }
}