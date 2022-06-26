import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color.fromRGBO(58, 90, 64, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(52, 78, 65, 1),
        title: Text(
          "Dice",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDice = 1;
  var rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6)+1;
                    });

                    print(leftDice);
                  },
                  child: Image.asset("images/dice$leftDice.png"))),
          Expanded(
              flex: 1,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      rightDice = Random().nextInt(6)+1;
                    });

                    print(rightDice);
                  },
                  child: Image.asset("images/dice$rightDice.png")))
        ],
      ),
    );
  }
}
