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
    return Container(
      margin: const EdgeInsets.only(bottom: 7.0),
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(224, 224, 224, 1),
        border: Border(
          bottom: BorderSide(
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  callLogEntry.name != null ? callLogEntry.name! : "Unbekannt",
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
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
