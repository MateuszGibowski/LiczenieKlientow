import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class Max extends StatelessWidget {
  Max({Key? key}) : super(key: key);
var _maxCounter;
var _language;

Max.start(var _language, int _maxCounter)
{
  this._maxCounter = _maxCounter;
  this._language = _language;
}
  var _newMaxCounterTmp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(language(_language, 'Maximum')),
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
              TextField(
                onChanged: (maxValue) {
                  if (int.parse(maxValue) > 0 &&
                      int.parse(maxValue) < 1000000000) {
                    //setState(() {});
                   _newMaxCounterTmp = int.parse(maxValue);
                  }
                  //       _maxCounter = maxCounter(maxValue, _maxCounter);
                  //       setState(() {});
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                decoration: InputDecoration(
                 // fillColor:
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: (language(_language, 'Maximum number')
                ),

              ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {Navigator.pop(context,_newMaxCounterTmp );},
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
              ElevatedButton(
                onPressed: () {Navigator.pop(context,_maxCounter);},
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
    this._language = _language;
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
    if(text == "Accept") return 'Accept';
    else if(text == "Maximum number") return 'Maximum number';
    else if(text == "Cancel") return 'Cancel';
    else if(text == "Maximum") return 'Maximum';
    else return 'error';
  }

  String polish(String text){
    if(text == "Accept") return 'Akceptuj';
    else if(text == "Maximum number") return 'Maksymalna liczba';
    else if(text == "Cancel") return 'Anuluj';
    else if(text == "Maximum") return 'Maksimum';
    else return 'b????d';
  }


  String russian(String text){
    if(text == "Accept") return '??????????????????';
    else if(text == "Maximum number") return '???????????????????????? ????????????????????';
    else if(text == "Cancel") return '????????????';
    else if(text == "Maximum") return '????????????????';
    else return '????????????';
  }

  String spanish(String text){
    if(text == "Accept") return 'Aceptar';
    else if(text == "Maximum number") return 'N??mero m??ximo';
    else if(text == "Cancel") return 'Cancelar';
    else if(text == "Maximum") return 'M??ximo';
    else return 'error';
  }

  String french(String text){
    if(text == "Accept") return 'J\'accepte';
    else if(text == "Maximum number") return 'Nombre maximal';
    else if(text == "Cancel") return 'Annuler';
    else if(text == "Maximum") return 'Maximum';
    else return 'eeuor';
  }

  String german(String text){
    if(text == "Accept") return 'Akzeptieren';
    else if(text == "Maximum number") return 'Maximale Anzahl';
    else if(text == "Cancel") return 'Abbrechen';
    else if(text == "Maximum") return 'Maximal';
    else return 'error';
  }



}

/*
        child: RaisedButton(
          child: Text("Pop"),
          onPressed: () {Navigator.pop(context);},
 */
