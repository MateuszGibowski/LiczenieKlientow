import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class Current extends StatelessWidget {
  Current({Key? key}) : super(key: key);
var _counter;
var _language;

Current.start(var _counter, var _language)
{
  this._counter = _counter;
  this._language = _language;
}
var _newCounter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(language(_language, 'Current counter')),
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
              TextField(
                onChanged: (value) {
                  if (int.parse(value) > 0 &&
                      int.parse(value) < 1000000000) {
                    //setState(() {});
                    _newCounter = int.parse(value);
                  }
                  //       _maxCounter = maxCounter(maxValue, _maxCounter);
                  //       setState(() {});
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                decoration: InputDecoration(

                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: '${language(_language, 'counter')}:  $_counter',
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {Navigator.pop(context,_newCounter);},
                child: Text(
                  language(_language, 'Accept'),
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
                onPressed: () {Navigator.pop(context,_counter);},
                child: Text(
                  language(_language, 'Cancel'),
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
    if(text == "Current counter") return 'Current counter';
    else if(text == "counter") return 'counter';
    else if(text == "Accept") return 'Accept';
    else if(text == "Cancel") return 'Cancel';
    else return 'error';
  }

  String polish(String text){
    if(text == "Current counter") return 'Wartość licznika';
    else if(text == "counter") return 'licznik';
    else if(text == "Accept") return 'Akceptuj';
    else if(text == "Cancel") return 'Anuluj';
    else return 'błąd';
  }

  String russian(String text){
    if(text == "Current counter") return 'Текущий счетчик';
    else if(text == "counter") return 'прилавок';
    else if(text == "Accept") return 'Принимать';
    else if(text == "Cancel") return 'Отмена';
    else return 'ошибка';
  }

  String spanish(String text){
    if(text == "Current counter") return 'Contador actual';
    else if(text == "counter") return 'encimera';
    else if(text == "Accept") return 'Aceptar';
    else if(text == "Cancel") return 'Cancelar';
    else return 'error';
  }

  String french(String text){
    if(text == "Current counter") return 'Contador actual';
    else if(text == "counter") return 'encimera';
    else if(text == "Accept") return 'J\'accepte';
    else if(text == "Cancel") return 'Cancelar';
    else return 'error';
  }

  String german(String text){
    if(text == "Current counter") return 'Aktueller Zähler';
    else if(text == "counter") return 'Zähler';
    else if(text == "Accept") return 'Akzeptieren';
    else if(text == "Cancel") return 'Abbrechen';
    else return 'fout';
  }

}

/*
        child: RaisedButton(
          child: Text("Pop"),
          onPressed: () {Navigator.pop(context);},
 */
