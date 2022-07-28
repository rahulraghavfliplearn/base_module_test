import 'package:base_module/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'hex_color.dart';
import 'package:base_module/color.dart';

class ActivitySelectionCell extends StatelessWidget {

  final String title;
  final String description;
  final String rightItem;
  final String subDescription1;
  final String subDescription2;
  final String subDescription3;
  final String subDescription4;

  final VoidCallback _callbackArrowClicked;
  final VoidCallback _callbackCellSelected;
  final String type;
  final String leftIcon;
  final String status;
  final Widget trailingWidget;
  final String colorGradient;
  final double colorGradientPercentage;
  final String PreviewURL;


  ActivitySelectionCell(this.title,
      this.description,
      this.rightItem,
      this.subDescription1,
      this.subDescription2,
      this.subDescription3,
      this._callbackArrowClicked,
      this._callbackCellSelected,
      {this.type,
        this.leftIcon,
        this.subDescription4,
      this.trailingWidget,
      this.status,
      this.colorGradient,
      this.colorGradientPercentage,  this.PreviewURL,});

  
 

  @override
  Widget build(BuildContext context) {
    Widget rightItemWidget;
    if (rightItem == "") {
      rightItemWidget = Container();
    } else if (rightItem.contains(".png")) {
      rightItemWidget = IconButton(
        icon: Image.asset(rightItem),
      );
    } else if (rightItem.isNotEmpty && trailingWidget != null){
      rightItemWidget = trailingWidget;
    }else {
      rightItemWidget = ElevatedButton(
        child: Text(
          rightItem,
          style: TextStyle(color: AppColors.PRIMARY_THEME_COLOR),
        ),
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: AppColors.PRIMARY_THEME_COLOR,
          ),
          primary: AppColors.SECONDARY_THEME_COLOR_RED,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
        ),
        onPressed: () {
          _callbackArrowClicked();
        },
      );
    }


    Widget descriptionRow = Row();
    String imagePath = "assets/images/drawablehdpi/homework/";

    if (type == "study_content") {
      descriptionRow = Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Row(children: [
              Icon(Icons.video_call, color: Colors.amber),
              Icon(Icons.mic, color: Colors.amber),
            ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: Row(children: [
              Text(subDescription1,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          )
        ],
      );
    }
    else if (type == "project_work") {
      descriptionRow = Row(
        mainAxisSize: MainAxisSize.max,
        children: [
         subDescription1.isNotEmpty ?  Container(
            child: Row(children: [
              ImageIcon(
                AssetImage(imagePath + "graded_homework.png"),
                color: Colors.amber,
              ),
              Text(subDescription1,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) : SizedBox(height: 0,width: 0,),
          SizedBox(width: 10),
          subDescription2.isNotEmpty ? Container(
            child: Row(children: [
              ImageIcon(
                AssetImage(imagePath + "student.png"),
                color: Colors.amber,
              ),
              // Icon(Image.asset(imagePath+"student.png"), color: Colors.amber),
              Text(subDescription2,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) :   SizedBox(width: 0,height: 0,),
          SizedBox(width: 10),
          subDescription3.isNotEmpty ? Container(
            child: Row(children: [
              // Icon(Image.asset(imagePath+"group_user.png"), color: Colors.amber),
              ImageIcon(
                AssetImage(imagePath + "group_user.png"),
                color: Colors.amber,
              ),
              Text(subDescription3,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) :   SizedBox(width: 0,height: 0,),
        ],
      );
    }
    else {
      descriptionRow = Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          subDescription1.isNotEmpty ?   Container(
            child: Row(children: [
              Icon(Icons.comment, color: Colors.amber),
              SizedBox(width: MediaQuery.of(context).size.width * 0.002,),
              Text(subDescription1,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) : SizedBox(height: 0,width: 0,),
          SizedBox(width: 10),
          subDescription2.isNotEmpty ?  Container(
            child: Row(children: [
              Icon(Icons.lock_clock, color: Colors.amber),
              SizedBox(width: MediaQuery.of(context).size.width * 0.002,),
              Text(subDescription2,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) :   SizedBox(width: 0,height: 0,),
          SizedBox(width: 10),
         subDescription3.isNotEmpty  ? Container(
            child: Row(children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: MediaQuery.of(context).size.width * 0.002,),
              Text(subDescription3,
                style: TextStyle(
                    fontSize: 9
                ),
              ),
            ],
            ),
          ) :   SizedBox(width: 0,height: 0,),
         ],
      );
    }

    return GestureDetector(
      onTap: () =>
      {
        _callbackCellSelected()
      },
      child:MouseRegion(
        cursor: SystemMouseCursors.click,
        child:Container(
        //margin: EdgeInsets.only(top: 15),
        // height: MediaQuery
        //     .of(context)
        //     .size
        //     .height * 0.159,
        // decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10.0)
        // ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,

                  colors: [

                  colorGradient==null?Colors.white :   HexColor(colorGradient),
                    Colors.white,
                  ],
                  stops: [
               colorGradientPercentage==null?1:colorGradientPercentage,1
                  ]
              ),

          ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
           leftIcon == null || leftIcon.isEmpty ? SizedBox(height: 0,width: 0,) : Column(
             children: [
               Image.asset(
                  leftIcon,
                  fit: BoxFit.fill,
                ),
               status != null && status.isNotEmpty ? Text(getCaptilized(status), style: TextStyle(fontSize: 9),) : SizedBox(height:0,width:0)
             ],
           ),
            Expanded(
              flex: 5,
              child: Container(
                //color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.005,top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01, bottom: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                    children :[
                       Expanded(
                      child:Text(title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontSize: 17,
                        ),
                      ),
                     ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      //Preview
                      (PreviewURL==null || PreviewURL.isEmpty) ? SizedBox():
                          Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                      child:TextButton.icon(
                        onPressed: () {
                          print("Preview Pressed");
                          ReusableWidgets().launchUrlInWebView(PreviewURL, title, context);
                        },
                        label: Text("Preview", style: TextStyle(color: Colors.deepPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.deepPurple,
                          size: 15,
                        ),
                      ),
                        )
                      ),
                      //End Preview
                    ],
                      ),
                      Text(description,
                        style: TextStyle(
                          fontFamily: "RobotoSlab",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      //Spacer(),
                      descriptionRow,
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      subDescription4 == null || subDescription4.isEmpty ?   SizedBox(width: 0,height: 0,) :
                      Text(subDescription4,
                          style: TextStyle(fontSize: 12))
              ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _callbackArrowClicked,
              child: Container(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: rightItemWidget,
                ),
              ),
            ),
          ],
        ),
      ),)
    );
  }
  String getCaptilized(String str){
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }
}
