import 'package:base_module/color.dart';
import 'package:flutter/material.dart';
import 'hex_color.dart';

class ActivityListingCell extends StatelessWidget {
  final String iconName;
  final String title;
  final String description;
  final Widget widgetIncludesData;
  final String status;
  final String progressDisplayName;
  final String progress;
  final bool isCheckBoxEnabled;
  final VoidCallback callbackCellSelected;
  final String colorGradient;
  final double colorGradientPercentage;
  final String progressColorGradient;
  String imagePath = "assets/images/drawablehdpi/homework/";

  ActivityListingCell(
      {this.iconName,
      this.title,
      this.description,
      this.widgetIncludesData,
      this.status,
      this.progressDisplayName,
      this.progress,
      this.isCheckBoxEnabled = false,
      this.callbackCellSelected,
      this.colorGradient,
      this.colorGradientPercentage,
      this.progressColorGradient});

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.height * 0.01;
    return GestureDetector(
        onTap: () => {callbackCellSelected()},
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            //  height: isCheckBoxEnabled ? MediaQuery.of(context).size.height * 0.17 : MediaQuery.of(context).size.height * 0.17,
            width: isCheckBoxEnabled ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: !isCheckBoxEnabled
                  ? Border(
                      bottom: BorderSide(
                        //                   <--- left side
                        color: Color(0xffB179D4),
                        //color: Colors.red,

                        width: 1.5,
                      ),
                    )
                  : Border(),
              gradient: isCheckBoxEnabled
                  ? null
                  : LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                      //Colors.teal,Colors.red
                      HexColor(colorGradient ?? Colors.white),
                      HexColor(progressColorGradient ?? Colors.white),
                    ], stops: [

                      colorGradientPercentage == null ? 1 : 0, colorGradientPercentage
                    ]),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      //   color: Colors.yellow,
                      width: isCheckBoxEnabled ? MediaQuery.of(context).size.width * 0.7 : MediaQuery.of(context).size.width * 0.8,
                      //height: MediaQuery.of(context).size.height * 0.07,
                      //color: Colors.red,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          isCheckBoxEnabled
                              ? SizedBox(
                                  width: 0,
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child: Container(
                                    color: HexColor("#FAF3FF"),
                                    // width: MediaQuery.of(context).size.width * 0.02,
                                    //height: MediaQuery.of(context).size.height * 0.02,

                                    child: Image.asset(
                                      iconName,
                                      height: MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                  ),
                                ),
                          !isCheckBoxEnabled
                              ? SizedBox(
                                  width: 10,
                                )
                              : SizedBox.shrink(),
                          Container(
                            // color: Colors.brown,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: "RobotoSlab", fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.PRIMARY_THEME_COLOR),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Text(
                                    description,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //  color: Colors.grey,
                      // margin: EdgeInsets.only(top: 2),
                      width: isCheckBoxEnabled ? MediaQuery.of(context).size.width * 0.7 : MediaQuery.of(context).size.width * 0.8,
                      // height: MediaQuery.of(context).size.height * 0.02,
                      padding: isCheckBoxEnabled ? EdgeInsets.only(left: 0, bottom: 15) : EdgeInsets.only(left: 5),
                      child: widgetIncludesData,
                    ),
                    Container(
                      //margin: EdgeInsets.only(top: ),
                      padding: EdgeInsets.only(left: 10, top: 5),
                      width: isCheckBoxEnabled ? MediaQuery.of(context).size.width * 0.7 : MediaQuery.of(context).size.width * 0.8,
                      height: isCheckBoxEnabled ? 0 : MediaQuery.of(context).size.height * 0.03,
                      //   color: Colors.orange,
                      child: Text(
                        status,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                isCheckBoxEnabled
                    ? Center(
                        child: Container(
                        child: Image.asset(imagePath + "detail_arrow.png"),
                      ))
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        // color: Colors.brown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: 10,),
                            (progressDisplayName != null && progressDisplayName.isNotEmpty)
                                ? Text(progressDisplayName, style: TextStyle(fontSize: 10))
                                : SizedBox(),
                            const SizedBox(
                              height: 5.0,
                            ),
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
                                    Text(progress),
                                  ],
                                )),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
