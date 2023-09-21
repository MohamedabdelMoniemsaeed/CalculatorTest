import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  String num;
  Function onButtonClickAll;
  ButtonNumber({super.key, required this.num, required this.onButtonClickAll});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: MaterialButton(
          onPressed: () {
            onButtonClickAll(num);
          },
          color: Colors.blue,
          splashColor: Colors.white,
          child: Text(
            num,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
