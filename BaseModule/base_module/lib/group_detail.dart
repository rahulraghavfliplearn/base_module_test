import 'package:flutter/material.dart';
import 'package:base_module/color.dart';

class GroupDetailCell extends StatelessWidget {
  final String serialNumber;
  final String status;
  final String lastModifiedDate;
  final String studentsName;
  final String obtainMarks;
  final String totalMarks;
  final Widget viewDetail;


  GroupDetailCell({this.serialNumber, this.status, this.lastModifiedDate, this.studentsName, this.obtainMarks, this.totalMarks, this.viewDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
        child: Row(
          children: [
            SizedBox(
              height: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  serialNumber,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    status,
                    style: TextStyle(
                        fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),

                  ),
                ),
                SizedBox(height: 2),
                lastModifiedDate.isEmpty ? Container() :
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    lastModifiedDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),

                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    studentsName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),

                  ),
                ),
                SizedBox(height: 30),
                viewDetail,
                SizedBox(height: 10),

              ],
            ),
            Spacer(),
            _getMarksContainer(context)

          ],

        ),
      ),
    );
  }

  Widget _getMarksContainer(BuildContext context){
    double padding = MediaQuery.of(context).size.height * 0.01;

    return   Container(
      margin: EdgeInsets.only(right: padding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Marks"),
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
                  Text(obtainMarks),
                  Container(height: 1,
                    width: padding * 2,
                    color: Colors.black,),
                  Text(totalMarks),

                ],)
          ),
        ],
      ),
    );
  }

}
