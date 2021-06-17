import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/util.dart' as util;
import '../UI/input_city.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _cityTyped;

  void showWeather(String city) async {
    //Map data = await getWeather(util.app_id, city != null ? city : util.default_city);
    //print(data.toString());
    getWeather(util.app_id, city != null ? city : util.default_city).then((data){
      print(data.toString());
    });
  }

  Future _goToNextScreen(BuildContext context) async {
    Map result = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
          builder: (BuildContext context){
            return new InputCity();
          }
      )
    );
    if (result != null && result.containsKey('info')){
      _cityTyped = result['info'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weather'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.arrow_forward),
              onPressed: (){
                //_goToNextScreen(context);
                showWeather("Buenos Aires");
              }
          )
        ]
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
                'images/snowman.jpg',
                height: 1300.0,
                fit: BoxFit.cover
            )
          ),
          new Center(
            child: new Container(
              color: Colors.black.withOpacity(0.5)
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
            child: new Text(
              '${_cityTyped == null ? util.default_city : _cityTyped}',
              style: cityStyle()
            )
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(20.0, 350.0, 0.0, 0.0),
            child: updateTemperatureWidget(_cityTyped)
          )
        ]
      )
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String api_url = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.app_id}&units=metric';
    http.Response response = await http.get(api_url);
    return json.decode(response.body);
  }

  // FutureBuilder permite obtener data de un API, llenar un Widget con esa data y devolver el mismo a otro widget
  // FutureBuilder: future: recibe un objeto Future que es el contenido del widget que se retorna
  // FutureBuilder: builder: recibe un context (cada vez que se crea un widget, se pasa el BuildContext) y
  // un AsyncSnapshot<T>, que es la data que se recibe (el contenido del objeto Future) y el tipo de ésta
  // Se obtiene JSON data y se hace el setup del Widget (contenedor que dentro puede tener otros) a retornar con la data del future
  Widget updateTemperatureWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.app_id, city == null ? util.default_city : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
          if (snapshot.hasData){
            Map contentResult = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                        "${contentResult['main']['temp'].toString()} °C",
                        style: tempStyle()
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                        "Humedad: ${contentResult['main']['humidity'].toString()} % \n"
                        "Min: ${contentResult['main']['temp_min'].toString()} °C \n"
                        "Max: ${contentResult['main']['temp_max'].toString()} °C \n",
                        style: tempDetailStyle(),
                      ),
                    ),
                  )
                ]
              ),
            );
          } else {
            return new Container();
          }
    });
  }
}

TextStyle cityStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 25.0,
    fontWeight: FontWeight.w600
  );
}

TextStyle tempStyle(){
  return new TextStyle(
      color: Colors.white,
      fontSize: 40.0,
      fontWeight: FontWeight.w500
  );
}

TextStyle tempDetailStyle(){
  return new TextStyle(
      color: Colors.white,
      fontSize: 17.5,
      fontWeight: FontWeight.w300
  );
}
