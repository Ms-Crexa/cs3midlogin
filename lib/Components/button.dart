import 'package:flutter/material.dart';

Widget customelvatedButton({
  required String text,
  required Color backgroundColor,
  required Color textColor,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
