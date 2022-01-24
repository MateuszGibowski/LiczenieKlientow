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
      title: 'Licznik klientów',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Licznik klientów'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color(0xffb8ffab),

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 5)),
            TextField(
              onChanged: (maxValue) {
                setState(() {
                });
                _maxCounter = int.parse(maxValue);
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                labelText: 'Maksymalna liczba  $_maxCounter',
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
                  onPressed: _incrementCounter,
                  child: Text(
                    'Zwiększ licznik',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 100),
                  ),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text(
                    'Zmniejsz licznik',
                    style: TextStyle(fontSize: 20),
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
              'Obecnie:',
              style: TextStyle(fontSize: 25),
            ),
            Text('$_counter', style: TextStyle(fontSize: 45)),
            Padding(padding: EdgeInsets.only(top: 15)),
            if (_maxCounter - _counter <= 5 && _maxCounter - _counter > 0)
              Text(
                'Do granicy brakuje ${_maxCounter - _counter}',
                style: TextStyle(color: Colors.orange, fontSize: 25),
              ),
            if (_counter == _maxCounter)
              Text(
                'Maksymalna liczba',
                style: TextStyle(fontSize: 25, color: Colors.yellow),
              ),
            if (_counter > _maxCounter)
              Text(
                'Za dużo o ${_counter - _maxCounter}',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _resetCounter,
        tooltip: 'Zerowanie',
        child: Text('Reset'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
