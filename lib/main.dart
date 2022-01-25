import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Counter',
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
 int maxCounter(var maxValue, var _maxCounter){
   if(int.parse(maxValue) > 0 )
     {
       return  int.parse(maxValue);
     }
   else return _maxCounter;
 }

  backgroundGradient() {

    if(_maxCounter - _counter > 5)
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          new Color(0xff8bc34a),
          new Color(0xff425b24),
//          Colors.black
        ]);
    if(_maxCounter - _counter <= 5 && _maxCounter - _counter >= 0)
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            new Color(0xffc3bf4a),
            new Color(0xff5b5a24),
 //           Colors.black
          ]);
    if(_maxCounter - _counter < 0)
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            new Color(0xffc34a4a),
            new Color(0xff5a2222),
         //   Colors.black
          ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: BGK(),

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 5)),
            TextField(
              onChanged: (maxValue) {
        //        setState(() {});
                _maxCounter = maxCounter(maxValue, _maxCounter);
                setState(() {});
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                fillColor: Colors.lightGreen,
                filled: true,
                border: OutlineInputBorder(),
                labelText: 'Maximum number  $_maxCounter',
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 100),
                  ),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 100),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            const Text(
              'Currently:',
              style: TextStyle(fontSize: 25),
            ),
            Text('$_counter', style: TextStyle(fontSize: 45)),
            Padding(padding: EdgeInsets.only(top: 15)),
            if (_maxCounter - _counter > 5)
              Text(
                'OK',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            if (_maxCounter - _counter <= 5 && _maxCounter - _counter > 0)
              Text(
                'To the limit ${_maxCounter - _counter}',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            if (_counter == _maxCounter)
              Text(
                'Limit',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            if (_counter > _maxCounter)
              Text(
                'Too many coustomers (${_counter - _maxCounter})',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: Text('Reset'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
