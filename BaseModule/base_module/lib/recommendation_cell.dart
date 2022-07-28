import 'package:base_module/base_ui/screen_type.dart';
import 'package:base_module/date_utils.dart';
import 'package:base_module/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'hex_color.dart';
import 'package:base_module/color.dart';
import 'package:flutter/foundation.dart';
import 'package:base_module/student_avatar.dart';


class RecommendationCell extends StatelessWidget {
  BuildContext context;
  final String startTime;
  final String endTime;
  final String joinBefore;
  var mediaQuery;
  final String duration;
  String description;
  final int id;
  final String type;
  final String title;
  final String courseName;
  final String chapterName;
  final String image;
  final String createdBy;
  final String profilePicture;
  List<String> includeData;
  final bool isHorizontal;
  final String usedCount;
  final String alreadyUsed;
  final String studentDisplayName;
  final String studentCount;
  final String attemptsMessage;
  final Function(int clickedId) callbackRecommendationClicked;
  final String imagePath = "assets/images/drawablehdpi/homework/";
  final String buttonColor;
  final bool isFullScreen;
  final String progressDisplayName;
  RecommendationCell(
      {this.duration,
      this.context,
      this.startTime,
      this.endTime,
      this.id,
      this.title,
      this.courseName,
      this.joinBefore,
      this.chapterName,
      this.image,
      this.createdBy,
      this.profilePicture,
      this.includeData,
      this.isHorizontal,
      this.usedCount,
      this.alreadyUsed,
      this.callbackRecommendationClicked,
      this.studentDisplayName,
      this.studentCount,
      this.buttonColor,
      this.attemptsMessage,
      this.type,
      this.description,this.isFullScreen = false,
      this.progressDisplayName
      });

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        //color: Colors.white,
        width: isHorizontal
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.82,
        constraints: kIsWeb ? BoxConstraints(maxWidth: 400) : BoxConstraints(),
        //height: 100,
        child: Container(
            constraints:
                kIsWeb ? BoxConstraints(maxWidth: 400) : BoxConstraints(),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  renderTitleSubtitleIconRow(),
                  type == "liveclass"
                      ? _renderLiveClassDetails()
                      : renderIncludesData(),
                  //renderStudentData(),
                  type == "liveclass"
                      ? renderCreatedByRow()
                      : renderCreatedByButton()
                  //renderCreatedByRow()
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath + "recom_bg.png")),
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: AppColors.PRIMARY_THEME_COLOR,
              ),
              borderRadius: BorderRadius.circular(isHorizontal ? 5 : 20),
            )),
      ),
    );
  }

  Widget _renderLiveClassDetails() {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Duration: "),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${duration} Minutes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStartsInWidget(startTime, endTime, joinBefore),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Text("Live on: "),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     Text(liveClassDate,
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            //   ],
            // )
          ],
        ));
  }

  Widget renderTitleSubtitleIconRow() {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: isFullScreen
                  ? mediaQuery.size.width * 0.7
                  : mediaQuery.size.width * 0.62,
              constraints:
                  ScreenType.isLargeScreen(context) ? isFullScreen ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8) :  BoxConstraints(maxWidth: 200) : BoxConstraints(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //  width: mediaQuery.size.width * 0.7,
                    //  color: Colors.red,
                    height: 40,
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto Slab",
                          fontWeight: FontWeight.w700,
                          color: AppColors.PRIMARY_THEME_COLOR),
                    ),
                  ),
                  Container(
                    //width: mediaQuery.size.width * 0.7,
                    //color: Colors.yellow,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Roboto Slab",
                              color: Colors.black),
                        ),
                        Flexible(
                          child: Text(
                            chapterName != null && chapterName.isNotEmpty
                                ? " > "
                                : "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Roboto Slab",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            chapterName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Roboto Slab",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kIsWeb
                ? ReusableWidgets().studentAvatar(context, image)
                : Container(child: StudentAvatar(url: image))
          ],
        ),
      ),
    );
  }

  Widget renderIncludesData() {
    String strIncludes =
        isHorizontal ? includeData.join("|") : includeData.join("\n");
    return isHorizontal
        ? Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Includes:",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                Flexible(
                    child: Text(strIncludes,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
          )
        : type != null && type == 'assign'
            ? Container(
                width: MediaQuery.of(context).size.width,
                constraints:
                    ScreenType.isLargeScreen(context) ? isFullScreen ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85) :  BoxConstraints(maxWidth: 400) : BoxConstraints(),
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    description != null && description.isNotEmpty
                        ? Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Description",  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),),
                                Flexible(
                                  child: Text(
                                    '${description != null && description.isNotEmpty ? description : "NA"}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Added heading
                        (progressDisplayName!=null && progressDisplayName.isNotEmpty) ? Text(progressDisplayName,style: TextStyle(fontSize: 10)):SizedBox() ,
                        SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.PRIMARY_THEME_COLOR_LIGHT,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 25, bottom: 25),
                            child: Text(
                              attemptsMessage,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                  ],
                ),
              )
            : Container(
                constraints:
                    kIsWeb ? BoxConstraints(maxWidth: 400) : BoxConstraints(),
                margin: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                            visible: strIncludes.isNotEmpty,
                            child: Text("Includes:",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal))),
                        Text(strIncludes,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text("Heading"),
                        (progressDisplayName!=null && progressDisplayName.isNotEmpty) ? Text(progressDisplayName,style: TextStyle(fontSize: 10)):SizedBox() ,
                        SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.PRIMARY_THEME_COLOR_LIGHT,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 25, bottom: 25),
                            child: Text(
                              attemptsMessage,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                  ],
                ),
              );
  }

  Widget renderStudentData() {
    return studentDisplayName.length > 0
        ? Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("$studentDisplayName : ",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                Flexible(
                    child: Text(studentCount != null ? studentCount : "",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
          )
        : SizedBox(
            height: 1,
          );
  }

  Widget renderCreatedByButton() {
    return Center(
      child: Container(
        constraints: kIsWeb ? BoxConstraints(maxWidth: 300) : BoxConstraints(),
        width: mediaQuery.size.width * 0.7,
        child: IgnorePointer(
          ignoring: true,
          child: ElevatedButton(
            onPressed: (){},
              style: OutlinedButton.styleFrom(
                backgroundColor: buttonColor != null && buttonColor.isNotEmpty
                    ? HexColor(buttonColor)
                    : AppColors.PRIMARY_THEME_COLOR,
                primary: Colors.white,
                textStyle: TextStyle(color: Colors.white),
                side: BorderSide(
                  width: 1.0,
                  color: buttonColor != null && buttonColor.isNotEmpty
                      ? HexColor(buttonColor)
                      : AppColors.PRIMARY_THEME_COLOR,
                ),
              ),

              child: Text(createdBy, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }

  Widget renderCreatedByRow() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 2,
            color: AppColors.TEXT_FIELD_BORDER,
            margin: EdgeInsets.only(bottom: 5),
          ),
          Row(
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: StudentAvatar(
                    url: profilePicture,
                    iconSize:kIsWeb? null: mediaQuery.size.width * 0.08,
                  )),
              Row(
                children: [
                  Text(
                    " Created By: ",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text("${createdBy}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStartsInWidget(
      String startTime, String endTime, String joinBefore) {
    if (DateUtilsNew().getDifferenceInTime(endTime) < 0) {
      return Text(
        "Class Over",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      );
    } else if (DateUtilsNew().milliSecondsToMinutes(DateUtilsNew()
            .getDifferenceInTime((int.parse(startTime) + 0).toString())) <=
        (int.parse(joinBefore) / 60)) {
      return Text("Live",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
    } else {
      if (DateUtilsNew()
              .milliSecondsToDays(DateUtilsNew()
                  .getDifferenceInTime((int.parse(startTime) + 0).toString()))
              .floor() >
          0) {
        if (DateUtilsNew()
                .milliSecondsToDays(DateUtilsNew()
                    .getDifferenceInTime((int.parse(startTime) + 0).toString()))
                .floor() ==
            1) {
          return Text('Starts in 1 day',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
        } else {
          return Text(
              'Starts in ' +
                  DateUtilsNew()
                      .milliSecondsToDays(DateUtilsNew().getDifferenceInTime(
                          (int.parse(startTime) + 0).toString()))
                      .floor()
                      .toString() +
                  ' days',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
        }
      } else {
        return CountdownTimer(
          endTime: DateTime.now().millisecondsSinceEpoch +
              DateUtilsNew().getAddedTime(startTime),
          widgetBuilder: (_, CurrentRemainingTime time) {
            if (time == null) {
              return Text('Live',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
            }
            return Text(
                'Starts in: ' +
                    '${time.hours != null ? DateUtilsNew().formatTime(time.hours) : '00'}:${time.min != null ? DateUtilsNew().formatTime(time.min) : '00'}:${DateUtilsNew().formatTime(time.sec)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
          },
        );
      }
    }
  }
}
