import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class Language extends StatelessWidget {
  //const Language({Key? key}) : super(key: key);
  var _language;
Language.start(var _language)
{
  this._language = _language;
}

  @override
  Widget build(BuildContext context) {
    var width = 150.0;
    return Scaffold(
        appBar: AppBar(
          title: Text("${language(_language, "Language")}"),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight

                  ,colors: [Colors.grey, Colors.green, Colors.green, Colors.green])

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 5)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'english');},
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'polish');},
                    child: Text(
                      'Polski',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'spanish');},
                    child: Text(
                      'Español',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(right: 35)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 5)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'german');},
                    child: Text(
                      'Deutsch',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'french');},
                    child: Text(
                      'Français',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context, 'russian');},
                    child: Text(
                      'Pусский',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40),
                    ),
                  ),
                ],
              ),
            ],
          )
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
    if(text == "Language") return 'Language';
    else return 'error';
  }

  String polish(String text){
    if(text == "Language") return 'Język';
    else return 'błąd';
  }


  String russian(String text){
    if(text == "Language") return 'Язык';
    else return 'ошибка';
  }

  String spanish(String text){
    if(text == "Language") return 'Lengua';
    else return 'error';
  }

  String french(String text){
    if(text == "Language") return 'Langue';
    else return 'eeuor';
  }

  String german(String text){
    if(text == "Language") return 'Sprache';
    else return 'error';
  }

}

/*
        child: RaisedButton(
          child: Text("Pop"),
          onPressed: () {Navigator.pop(context);},
 */
