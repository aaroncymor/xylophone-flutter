import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  List<Widget> generateKeys() {
    var buttonList = <Widget>[];
    var colorList = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];

    for (var i = 1; i <= 7; i++) {
      buttonList.add(
        Expanded(
          child: FlatButton(
            onPressed: (){
              playSound(i);
            },
            color: colorList[i - 1],
          ),
        ),
      );
    }
    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateKeys()
          ),
        ),
      ),
    );
  }
}