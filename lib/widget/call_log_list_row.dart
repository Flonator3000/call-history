import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

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
        color: const Color.fromRGBO(224, 224, 224, 1),
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
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mediaQueryUtil.height(0.01)),
                Text(
                  callLogEntry.formattedNumber != null ? callLogEntry.formattedNumber! : callLogEntry.number!,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${callLogEntry.duration!}s",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
