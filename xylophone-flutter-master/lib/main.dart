import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int id){
    final player=AudioCache();
    player.play('note$id.wav');
  }
  Expanded buildBar(var colour, int id){
    return Expanded(
      child: FlatButton(
        color: colour,
        onPressed: (){
          playSound(id);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildBar(Colors.red, 1),
              buildBar(Colors.orange, 2),
              buildBar(Colors.yellow, 3),
              buildBar(Colors.green, 4),
              buildBar(Colors.teal, 5),
              buildBar(Colors.blue, 6),
              buildBar(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
