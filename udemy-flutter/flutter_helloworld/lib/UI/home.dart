import 'package:flutter/material.dart';
import './about.dart';
import './contact.dart';
import './custom_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Fluter - Example"),
            backgroundColor: Colors.deepOrange
        ),
        body: new Container(
            color: Colors.deepOrangeAccent,
            child: new ListView(
              padding: new EdgeInsets.all(2.0),
              children: <Widget>[
                new Container(
                    child: new CustomButton()
                ),
                new Padding(
                    padding: new EdgeInsets.all(2.0)
                ),
                new Text(
                    "Elige, estoy segura de que perderás!",
                    textDirection: TextDirection.ltr,
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal)
                ),
                new RaisedButton(
                    child: Text("Contact"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contact())
                      );
                    }),
                new RaisedButton(
                    child: Text("About"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About())
                      );
                    })
              ],
            )
        )
    );
  }
}