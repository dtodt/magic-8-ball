import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MagicApp());

class MagicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: BallPage(),
      ),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballAnswer = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade500,
      child: Center(
        child: Column(
          children: <Widget>[
            _ball(
              answer: ballAnswer,
              onPressed: _shakeTheBall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ball({int answer, VoidCallback onPressed}) {
    return Expanded(
      child: FlatButton(
        child: Image.asset('assets/images/ball$answer.png'),
        onPressed: onPressed,
      ),
    );
  }

  int _findAnswer() {
    return Random().nextInt(5) + 1;
  }

  void _shakeTheBall() {
    setState(() {
      ballAnswer = _findAnswer();
    });
  }
}
