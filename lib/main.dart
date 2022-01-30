import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volume_controller/volume_controller.dart';


import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Customer counter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Customer counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _maxCounter = 10000;
  var maxValue = '';
  String _language = 'english';




  void _incrementCounter() {
    setState(() {
      if (_counter < 1000000000) _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }
/*
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }*/

  mainColor(var _counter, var _maxCounter) {
    if (_maxCounter - _counter > 5)
      return new Color(0xff8bc34a);
    else if (_maxCounter - _counter <= 5 && _maxCounter - _counter >= 0)
      return new Color(0xffc3bf4a);
    else
      return new Color(0xffc34a4a);
  }

  backgroundGradient() {
    if (_maxCounter - _counter > 5) {
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            new Color(0xff8bc34a),
            new Color(0xff425b24),
//          Colors.black
          ]);
    }
    if (_maxCounter - _counter <= 5 && _maxCounter - _counter >= 0) {
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            new Color(0xffc3bf4a),
            new Color(0xff5b5a24),
            //           Colors.black
          ]);
    }
    if (_maxCounter - _counter < 0) {
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            new Color(0xffc34a4a),
            new Color(0xff5a2222),
            //   Colors.black
          ]);
    }
  }

  void _navigateAndGetSettings(BuildContext context) async {
   final result = await Navigator.push(
       context, CupertinoPageRoute(builder: (context) => Settings.start(_counter, _language, _maxCounter)));
   setState(() {
     _maxCounter = result[2];
   _language = result[1];
   _counter = result[0];
   print('max: $_maxCounter');
   setState(() {

   });
   });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //   backgroundColor: BGK(),
        appBar: AppBar(
          title: Text(language(_language, 'Customer counter', _maxCounter)),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           //   Padding(padding: EdgeInsets.only(top: 5)),

          //    Padding(padding: EdgeInsets.only(top: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: Text(
                      '-',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 100),
                        primary: mainColor(_counter, _maxCounter)),
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text(
                      '+',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 100),
                      primary: mainColor(_counter, _maxCounter),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              Text(
                '${language(_language, 'Currently', _maxCounter)}:',
                style: TextStyle(fontSize: 35),
              ),
              Text('$_counter', style: TextStyle(fontSize: 85)),
              Padding(padding: EdgeInsets.only(top: 15)),
              if (_maxCounter - _counter > 5)
                Text(
                  '${language(_language, 'Limit', _maxCounter)}',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              if (_maxCounter - _counter <= 5 && _maxCounter - _counter > 0)
                Text(
                  '${language(_language, 'To the limit', _maxCounter)} ${_maxCounter - _counter}',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              if (_counter == _maxCounter)
                Text(
                  '${language(_language, 'Limit', _maxCounter)}',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              if (_counter > _maxCounter)
                Text(
                  '${language(_language, 'Too many customers', _maxCounter)} (${_counter - _maxCounter})',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
            ],
          ),
        ),

        /*
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor(_counter, _maxCounter),
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: const Icon(Icons.settings, size: 45,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
   */

        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor(_counter, _maxCounter),
          tooltip: language(_language, 'Settings', _maxCounter),
          child: const Icon(
            Icons.settings,
            size: 45,
          ),
          onPressed: () {
            var counter = _counter;
      //      Navigator.push(
      //          context, CupertinoPageRoute(builder: (context) => Settings(_counter, _language)));
              _navigateAndGetSettings(context);
          },
        ));
  }

  String language(String _language, String text, int _maxCounter) {

    setState(() {
      this._language = _language;
      this._maxCounter = _maxCounter;
    });

    if(_language == 'polish')
      text = polish(text, _maxCounter);
    else if(_language == 'russian')
      text = russian(text, _maxCounter);
    else if(_language == 'spanish')
      text = spanish(text, _maxCounter);
    else if(_language == 'german')
      text = german(text, _maxCounter);
    else if(_language == 'french')
      text = french(text, _maxCounter);
    else
      text = english(text, _maxCounter);

    return text;
  }

  String english(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Settings';
    else if(text == "Too many customers") return 'Too many customers';
    else if(text == "Currently") return 'Currently';
    else if(text == "To the limit") return 'To the limit';
    else if(text == "Customer counter") return "Customer counter";
    else if(text == "Limit" && _maxCounter != 10000) return "Limit: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Limit: not set";
    else return 'error';
  }

  String polish(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Ustawienia';
    else if(text == "Too many customers") return 'Za dużo klientów';
    else if(text == "Currently") return 'Obecnie';
    else if(text == "To the limit") return 'Do limitu';
    else if(text == "Customer counter") return "Licznik klientów";
    else if(text == "Limit" && _maxCounter != 10000) return "Limit: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Limit: nie ustawiono";
    else return 'błąd';
  }


  String russian(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Настройки';
    else if(text == "Too many customers") return 'Слишком много клиентов';
    else if(text == "Currently") return 'В настоящее время';
    else if(text == "To the limit") return 'До предела';
    else if(text == "Customer counter") return "Счетчик клиентов";
    else if(text == "Limit" && _maxCounter != 10000) return "Ограничение: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Ограничение: не задано";
    else return 'ошибка';
  }

  String spanish(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Ajustes';
    else if(text == "Too many customers") return 'Demasiados clientes';
    else if(text == "Currently") return 'Actualmente';
    else if(text == "To the limit") return 'Al limite';
    else if(text == "Customer counter") return "Contador de clientes";
    else if(text == "Limit" && _maxCounter != 10000) return "Límite: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Límite: no establecido";
    else return 'error';
  }

  String french(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Réglages';
    else if(text == "Too many customers") return 'Trop de clients';
    else if(text == "Currently") return 'Actuellement';
    else if(text == "To the limit") return 'Jusqu\'à la limite';
    else if(text == "Customer counter") return "Compteur client";
    else if(text == "Limit" && _maxCounter != 10000) return "Limite: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Limite: pas encore défini";
    else return 'error';
  }

  String german(String text, int _maxCounter){
    this._maxCounter = _maxCounter;
    if(text == "Settings") return 'Einstellungen';
    else if(text == "Too many customers") return 'Zu viele Kunden';
    else if(text == "Currently") return 'Zur Zeit';
    else if(text == "To the limit") return 'Bis zum Limit';
    else if(text == "Customer counter") return "Kundenzähler";
    else if(text == "Limit" && _maxCounter != 10000) return "Grenze: $_maxCounter";
    else if(text == "Limit" && _maxCounter == 10000) return "Grenze: nicht eingestellt";
    else return 'error';
  }


}
