// import 'dart:ffi';

import 'package:base_module/color.dart';
import 'package:flutter/material.dart';

class TeacherEvaluationField extends StatelessWidget {
  final String status;
  final String obtianedMarks;
  final String totalMarks;
  final String cbEnteredValue;
  TextEditingController marksTEDController = TextEditingController();


  TeacherEvaluationField({this.status, this.obtianedMarks,this.totalMarks, this.cbEnteredValue});

  @override
  Widget build(BuildContext context) {

    Color bgColor;
    if(status == "correct"){
      bgColor = AppColors.TEACHER_EVALUATED_CORRECT;
    }else if(status == "wrong"){
      bgColor = AppColors.TEACHER_EVALUATED_WRONG;
    }else{
      bgColor = AppColors.TEACHER_NOT_EVALUATED;
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        _getTextWidgetFor("Marks:"),
        _getEnterMarksFieldWidget(),
          _getTextWidgetFor("/"),
          _getTextWidgetFor(totalMarks)
      ],),
    );
  }
  String getEnteredText(){
    return marksTEDController.text;
  }

  Widget _getTextWidgetFor( String text) {
    return Text(text,
      style: TextStyle(
          fontSize: 14,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
          color: Colors.black87),
    );
  }
  Widget _getEnterMarksFieldWidget() {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          ),
      child: IgnorePointer(
        ignoring: true,
        child: TextField(
          enabled: true ,
          controller: marksTEDController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          obscureText: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey, width: 1),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: 5, bottom: 11, top: 11, right: 5),
          ),
        ),
      ),
    );
  }

}

