import 'package:base_module/flclickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'color.dart';
import 'package:base_module/flsecondary_button.dart';
import 'package:flutter/foundation.dart';
class HomeworkTypeCard extends StatelessWidget {

  final String leftItem;
  final String title;
  final String description;
  final String subDescriptionLeft;
  final String subDescriptionRight;
  final VoidCallback callbackTextClicked;
  final VoidCallback callbackButtonClicked;


  HomeworkTypeCard(this.leftItem,
      this.title,
      this.description,
      this.subDescriptionLeft,
      this.subDescriptionRight,
      this.callbackTextClicked,
      this.callbackButtonClicked);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                'assets/images/drawablehdpi/homework/$leftItem.png',
               fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontSize: 21,
                      color: AppColors.PRIMARY_THEME_COLOR
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(description,
                    style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child:Row(children: [
                        Image.asset(
                          'assets/images/drawablehdpi/homework/hamburger.png',
                          fit: BoxFit.fill,
                          width: 7,
                          height: 7,
                        ),
                        SizedBox(width: 2),
                        FLClickableText(text:subDescriptionLeft, callback:_cbTextClicked, isUnderLined: false)
                      ]
                      )),

                        FLSecondaryButton(text:"Create New",
                          callBackMethod: _cbButtonClicked,
                        ),
                    ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _cbTextClicked(){
    print("Base Module: _callbackTextClicked");
    callbackTextClicked();
}
  void _cbButtonClicked(){
    print("Base Module: _cbButtonClicked");
    callbackButtonClicked();
  }

}
