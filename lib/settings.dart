import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:wspolnie_latwiej/language.dart';
import 'package:wspolnie_latwiej/max.dart';

import 'current.dart';
import 'main.dart';
import 'language.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);
@override
var _counter;
var _language;
var _maxCounter;
Settings.start(var _counter, var _language, var _maxCounter){
  this._counter = _counter;
  this._language = _language;
  this._maxCounter = _maxCounter;
}

  SettingsState createState() => SettingsState(_counter, _language, _maxCounter);

}

class SettingsState extends State<Settings>{
  var _language;var _counter; var _maxCounter;
  SettingsState(var _counter, var _language, var _maxCounter){
    this._counter = _counter;
    this._language = _language;
    this._maxCounter = _maxCounter;
  }










   void _navigateAndGetLaguage(BuildContext context) async {
     final result = await Navigator.push(
         context, CupertinoPageRoute(builder: (context) => Language.start(_language)));
setState(() {

});
       _language = result;
   }

  void _navigateAndGetMax(BuildContext context) async {
    final result = await Navigator.push(
        context, CupertinoPageRoute(builder: (context) => Max.start(_language, _maxCounter)));
    if(result != null) {
      _maxCounter = result;
    }
    setState(() {

    });
  }

  void _navigateAndGetCurrent(BuildContext context) async {
    final result = await Navigator.push(
        context, CupertinoPageRoute(builder: (context) => Current.start(_counter, _language)));
   if(result != null) {
     _counter = result;
   }
    setState(() {

    });
  }






  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(language(_language, 'Settings')),
        ),
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight

            ,colors: [Colors.grey, Colors.green, Colors.green, Colors.green])

          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(padding: EdgeInsets.only(top: 5)),

          ElevatedButton(
            onPressed: (){_navigateAndGetMax(context);},
            child: Text(
              '${language(_language, 'Set max customer number')}',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 70),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 20)),

          ElevatedButton(
            onPressed: (){_navigateAndGetCurrent(context);},
            child: Text(
              '${language(_language, 'Set customers number')}',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 70),
            ),
          ),



          Padding(padding: EdgeInsets.only(top: 20)),

          ElevatedButton(
            onPressed: (){Navigator.pop(context, [0, _language, _maxCounter]);},
            child: Text(
              '${language(_language, 'Reset clients counter')} ($_counter)',
              style: TextStyle(
               fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 70),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            onPressed: (){
              _navigateAndGetLaguage(context);
            },
            child: Text(
              language(_language, 'Language'),
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 40),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            onPressed: () {Navigator.pop(context,[_counter,_language, _maxCounter]);},
            child: Text(
              language(_language, 'Return'),
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 40),
            ),
          ),
        ],
      ),
    ));

    //  );
  }


  String language(String _language, String text) {

    setState(() {
      this._language = _language;

    });
    if(_language == 'polish')
      text = polish(text);
    else if(_language == 'russian')
      text = russian(text);
    else if(_language == 'spanish')
      text = spanish(text);
    else if(_language == 'german')
      text = german(text);
    else if(_language == 'french')
      text = french(text);
    else
      text = english(text);

    return text;
  }


  String english(String text){
    if(text == "Reset clients counter") return 'Reset clients counter';
    else if(text == "Settings") return 'Settings';
    else if(text == "Language") return 'Language';
    else if(text == "Return") return 'Return';
    else if(text == "Set max customer number" && _maxCounter != 10000) return 'Set max customer number ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return 'Set max customer number (not set)';
    else if(text == "Set customers number") return 'Set current number of customers';
    else return 'error';
  }

  String polish(String text){
    if(text == "Reset clients counter") return 'Zerowanie liczby klient??w';
    else if(text == "Settings") return 'Ustawienia';
    else if(text == "Language") return 'J??zyk';
    else if(text == "Return") return 'Powr??t';
    else if(text == "Set max customer number" && _maxCounter != 10000) return 'Ustaw maksymaln?? liczb?? kient??w ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return 'Ustaw maksymaln?? liczb?? kient??w (nie ustawiono)';
    else if(text == "Set customers number") return 'Ustaw aktualn?? liczb?? klient??w';
    else return 'b????d';
  }


  String russian(String text){
    if(text == "Reset clients counter") return '???????????????? ?????????????? ????????????????';
    else if(text == "Settings") return '??????????????????';
    else if(text == "Language") return '????????';
    else if(text == "Return") return '??????????????????????';
    else if(text == "Set max customer number" && _maxCounter != 10000) return '???????????????????? ???????????????????????? ???????????????????? ???????????????? ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return '???????????????????? ???????????????????????? ???????????????????? ???????????????? (???? ????????????)';
    else if(text == "Set customers number") return '???????????????????? ?????????????? ???????????????????? ????????????????';
    else return '????????????';
  }

  String spanish(String text){
    if(text == "Reset clients counter") return 'Restablecer contador de clientes';
    else if(text == "Settings") return 'Ajustes';
    else if(text == "Language") return 'Lengua';
    else if(text == "Return") return 'Regreso';
    else if(text == "Set max customer number" && _maxCounter != 10000) return 'Establecer el n??mero m??ximo de clientes ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return 'Establecer el n??mero m??ximo de clientes (no establecido)';
    else if(text == "Set customers number") return 'Establecer el n??mero actual de clientes';
    else return 'error';
  }

  String french(String text){
    if(text == "Reset clients counter") return 'R??initialiser le compteur de clients';
    else if(text == "Settings") return 'R??glages';
    else if(text == "Language") return 'Langue';
    else if(text == "Return") return 'Retourner';
    else if(text == "Set max customer number" && _maxCounter != 10000) return 'D??finir le nombre maximum de clients ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return 'D??finir le nombre maximum de clients (pas encore d??fini)';
    else if(text == "Set customers number") return 'D??finir le nombre actuel de clients';
    else return 'erreur';
  }

  String german(String text){
    if(text == "Reset clients counter") return 'Kundenz??hler zur??cksetzen';
    else if(text == "Settings") return 'Einstellungen';
    else if(text == "Language") return 'Sprache';
    else if(text == "Return") return 'Zur??ckkehren';
    else if(text == "Set max customer number" && _maxCounter != 10000) return 'Maximale Kundennummer festlegen ($_maxCounter)';
    else if(text == "Set max customer number" && _maxCounter == 10000) return 'Maximale Kundennummer festlegen (nicht eingestellt)';
    else if(text == "Set customers number") return 'Legen Sie die aktuelle Anzahl der Kunden fest';
    else return 'error';
  }

}

/*
        child: RaisedButton(
          child: Text("Pop"),
          onPressed: () {Navigator.pop(context);},
 */
