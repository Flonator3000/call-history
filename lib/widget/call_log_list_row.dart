import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallLogListRow extends StatelessWidget {
  final CallLogEntry callLogEntry;

  const CallLogListRow({
    super.key,
    required this.callLogEntry,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: mediaQueryUtil.height(0.01)),
      height: mediaQueryUtil.height(0.13),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  callLogEntry.name != null ? callLogEntry.name! : "Unknown",
                  style: const TextStyle(color: AppColors.mainTextColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mediaQueryUtil.height(0.01)),
                Text(
                  callLogEntry.formattedNumber != null ? callLogEntry.formattedNumber! : callLogEntry.number!,
                  style: const TextStyle(color: AppColors.mainTextColor),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: mediaQueryUtil.height(0.007),
                ),
                Text(
                  callLogEntry.timestamp != null ? DateFormat('dd-MM-yyyy').format(DateTime.fromMicrosecondsSinceEpoch(callLogEntry.timestamp!)) : '',
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: mediaQueryUtil.height(0.01),
                ),
                Text(
                  callLogEntry.timestamp != null ? DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(callLogEntry.timestamp!)) : '',
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  _getDurationText(callLogEntry.duration!),
                  style: const TextStyle(color: AppColors.mainTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDurationText(int duration) {
    String durationText = "";
    if((duration / 60).round() != 0) {
      durationText = "${(duration / 60).round()}min ";
    }
    durationText = '$durationText${duration % 60}s';
    return durationText;
  }
}
