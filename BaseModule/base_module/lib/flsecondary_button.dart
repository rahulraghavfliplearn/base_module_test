import 'package:flutter/material.dart';
import 'hex_color.dart';

class FLSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback callBackMethod;

  FLSecondaryButton({
    @required this.text,
    @required this.callBackMethod
  }
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Base Module: FLSecondaryButton");
        callBackMethod();
      },
      child:MouseRegion(
        cursor: SystemMouseCursors.click,
        child:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("+ ",
                style: TextStyle(color: Colors.deepOrange,
                    fontWeight: FontWeight.normal),
              ),
              Text(text,
                  style: TextStyle(color: Colors.deepPurple,
                      fontFamily: "RobotoSlab",
                      fontSize: 12,
                      fontWeight: FontWeight.w700)
              ),
            ],
          ),
        ),
      ),)
    );
  }
}