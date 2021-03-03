import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({this.onPressed, this.message, this.color});

  final Function onPressed;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return (RaisedButton(
      onPressed: this.onPressed == null ? () {} : this.onPressed,
      child: Text(
        this.message,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      color: this.color,
    ));
  }
}
