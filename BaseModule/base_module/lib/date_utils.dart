import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class DateUtilsNew {
  String convertDateToUiFormat(String strDate) {
    DateTime tempDate = DateTime.parse(strDate);
    return formatDate(tempDate,
        [dd, ' ', MM, ' ', yyyy, ' , ', hh, ':', nn, ':', ss, ' ', am]);
  }

  String refreshDateKey() {
    final now = new DateTime.now();
    return formatDate(now, [yyyy, '/', mm, '/', dd]);
  }

  double getDifferenceInTime(String duration) {
    if (duration != null && duration.isNotEmpty) {
      double currentUnixTime = DateTime
          .now()
          .millisecondsSinceEpoch / 1000;
      return (int.parse(duration) - currentUnixTime) * 1000;
    } else {
      return 0;
    }
  }

  double milliSecondsToMinutes(double millis) {
    if (millis != null) {
      double mins = millis / (1000 * 60);
      return mins;
    } else {
      return 0;
    }
  }

  double milliSecondsToDays(double millis) {
    if (millis != null) {
      double days = millis / (1000 * 60 * 60 * 24);
      return days;
    } else {
      return 0;
    }
  }

  String formatTime(dynamic time) {
    final timeFormat = new NumberFormat("00", "en_US");
    return timeFormat.format(time);
  }

  int getAddedTime(String duration) {
    if (duration != null && duration.isNotEmpty) {
      int durationTime = int.parse(duration) * 1000;
      int currentUnixTime = DateTime
          .now()
          .millisecondsSinceEpoch;
      return durationTime - currentUnixTime;
    } else {
      return 0;
    }
  }

  String getDuration(int value) {
    var v = getDifferenceInTimestamp(value);
    if (v > 0) {
      var totalMinutes = (v / 60).floor();
      var totalHours = (totalMinutes / 60).floor();
      var totalDays = (totalHours / 24).floor();
      var minutes = (totalMinutes % 60).floor();
      var hours = (totalHours % 24).floor();

      if (totalDays > 0)
        return totalDays.toString() + " days ago";
      else if (hours > 0)
        return hours.toString() + " hours ago";
      else if (minutes > 0)
        return minutes.toString() + " minutes ago";
      else if (minutes <= 0) return "0 minutes ago";
    } else
      return "NA";
  }

  double getDifferenceInTimestamp(int duration) {
    if (duration > 0) {
      double currentUnixTime = (DateTime
          .now()
          .millisecondsSinceEpoch / 1000);
      print(currentUnixTime);
      return (currentUnixTime - (duration));
    } else
      return 0;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  String formatDateUI(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String formatDateUIFullMonth(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  String formatDateServer(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String formatDateUIFromString(String date) {
    DateTime tempDate = DateTime.parse(date);
    return DateFormat('dd-MMM hh:mm a').format(tempDate);
  }

  String formatDateOnlyUIFromString(String date) {
    DateTime tempDate = DateTime.parse(date);
    return DateFormat('dd-MMM').format(tempDate);
  }

  String displayDateTime(int time) {
    final df = new DateFormat('dd MMMM yyyy - hh:mm a');
    return df.format(new DateTime.fromMillisecondsSinceEpoch(time * 1000));
  }

  Widget countdownTimer(String startTime, String duration,
      {TextStyle textStyle,
        VoidCallback timerEndCallBack,
        VoidCallback timerThresholdCallback,
        int thresholdMinutes}) {
    return CountdownTimer(
      endTime: ((int.parse(startTime) + (int.parse(duration))) * 1000),
      widgetBuilder: (_, CurrentRemainingTime time) {
        if (time == null) {
          if (timerEndCallBack != null) {
            timerEndCallBack.call();
          }
          return Text('Ended');
        }
        if (time != null &&
            time.days == null &&
            time.hours == null &&
            time.min != null &&
            thresholdMinutes != null &&
            time.min <= thresholdMinutes) {
          if (timerThresholdCallback != null) {
            timerThresholdCallback.call();
          }
        }
        return Text(
          '${time.hours != null
              ? DateUtilsNew().formatTime(time.hours)
              : '00'}:${time.min != null
              ? DateUtilsNew().formatTime(time.min)
              : '00'}:${DateUtilsNew().formatTime(time.sec)}',
          style: textStyle != null ? textStyle : null,
        );
      },
    );
  }
}
