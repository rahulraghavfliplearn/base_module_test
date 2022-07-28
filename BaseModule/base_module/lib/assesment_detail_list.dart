import 'package:flutter/material.dart';
import 'hex_color.dart';
import 'package:flutter/services.dart';

class AssesmentDetailList extends StatelessWidget {
  final String id;
  final String title;
  final String type;
  bool isPrime;

  AssesmentDetailList(this.id, this.title, this.type, {this.isPrime = false});

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/drawablehdpi/homework/";

    return Container(
      //margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Question " + id,
                style: TextStyle(
                    fontFamily: "RobotoSlab",
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      fontSize: 16,
                      color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Type: ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    type,
                    style: TextStyle(fontSize: 12),
                  ),
                  isPrime
                      ? Row(
                        children: [
                          SizedBox(width : 5),
                          Image.asset(
                              imagePath + "prime_icon.png",
                            ),
                        ],
                      )
                      : Container()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
