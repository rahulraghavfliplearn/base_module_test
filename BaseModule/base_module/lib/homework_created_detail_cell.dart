import 'package:base_module/color.dart';
import 'package:flutter/material.dart';
import 'hex_color.dart';

class HomeworkCreatedDetailList extends StatelessWidget {

  final String iconName;
  final String title;
  final String description;
  final String subDescription1;
  final String subDescription2;
  final String rightItemDescription1;
  final String rightItemDescription2;
  final VoidCallback _callbackCellSelected;


  HomeworkCreatedDetailList(
      this.iconName,
      this.title,
      this.description,
      this.subDescription1,
      this.subDescription2,
      this.rightItemDescription1,
      this.rightItemDescription2,
      this._callbackCellSelected);

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.height * 0.01;
    return GestureDetector(
      onTap: () => {
        _callbackCellSelected()
      },
      child:MouseRegion(
        cursor: SystemMouseCursors.click,
        child:Container(
        //margin: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height * 0.18,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(iconName,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                //color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: padding),
                      Text(description,
                        style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: padding),
                      Text(subDescription1,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: padding),
                      Text(subDescription2,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          fontWeight: FontWeight.w700,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: padding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Attempts:"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.PRIMARY_THEME_COLOR_LIGHT,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(rightItemDescription1),
                      Container(height: 1,
                      width: padding * 2,
                        color: Colors.black,),
                      Text(rightItemDescription2),

                    ],)
                  ),
                ],
              ),
            )

          ],
        ),
      ),)
    );
  }
}
