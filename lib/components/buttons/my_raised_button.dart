import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShapedRaisedButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final VoidCallback onPressed;
  final double borderRadius=18.0;

  const ShapedRaisedButton(
      {Key key, this.color, this.buttonText, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return myRaisedButton();
  }

  RaisedButton myRaisedButton() {
    return RaisedButton(onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: color)
        ),
      color: color,
      child: Text(buttonText.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
    );
  }
}
