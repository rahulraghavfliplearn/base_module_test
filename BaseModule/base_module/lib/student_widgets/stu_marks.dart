import 'package:flutter/material.dart';

import '../student_avatar.dart';
class StuMarks extends StatelessWidget {
final String icon;
final String progressDisplayName;
final String progressCompletion;
  const StuMarks({this.icon, this.progressDisplayName, this.progressCompletion});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            progressDisplayName == null || progressDisplayName.isEmpty
                ? 'Attempts'
                : progressDisplayName,
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            height: 8,
          ),
          icon == null || icon.isEmpty
              ? Container(
            height: 40,
            width: progressCompletion != null
                ? progressCompletion.length > 5
                ? 50
                : 40
                : 40,
            decoration: BoxDecoration(
                color: Color(0xffF6EDFF),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(
                  progressCompletion == null || progressCompletion.isEmpty
                      ? '_'
                      : progressCompletion,
                  style: TextStyle(color: Color(0xff56008C), fontSize: 12),
                )),
          )
              : Container(
            child: StudentAvatar(
              url: icon,
              iconSize: 30,
            ),
          ),
          Spacer(),
        ],
      ),
    );
}}
