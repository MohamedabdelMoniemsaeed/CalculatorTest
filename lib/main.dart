import 'package:flutter/material.dart';
import 'package:standard/Button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String resultText = "";
  String number1 = "";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Calculator")),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      resultText,
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              ),
            ),

            
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonNumber(num: "7", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "8", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "9", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "/", onButtonClickAll: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonNumber(num: "4", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "5", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "6", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "*", onButtonClickAll: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonNumber(num: "1", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "2", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "3", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "-", onButtonClickAll: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonNumber(num: ".", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "0", onButtonClickAll: onDigitClick),
                  ButtonNumber(num: "=", onButtonClickAll: onEqualClick),
                  ButtonNumber(num: "+", onButtonClickAll: onOperatorClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String buttText) {
    print("Click on Button $buttText");
    if (buttText == ".") {
      if (resultText.contains(".")) {
        return;
      }
    }
    setState(() {
      resultText += buttText;
    });
  }

  void onOperatorClick(String buttText) {
    print("Click on Button $buttText");
    if (number1.isEmpty) {
      number1 = resultText;
      operator = buttText;
      setState(() {
        resultText = "";
      });
    } else {
      String number2 = resultText;
      String res = calculate(number1, operator, number2);
      number1 = res;
      operator = buttText;
      setState(() {
        resultText = "";
      });
    }
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (operator == "/") {
      res = n1 / n2;
    } else if (operator == "*") {
      res = n1 * n2;
    } else if (operator == "-") {
      res = n1 - n2;
    } else if (operator == "+") {
      res = n1 + n2;
    }
    return res.toString();
  }

  void onEqualClick(String _) {
    if (number1.isEmpty) {
      return;
    }
    String number2 = resultText;
    String res = calculate(number1, operator, number2);

    setState(() {
      resultText = res;
    });
    number1 = "";
    operator = "";
  }
}
