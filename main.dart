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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  final amountTextField = TextEditingController();
  //final totalTipTextField  = TextEditingController();

  double _billAmount = 0;
  //double _totalTip = 0;
  String _totalTip = "";

  void _calculateTip (){}

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tip Calculator", style: Theme.of(context).textTheme.displayMedium),
            Text("Bill Amount"),
            TextField(controller: amountTextField),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = true;
                  _totalTip = (_billAmount *0.20) as String;
                });
                Text("Great Service?");
              },
            ),
            ElevatedButton(onPressed: ()
            {
              _totalTip = double.parse(_totalTip) as String;
              _totalTip = (_billAmount *0.15) as String;
              //totalTipTextField.text = _totalTip.toStringAsFixed(2);
            },
                child: Text("Calculate Tip")),
            Text("0"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}