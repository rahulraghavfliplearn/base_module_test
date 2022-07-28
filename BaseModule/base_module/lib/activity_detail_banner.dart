import 'package:flutter/material.dart';
import 'package:base_module/color.dart';
import 'package:flutter/foundation.dart';

class ActivityDetailBanner extends StatelessWidget {

  var mediaQuery;
  final String title;
  final String createdStatus;
  final String clickText;
  final VoidCallback callbackTextClick;
  final bool isThreeLine;
  ActivityDetailBanner({this.title, this.createdStatus, this.clickText, this.callbackTextClick, this.isThreeLine = false });

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    double padding = mediaQuery.size.width * 0.07;

    return Container(
      height: isThreeLine ?  mediaQuery.size.height * 0.16 :  mediaQuery.size.height * 0.14,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(color: AppColors.SECONDARY_THEME_COLOR),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mediaQuery.size.height * 0.037,
            //color: Colors.red,
            margin: EdgeInsets.fromLTRB(padding, kIsWeb?mediaQuery.size.height * 0.02:padding, 0, kIsWeb?mediaQuery.size.height * 0.02:padding * 0.5),
            child: Text(title,
                style: TextStyle(
                  color : AppColors.PRIMARY_THEME_COLOR,
                  fontSize: 20,
                  fontFamily: "RobotoSlab",
                ),
                //maxLines: 2,
                overflow: TextOverflow.ellipsis

            ),
          ),
          Container(
            height:  isThreeLine ? mediaQuery.size.height * 0.05 : mediaQuery.size.height * 0.03,
            margin: EdgeInsets.only(top: 0, left: padding),
            //color: Colors.green,

            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  createdStatus,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Roboto",
                  ),
                 // maxLines: 1,
                ),
                Spacer(),
               //Removed View details from banner as per UI/UX feedback
               // clickText != null && clickText.length > 0 ?  getStatusElevatedButtons(clickText, callbackTextClick): Container(),
                Container(),
                SizedBox(width: 15,)
              ],
            ),
          ),
        ],
      ),
    );
  }

    Widget getStatusElevatedButtons(String statusAction, VoidCallback callbackMethod) {
    return Container(
      height: mediaQuery.size.height * 0.03,
      child: ElevatedButton(
        child: Text(
          statusAction,
          style: TextStyle(color: AppColors.PRIMARY_THEME_COLOR),
        ),
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: AppColors.PRIMARY_THEME_COLOR,
          ),
          primary: Colors.white,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
        ),
        onPressed: () {
          callbackMethod();
        },
      ),
    );
  }

}