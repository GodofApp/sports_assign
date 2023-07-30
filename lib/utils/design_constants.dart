import 'package:flutter/material.dart';

import '../color_constants.dart';

class DesignConstants {
//Common
  static const double margin = 13;
  static const double spacing = 13;

  static const double card_padding = 12;
  static const double card_spacing = 13;

  static const double card_radius_small = 10;
  static List<BoxShadow> getCardShadow() {
    return [
      BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 2),
          blurRadius: 4,
          spreadRadius: 0)
    ];
  }


//bottomsheet
  static const double bottomSheetPadding = 13;
  static const double bottomSheetTopRadius = 25;
  static const double bottomSheetTopBottomSpacing = 24;
  static const double bottomSheetButtonHeight = 50;
  static const double bottomSheetButtonWidth = 360;




}
