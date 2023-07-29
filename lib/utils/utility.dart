


import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../color_constants.dart';

void showRedSnackbar(String message, [int seconds = 2]) {
  GetSnackBar(
      messageText: Text(
        message,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 11.5),
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: AppColors.brownish_red,
      snackPosition: SnackPosition.TOP)
      .show();
}

void showLoader(BuildContext context) {
  Loader.show(context,
      isSafeAreaOverlay: false,
      isBottomBarOverlay: true,
      // overlayFromBottom: 0,
      overlayColor: Colors.black26,
      progressIndicator: const CircularProgressIndicator(
        backgroundColor: AppColors.darkseafoamgreen,
      ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}