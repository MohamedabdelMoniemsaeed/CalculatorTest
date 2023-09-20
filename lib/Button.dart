import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  String num;
  Function onButtonClickAll;
  ButtonNumber({required this.num, required this.onButtonClickAll});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: MaterialButton(
          onPressed: () {
            onButtonClickAll(num);
          },
          child: Text(
            num,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          color: Colors.blue,
          splashColor: Colors.white,
        ),
      ),
    );
  }
}
