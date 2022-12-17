import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MediaQueryUtil extends InheritedWidget {
  late double maxContentWidth;
  late double maxContentHeight;

  /// maxContentHeight * multiplier
  double height(double? multiplier) {
    multiplier ??= 1.0;
    if (multiplier < 0.0 || multiplier > 1.0) {
      throw Exception("Invalid multiplier in MediaQueryUtil.height");
    }
    return maxContentHeight * multiplier;
  }

  /// maxContentWidth * multiplier
  double width(double? multiplier) {
    multiplier ??= 1.0;
    if (multiplier < 0.0 || multiplier > 1.0) {
      throw Exception("Invalid multiplier in MediaQueryUtil.width");
    }
    return maxContentWidth * multiplier;
  }

  // ignore: prefer_const_constructors_in_immutables
  MediaQueryUtil({required Widget child, super.key}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MediaQueryUtil of(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBarHeight = mediaQuery.viewPadding.top;

    MediaQueryUtil mediaQueryUtil = context.dependOnInheritedWidgetOfExactType<MediaQueryUtil>() as MediaQueryUtil;
    mediaQueryUtil.maxContentWidth = mediaQuery.size.width;
    mediaQueryUtil.maxContentHeight = mediaQuery.size.height - AppBar().preferredSize.height - statusBarHeight;

    return mediaQueryUtil;
  }
}
