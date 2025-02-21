import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSnakbars {
  static void showSnackBar(
    BuildContext context, {
    required String title,
    String message = "",
    required Color backgroundColor,
    required IconData icon,
    int durationInSeconds = 2,
  }) {
    final snackBar = SnackBar(
      padding: EdgeInsets.all(8),

      content: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (message.isNotEmpty)
                    Text(message, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: durationInSeconds),
      margin: const EdgeInsets.all(20),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void successSnackBar(
    BuildContext context, {
    required String title,
    String message = "",
  }) {
    showSnackBar(
      context,
      title: title,
      message: message,
      backgroundColor: ColorsManager.maingreen,
      icon: Iconsax.check,
    );
  }

  static void warningSnackBar(
    BuildContext context, {
    required String title,
    String message = "",
  }) {
    showSnackBar(
      context,
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      icon: Iconsax.warning_2,
    );
  }

  static void errorSnackBar(
    BuildContext context, {
    required String title,
    String message = "",
  }) {
    showSnackBar(
      context,
      title: title,
      message: message,
      backgroundColor: Colors.red.shade600,
      icon: Iconsax.warning_2,
      durationInSeconds: 4,
    );
  }
}
