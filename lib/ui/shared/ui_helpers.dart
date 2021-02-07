import 'package:flutter/material.dart';
import 'dart:math' show cos, sqrt, asin;


class UIHelper {
  static const double _VerticalSpaceSmall = 6.0;
  static const double _VerticalSpaceMedium = 12.0;
  static const double _VerticalSpaceLarge = 24.0;

  static const double _HorizontalSpaceSmall = 6.0;
  static const double _HorizontalSpaceMedium = 12.0;
  static const double HorizontalSpaceLarge = 24.0;

  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  static Widget customHorizontalSpace(double width) {
    return SizedBox(width: width);
  }

}
