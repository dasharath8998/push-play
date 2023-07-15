import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// General Util class to format dates, error check and showing dialogs
class Utils {
  static const String dateFormatmmddyyyy = "MM/dd/yyyy";
  static const String dateFormatyyyymmdd = "yyy-MM-dd";
  static const String dateFormat = "yyyy-MM-ddTHH:mm:ssZ";
  static const String dateFormat1 = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormat2 = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormathhmma = "hh:mm a";

  /// validate errorCode and return respected string message
  static String checkFBError(String errorCode) {
    String errorMessage = '';
    switch (errorCode) {
      case "invalid-email":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "operation-not-allowed":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }

  /// get string date of given format as per timestamp
  static String getDateFromTimeStamp(Timestamp? timestamp,
      {String? dateFormat}) {
    if (timestamp != null) {
      return DateFormat(dateFormat ?? dateFormatmmddyyyy)
          .format(timestamp.toDate())
          .toString();
    }
    return '--';
  }

  /// return dateTime from dateString and given date format
  static DateTime? getDateTimeFromString(String? dateString,
      {String? dateFormat}) {
    try {
      if (dateString != null) {
        return DateFormat(dateFormat ?? "yyyy-MM-dd HH:mm:ss")
            .parse(dateString, true);
      }
    } catch (e) {}
  }

  static String? getStringFromDateTime(String? dateString,
      {String? dateFormat}) {
    try {
      DateTime? dt = Utils.getDateTimeFromString(dateString)?.toLocal();
      if (dateString != null && dt != null) {
        return DateFormat(dateFormat ?? "yyyy-MM-dd hh:mm a").format(dt);
      } else {
        return dateString;
      }
    } catch (e) {
      return dateString;
    }
  }

  /// get string date of given format as per timestamp. If failed return '--'
  static String getDateFromString(String? timestamp, {String? dateFormat}) {
    try {
      if (timestamp != null) {
        var date = DateFormat(Utils.dateFormat).parse(timestamp);
        return DateFormat(dateFormat ?? dateFormatmmddyyyy).format(date);
      }
      return '--';
    } catch (e) {
      return '--';
    }
  }

  /// get string time of given format as per timestamp. if failed return '--'
  static String getTimeFromString(String? timestamp, {String? dateFormat}) {
    try {
      if (timestamp != null) {
        var date = DateFormat(Utils.dateFormat).parse(timestamp);
        // if (date.hour == 0 && date.minute == 0) {
        //   return '--';
        // }
        return DateFormat(dateFormat ?? dateFormathhmma).format(date);
      }
      return '--';
    } catch (e) {
      return '--';
    }
  }

  static String getDateFromStringGroup(String? timestamp,
      {String? dateFormat}) {
    try {
      if (timestamp != null) {
        var date = DateFormat(dateFormatyyyymmdd).parse(timestamp);
        return DateFormat(dateFormat ?? dateFormatyyyymmdd).format(date);
      }
    } catch (e) {
      print('Exception ===> $e');
      if (timestamp != null) {
        var date = DateFormat(dateFormatmmddyyyy).parse(timestamp);
        return DateFormat(dateFormat ?? dateFormatmmddyyyy).format(date);
      }
    }
    return '--';
  }

  static DateTime? getDate(String? timestamp, {String? dateFormat}) {
    try {
      if (timestamp != null) {
        return DateFormat(dateFormatyyyymmdd).parse(timestamp);
      }
    } catch (e) {
      if (timestamp != null) {
        return DateFormat(dateFormatmmddyyyy).parse(timestamp);
      }
    }
    return null;
  }

  static DateTime? getTime(String? timestamp, {String? dateFormat}) {
    try {
      if (timestamp != null) {
        return DateFormat(dateFormathhmma).parse(timestamp);
      }
    } catch (e) {
      if (timestamp != null) {
        return DateFormat(dateFormat1).parse(timestamp);
      }
    }
    return null;
  }

  static DateTime? getDateTime(String? timestamp) {
    try {
      if (timestamp != null) {
        var date = DateFormat(dateFormat).parse(timestamp);
        var dateTime = DateFormat(dateFormat1).format(date);
        return DateFormat(dateFormat1).parse(dateTime);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static String getDateTimeFromDate(DateTime dateTime) {
    return DateFormat(dateFormat2).format(dateTime);
  }

  static String getStringTime(String? timestamp, {String? dateFormat}) {
    if (timestamp != null) {
      var date = DateFormat(dateFormathhmma).parse(timestamp);
      return DateFormat(dateFormathhmma).format(date);
    }
    return '';
  }

  static String getStringDateFromDate(DateTime? timestamp,
      {String? dateFormate}) {
    if (timestamp != null) {
      return DateFormat(dateFormate ?? dateFormatyyyymmdd).format(timestamp);
    }
    return '--';
  }

  static String getStringTimeFromDate(DateTime? timestamp) {
    if (timestamp != null) {
      return DateFormat(dateFormathhmma).format(timestamp);
    }
    return '--';
  }

  /// common snack bar hander
  static showSnackBar(BuildContext context, String msg,
      {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    ));
  }

  static String getTimeDif() {
    String date = '';
    if (DateTime.now().timeZoneOffset.isNegative) {
      date += "-";
    } else {
      date += "+";
    }
    final timeZoneSplit = DateTime.now().timeZoneOffset.toString().split(":");

    var hour = int.parse(timeZoneSplit[0]);
    if (hour < 10) {
      date += "0${timeZoneSplit[0]}";
    }
    date += ':' + timeZoneSplit[1];
    return date;
  }

  static String getFileSize(int bytes, int decimals) {
    if (bytes <= 0) return "-- B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        '' +
        suffixes[i];
  }

  static Future<Size> calculateImageDimension(Image image) {
    Completer<Size> completer = Completer();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }
}

extension StringExtension on String? {
  String capitalize() {
    if (this == null) {
      return '';
    } else if (this!.isEmpty) {
      return '';
    } else {
      return "${this![0].toUpperCase()}${this!.substring(1)}";
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
