import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int btnvalue=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Center(child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: FlatButton(
              onPressed: (){
                setState(() {
                  btnvalue=Random().nextInt(6)+1;
                });
              },
              child: Image.asset('images/dice$btnvalue.png'),
            ),
          ),),
        ),
      ],
    );
  }
}

