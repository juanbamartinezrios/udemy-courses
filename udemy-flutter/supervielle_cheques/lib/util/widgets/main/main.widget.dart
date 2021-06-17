import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  final String _title;
  final Widget _inflateView;

  MainWidget(this._title, this._inflateView);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(widget._title),
            centerTitle: true
        ),
        body: new Container(
            child: widget._inflateView
        )
    );
  }
}