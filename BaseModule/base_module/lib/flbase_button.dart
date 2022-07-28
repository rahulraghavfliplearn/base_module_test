import 'package:flutter/material.dart';
import 'hex_color.dart';

class FLBaseButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backGroundColor;
  final VoidCallback _cbButtonClicked;

  FLBaseButton(this.text,
      this.textColor,
      this.backGroundColor,
      this._cbButtonClicked);

  @override
  Widget build(BuildContext context) {

    return  TextButton(
        onPressed: () {
          _cbButtonClicked();
        },
        child: Text(text,
          style: TextStyle(color: textColor),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: backGroundColor)
                )
            )
        )
    );
  }
}

