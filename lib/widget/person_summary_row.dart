import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';

import './../util/time_utils.dart';

class PersonSummaryRow extends StatelessWidget {
  final int duration;
  final String name;

  const PersonSummaryRow({super.key, required this.duration, required this.name});

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: mediaQueryUtil.height(0.01)),
      height: mediaQueryUtil.height(0.08),
      decoration: BoxDecoration(
        color: AppColors.secondary.shade100,
        border: Border(
          bottom: BorderSide(
            width: mediaQueryUtil.height(0.001),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(mediaQueryUtil.height(0.025)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(color: AppColors.mainTextColor, fontWeight: FontWeight.bold),
            ),
            Text(
              TimeUtils.convertSecondsToTimeString(duration),
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
