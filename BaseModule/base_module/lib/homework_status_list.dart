import 'package:flutter/material.dart';
import 'hex_color.dart';

class HomeworkStatusList extends StatelessWidget {
  final String leftItem;
  final String title;
  final String description;
  final String rightItem;

  HomeworkStatusList(
      this.leftItem, this.title, this.description, this.rightItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              leftItem,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  5,
                  MediaQuery.of(context).size.height * 0.02,
                  MediaQuery.of(context).size.height * 0.02,
                  MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                rightItem,
                style: TextStyle(
                  fontFamily: "RobotoSlab",
                  fontSize: 14,
                ),
              ),
            ),
          ),
          // SizedBox(width: 2)
        ],
      ),
    );
  }
}
