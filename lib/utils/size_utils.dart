import 'package:flutter/cupertino.dart';

/// Sizeutils are mostly the media query and constraints that will help you in setups widget with respect to screen boundaries
class SizeUtils {
  static double? _widthMultiplier;
  static double? _heightMultiplier;
  static double? screenWidth;
  static double? screenHeight;
  static bool? isTablet;

  static void init(BoxConstraints boxConstraints, Orientation orientation) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    screenWidth = boxConstraints.maxWidth;
    screenHeight = boxConstraints.maxHeight;
    if (orientation == Orientation.portrait) {
      _widthMultiplier = boxConstraints.maxWidth / 100;
      _heightMultiplier = boxConstraints.maxHeight / 100;
    } else {
      _widthMultiplier = boxConstraints.maxHeight / 100;
      _heightMultiplier = boxConstraints.maxWidth / 100;
    }
    isTablet = screenWidth! > 600.0;
  }

  static double get(double size) {
    if (screenWidth! < 600) {
      return size;
    } else {
      return size * 1.5;
    }
  }

  static double getFontSize(double size) {
    if (screenWidth! < 600) {
      return size;
    } else {
      return size * 1.5;
    }
  }

  static double getHeightAsPerPercent(double percent) {
    bool isSmallDevice = SizeUtils.screenHeight! < 600;
    bool isTablet = SizeUtils.screenWidth! > 600;

    if (isSmallDevice) {
      percent = percent - (percent * 0.3);
    }
    return screenHeight! * (percent / 100);
  }

  static double getWidthAsPerPercent(double percent) {
    return screenWidth! * (percent / 100);
  }
}
