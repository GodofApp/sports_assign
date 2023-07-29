import 'package:flutter/material.dart';

import '../color_constants.dart';

class DesignConstants {
//Common
  static const double margin = 13;
  static const double padding = 12;
  static const double spacing = 13;
  static const double editTextheight = 40;
  static const double editTextRadius = 7;
  static const double editTextPadding = 13;
  static const double editTextSpace = 34;
  static const double editTextFontSize = 13.5;
  static const double defaultAppbarHeight = 50;
  static const double defaultKycNewHeaderHeight = 58;

  static TextStyle getEditTextStyle() {
    return const TextStyle(
        color: AppColors.darkgreybluetwo,
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: editTextFontSize);
  }

  static TextStyle HeaderTextStyle() {
    return const TextStyle(
        color: AppColors.palegrey,
        fontWeight: FontWeight.w700,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 14.0);
  }

  static TextStyle EditTextHintColor() {
    return const TextStyle(
        color: AppColors.bluegrey2,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 11.5);
  }

//////////

  //Card
  static const double Card_margin = 13;
  static const double card_padding = 12;
  static const double card_radius = 15;
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

  static List<BoxShadow> getStageKycshadow(){
    return [
      BoxShadow(
          color: AppColors.black25,
          offset: Offset(0,0),
          blurRadius: 1,
          spreadRadius: 0
      )
    ];
  }

  static List<BoxShadow> getStageKyc2(){
    return [
      BoxShadow(
          color: AppColors.black25,
          offset: Offset(0,0),
          blurRadius: 0.5,
          spreadRadius: 0
      )
    ];
  }


  static List<BoxShadow> getNoShadow() {
    return [
      BoxShadow(
          color: Colors.transparent,
          offset: Offset(0, 0),
          blurRadius: 0,
          spreadRadius: 0)
    ];
  }

  //end card

  static List<BoxShadow> setOnlyBottomShadow() {
    return [
      const BoxShadow(
          color: AppColors.dark15,
          offset: Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0)
    ];
  }
  static List<BoxShadow> setOnlyTopShadow() {
    return [
      const BoxShadow(
          color: AppColors.dark15,
          offset: Offset(4, 0),
          blurRadius: 12,
          spreadRadius: 0)
    ];
  }

  static const double tabHeight = 45;
  static const double tabFontSize = 11.5;

  static TextStyle gettabFontStyle() {
    return const TextStyle(
        color: AppColors.darkbluegreythree,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: tabFontSize);
  }
// end tab

  //buttons

  static const double buttonHeight = 25;
  static const double buttonRadius = 7;
  static const double buttonPadding = 10;
  static const double buttonTextSize = 12;

  static TextStyle getButtonStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: buttonTextSize);
  }

// endbuttons

//bottomsheet
  static const double bottomSheetPadding = 13;
  static const double bottomSheetTopRadius = 25;
  static const double bottomSheetTopBottomSpacing = 24;
  static const double bottomSheetButtonHeight = 50;
  static const double bottomSheetButtonWidth = 360;

  static TextStyle getBottomSheetHeading() {
    return const TextStyle(
        color: AppColors.darkgreybluetwo,
        fontWeight: FontWeight.w700,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 15.0);
  }

  static TextStyle getBottomSheetButtonTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 12.5);
  }

//end bottomsheet

  //dialog
  static const double dialogPaddingRightLeft = 13;
  static const double dialogPaddingTopBottom = 24;
  static const double dialogRadius = 10;
  static const double dialogButtonHeight = 38;
  static const double dialogButtonRadius = 10;

  static TextStyle getDialogButtonTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 13.5);
  }

  static const double tabIndicatorBorderWidth = 3.0;
//enddialog

//start tournament snackbars
  static const double tournamentSnackbarleftPadding = 10;
  static const double tournamentSnackbartopPadding = 5;
//end tournament snackbar

//Dark theme
  static const double darkThemeTextFieldHeight = 40;

//textfield radius
  static const double darkThemeTextRadius = 8;
  static const double darkThemeSmallButtonRadius = 5;

  //Divider margin inside textfield
  static const double darkThemeDividerMargin = 9;

//bottom nav top radius
  static const double darkThemeBottomNavTopRadius = 20;
  static const double darkThemeBottomNavHeight = 60;

//pot card spacing
  static const double darkThemePurpleCardPadding = 10;
  static const double darkThemePurpleCardHeight = 23;
  static const double darkThemeMainCardPadding = 10;

}
