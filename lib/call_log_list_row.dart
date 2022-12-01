import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogListRow extends StatelessWidget {
  CallLogEntry callLogEntry;

  CallLogListRow({
    required this.callLogEntry,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          Container(
            color: Colors.amber,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.callLogEntry.name != null ? this.callLogEntry.name! : "-", style: TextStyle(color: Colors.black),),
                    Text(this.callLogEntry.formattedNumber != null ? this.callLogEntry.formattedNumber! : this.callLogEntry.number!, style: TextStyle(color: Colors.black),),
                  ],
                ),
                Column(
                  children: [
                    Text(this.callLogEntry.duration!.toString() + "s", style: TextStyle(color: Colors.black),),
                  ],
                ),
              ],
            ),
          ),
        ],
    );
  }
}
