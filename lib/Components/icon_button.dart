import 'package:flutter/material.dart';

Widget customIconButton({
  String? imagePath, // Path for PNG image or URL
  IconData? icon, // Icon data
  required VoidCallback onPressed, // Callback for button press
  Color? backgroundColor, // Background color
  Color? textColor, // Text color
  double? width, // Width of the button
}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath != null
              ? (imagePath.startsWith('http')
                  ? Image.network(imagePath, height: 24) // Load from URL
                  : Image.asset(imagePath, height: 24)) // Load from local asset
              : const SizedBox.shrink(), // Placeholder if no image
          icon != null
              ? Row(
                  children: [
                    Icon(icon, size: 24), // Set size of icon
                    const SizedBox(width: 8), // Spacing between icon and label
                  ],
                )
              : const SizedBox.shrink(), // Placeholder if no icon
        ],
      ),
    ),
  );
}
