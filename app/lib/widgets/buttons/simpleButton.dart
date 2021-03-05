import 'package:app/themes/colors/index.dart';
import 'package:flutter/material.dart';

//Themes
import '../../themes/colors/index.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({this.onPressed, this.message, this.color});

  final Function onPressed;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: this.onPressed == null ? () {} : this.onPressed,
      child: Text(
        this.message,
        style: TextStyle(fontSize: 18, color: Color(TwitchChatColors.BLACK_1)),
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(244, 32)),
          backgroundColor: MaterialStateProperty.all<Color>(this.color)),
    ));
  }
}
