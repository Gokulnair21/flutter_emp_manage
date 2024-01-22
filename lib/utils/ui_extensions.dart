import 'package:flutter/material.dart';

import 'colors.dart';

extension CustomAppBarExtension on AppBar {
  ///Application common Appbar
  static AppBar customAppBar({required String title, List<Widget>? actions}) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: null,
      actions: actions,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: white),
      ),
    );
  }
}

extension CustomSizedBoxExtension on SizedBox {
  ///Applies only Height to the SizedBox
  static SizedBox h(double height) {
    return SizedBox(height: height);
  }

  ////Applies only width to the SizedBox
  static SizedBox w(double width) {
    return SizedBox(width: width);
  }
}

extension AppSnackBar on SnackBar {
  static SnackBar quickMessage(String message) {
    return SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        content: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 15, color: white),
        ),
        backgroundColor: black);
  }

  static SnackBar quickMessageWithButton(
      String message, String btnName, VoidCallback onPressed) {
    return SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 15, color: white),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                btnName,
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
        backgroundColor: black);
  }
}
