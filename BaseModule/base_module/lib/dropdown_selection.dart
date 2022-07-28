import 'package:flutter/material.dart';
import 'color.dart';

class DropDownSelection {
  VoidCallback callBackDropDownSelection;

  Widget render(BuildContext context, String title, String values,  VoidCallback callback) {

    callBackDropDownSelection = callback;
    String imagePath = "assets/images/drawablehdpi/homework/";

    return Container(
      height: MediaQuery.of(context).size.height * 0.08,

      decoration: BoxDecoration(
        color: AppColors.SECONDARY_THEME_COLOR_LIGHT,
        border: Border.all(color: AppColors.SECONDARY_THEME_COLOR_HEAVY),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$title", style: TextStyle(fontSize:12 , fontWeight: FontWeight.w700),),
              GestureDetector(
                onTap: (){
                  callBackDropDownSelection();
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.73,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Text("$values",

                          style: TextStyle(fontSize:11 ,
                            color: Colors.grey,
                          fontWeight: FontWeight.w500,),),

                      ),
                      RotatedBox(quarterTurns: 1, child: Image.asset(imagePath + "detail_arrow.png")),

                    ],
                  ),
                  decoration:BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.2)),
                ),
              )


        ]),
      ),
    );
  }
}
