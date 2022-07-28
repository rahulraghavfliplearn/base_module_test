import 'package:base_module/color.dart';
import 'package:flutter/material.dart';
import 'hex_color.dart';
import 'package:base_module/student_avatar.dart';

class ActivityListingCellV2 extends StatelessWidget {
  final String iconName;
  final String title;
  final String description;
  final Widget widgetIncludesData;
  final String status;

  final bool isCheckBoxEnabled;
  final VoidCallback callbackCellSelected;
  final String colorGradient;
  final double colorGradientPercentage;
  final String progressColorGradient;
  bool isFromRecommendation;
  String imagePath = "assets/images/drawablehdpi/homework/";
  final bool shouldHideIcon;
  final String activityDisplayName;
  final String progress;
  final String progressDisplayName;
  final String progressIcon;
  final String progressTextColor;
  final String progressEvalIcon;


  ActivityListingCellV2({this.iconName,
    this.title,
    this.description,
    this.widgetIncludesData,
    this.status,

    this.isCheckBoxEnabled = false,
    this.callbackCellSelected,
    this.colorGradient,
    this.colorGradientPercentage,
    this.progressColorGradient,
    this.isFromRecommendation = false,
    this.activityDisplayName = "",
    this.shouldHideIcon = false,
    this.progress,
    this.progressDisplayName,
    this.progressIcon,
    this.progressTextColor,
    this.progressEvalIcon,
  });

  Widget _buildRowTitle(BuildContext context) {
    return Row(
      children: [
        isCheckBoxEnabled || shouldHideIcon
            ? SizedBox.shrink()
            : Container(
          color: HexColor("#FAF3FF"),
          child: Image.asset(
            iconName,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(width: 10,),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColors.PRIMARY_THEME_COLOR
                  ),
                ),
              ),
              //const SizedBox(height: 5.0),
              description != null && description.isNotEmpty ? Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressView(BuildContext context) {
    return isCheckBoxEnabled ? Center(child: Container(child: Image.asset(imagePath + "detail_arrow.png"),)) : Column(
      children: [
        const SizedBox(height: 8.0,),
        (progressDisplayName != null && progressDisplayName.isNotEmpty) ? Text(progressDisplayName, style: TextStyle(fontSize: 10)) : SizedBox(),
        SizedBox(height: 5),
        progress != null && progress.isNotEmpty ? Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.09,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.PRIMARY_THEME_COLOR_LIGHT,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(progress ?? ""),
              ],)
        ) : SizedBox.shrink(),
      ],
    );
  }

  Widget renderProgressStatusUpdated() {
    if (isCheckBoxEnabled) {
      return Center(child: Container(child: Image.asset(imagePath + "detail_arrow.png"),));
    } else {
      Color textColor = Colors.black;
      Widget widgetStatus = SizedBox.shrink();
      if(progressTextColor != null && progressTextColor.isNotEmpty){
        textColor = HexColor(progressTextColor);
      }
      Widget widgetDisplayName = Text(
        progressDisplayName != null && progressDisplayName.isNotEmpty ? progressDisplayName : "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: textColor),
      );

      //Evaluated
      if (progressEvalIcon != null &&
          progressEvalIcon != "") {
        widgetStatus = Container(
          //color: Colors.yellow,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widgetDisplayName,
                    SizedBox(width: 3,),
                    StudentAvatar(
                      url: progressEvalIcon,
                      iconSize: 20,
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                renderProgressWithBox()
              ],
            )
        );
      }
      //Submitted, Attempt In progress, Evaluation in Progress, not attempted
      else if (progressIcon != null &&
          progressIcon != "") {
        widgetStatus = Container(
          // color: Colors.red,
            width: 70,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widgetDisplayName,
                SizedBox(height: 5,),
                StudentAvatar(
                  url: progressIcon,
                  iconSize: 40,
                ),
              ],
            )
        );
      }
      else {
        widgetStatus = Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widgetDisplayName,
              renderProgressWithBox(),
            ],
          ),
        );
      }


      return widgetStatus;
    }
  }

  Container renderProgressWithBox() {
    return Container(
      height: 50,
      width:
          progress != null ? progress.length > 5
          ? 60
          : 50
          : 50,
      decoration: BoxDecoration(
        //color: Colors.red,
          color: Color(0xffF6EDFF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
          child: Text(
            progress != null ? progress : "",
              style: TextStyle(
                  color:  Colors.black,

               //   color: progressTextColor != null ? HexColor(progressTextColor) : Colors.black,
              fontSize: 12),
          )
    ));
  }


  Widget _buildIncludesData(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: isCheckBoxEnabled ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 0),
      child: widgetIncludesData,
    );
  }

  _buildActivityDisplayName() {
    String name = "";
    if (activityDisplayName.toLowerCase() == "study_content_v2") {
      name = "Study Content";
    }
    else if (activityDisplayName.toLowerCase() == "project_work") {
      name = "Project Work";
    }
    else if (activityDisplayName.toLowerCase() == "assessment") {
      name = "Assessment";
    }

    return Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(left: 15, bottom: 5),
        decoration: BoxDecoration(
          color: AppColors.SECONDARY_THEME_COLOR,
          border: Border.all(
              width: 0.3,
              color: AppColors.PRIMARY_THEME_COLOR
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(name,
          style: TextStyle(fontFamily: "Roboto Slab", color: Colors.black, fontSize: 10),)
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: ),
      padding: EdgeInsets.only(left: 0, top: 5),
      // color: Colors.orange,
      child: Text(status,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 10,
          fontWeight: FontWeight.w600,

        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery
        .of(context)
        .size
        .height * 0.01;
    return GestureDetector(
        onTap: () => {callbackCellSelected()},
        child: Container(
            decoration: BoxDecoration(
              gradient: isCheckBoxEnabled ? null : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    colorGradientPercentage == 0 ? Colors.white :
                    // HexColor(colorGradient),
                    // HexColor(progressColorGradient),
                    HexColor(colorGradient ?? Colors.white),
                    HexColor(progressColorGradient ?? Colors.white),
                  ],
                  stops: [
                    //colorGradientPercentage==null?1:colorGradientPercentage,1
                    colorGradientPercentage == null ? 1 : 0, colorGradientPercentage
                  ]
              ),

            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8.0,),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shouldHideIcon ? _buildActivityDisplayName() : SizedBox.shrink(),
                          _buildRowTitle(context),
                          _buildIncludesData(context),
                          _buildStatus(context),
                          const SizedBox(height: 8.0)
                        ],
                      ),
                    ),
                    isFromRecommendation ? SizedBox.shrink() : renderProgressStatusUpdated(),
                    const SizedBox(width: 8.0,)
                  ],
                ),
              ],
            )));
  }
}
