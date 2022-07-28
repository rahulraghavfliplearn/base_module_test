import 'package:flutter/material.dart';

class FLFooterButtons extends StatelessWidget {
  final String title1;
  final String title2;
  final VoidCallback _cbTitleOneClicked;
  final VoidCallback _cbTitleSecondClicked;

  FLFooterButtons(this.title1,
      this.title2,
      this._cbTitleOneClicked,
      this._cbTitleSecondClicked);

  @override
  Widget build(BuildContext context) {

    return Container(
     // margin: EdgeInsets.only(top: 50, right: 35),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(),
          TextButton(
              onPressed: () {
                _cbTitleOneClicked();
              },
              child: Text(title1,
                style: TextStyle(color: Colors.deepPurple),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepPurple)
                      )
                  )
              )
          ),
          SizedBox(width: 20),
          TextButton(
              onPressed: () {
                _cbTitleSecondClicked();
              },
              child: Text(title2,
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )
                  )
              )
          )
        ],
      ),
    );
  }
}

