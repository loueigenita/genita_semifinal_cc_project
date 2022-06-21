import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Development Activity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomDigitGenerator(),
    );
  }
}

class RandomDigitGenerator extends StatefulWidget {
  const RandomDigitGenerator({Key? key}) : super(key: key);

  @override
  State<RandomDigitGenerator> createState() => _RandomDigitGeneratorState();
}

class _RandomDigitGeneratorState extends State<RandomDigitGenerator> {
  final _controller = TextEditingController();

  String inputNumber = "";
  int randomNumber = 0;

  void _generateRandomNumber(){
    setState(() {
      inputNumber = _controller.text;
      randomNumberGenerator();
    });
  }
  int randomNumberGenerator(){
    int baseNumber = int.parse(inputNumber);
    var rand = Random();
    return randomNumber = rand.nextInt(baseNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            const Text( "Maximum Number",
                style: TextStyle(
                    fontSize:20
                )
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20
              ),
            ),
            const Text(
                "Your Random Number",
                style: TextStyle(
                fontSize: 20
              ),
            ),
            Text(""
                "${randomNumber}",
                style: TextStyle(
                  fontSize: 90
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomNumber,
        tooltip: 'Generate Random Number',
        child: const Icon(Icons.wifi_protected_setup_outlined),
      ),
    );
  }
}
