import 'package:flutter/material.dart';
import 'hex_color.dart';

class FLPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback callBackMethod;
  final double fontSize;

  FLPrimaryButton({
    @required this.text,
    @required this.callBackMethod,
    this.fontSize = 14
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Base Module: FLPrimaryButton");
        callBackMethod();
      },
      child:MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(

        decoration: BoxDecoration(
          color: Colors.deepPurple,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("+ ",
                style: TextStyle(color: Colors.deepOrange,
                    fontWeight: FontWeight.normal),
              ),
              Text(text,
                  style: TextStyle(color: Colors.white,
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.w200)
              ),
            ],
          ),
        ),
      ),),
    );
  }
}