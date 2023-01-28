import 'package:flutter/material.dart';

import '../logic/calculator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textField(),
            const SizedBox(height: 30),
            output(),
          ],
        ),
      ),
      floatingActionButton: fab(),
    );
  }

  output() {
    return Text(
      '= $result',
      style: const TextStyle(fontSize: 45),
    );
  }

  textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'enter your math expression',
        ),
        style: const TextStyle(fontSize: 25),
      ),
    );
  }

  fab() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          result = Calculator.calculate(controller.text).toString();
        });
      },
      tooltip: 'Increment',
      child: const Text(
        '=',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
