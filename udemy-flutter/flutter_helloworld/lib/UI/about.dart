import 'package:flutter/material.dart';
import './custom_button.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add_circle), onPressed: () => debugPrint("Enviando mensaje!"))
        ],
      ),
      body: new Container(
          color: Colors.deepOrangeAccent,
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                  "About 1",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(color: Colors.white, fontSize: 34.5)
              ),
              new Text(
                  "About 2",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(color: Colors.white70, fontSize: 17.25)
              ),
              new Text(
                  "About 3",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(color: Colors.white30, fontSize: 8.625)
              ),
              new Text(
                  "About 4",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(color: Colors.white10, fontSize: 4.3125)
              ),
              new Container(
                color: Colors.orange,
                alignment: Alignment.center,
                child: new Text(
                    "Nested container whit text",
                    textDirection: TextDirection.ltr,
                    style: new TextStyle(color: Colors.orangeAccent, fontSize: 17.25)
                )
              ),
              new InkWell(
                highlightColor: Colors.deepOrange,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                        "TEXT BUTTON",
                        textDirection: TextDirection.ltr,
                        style: new TextStyle(color: Colors.white, fontSize: 17.25)
                    )
                  ],
                ),
                onTap: () => debugPrint("Text button!")
              ),
              new Container(
                child: CustomButton(),
              )
            ],
          )
          /*
          child: new Text(
              "About",
              textDirection: TextDirection.ltr,
              style: new TextStyle(color: Colors.white, fontSize: 34.5)
          )
          */
      )
    );
  }
}