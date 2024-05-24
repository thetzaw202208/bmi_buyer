import 'package:flutter/material.dart';

extension CustomFontSizeExtension on BuildContext {
  double calculateFontSize() {
    double screenWidth = MediaQuery.of(this).size.width;

    // Calculate font size based on screen width
    // You can adjust these values based on your design requirements
    if (screenWidth < 600) {
      return 10; // For smaller screens
    } else if (screenWidth >= 600 && screenWidth < 1000) {
      return 12.0; // For medium screens
    } else {
      return 14.0; // For larger screens
    }
  }
  double calculateLabelFontSize() {
    double screenWidth = MediaQuery.of(this).size.width;

    // Calculate font size based on screen width
    // You can adjust these values based on your design requirements
    if (screenWidth < 600) {
      return 12; // For smaller screens
    } else if (screenWidth >= 600 && screenWidth < 1000) {
      return 14.0; // For medium screens
    } else {
      return 16.0; // For larger screens
    }
  }
}