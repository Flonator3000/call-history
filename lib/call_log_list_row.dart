import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogListRow extends StatelessWidget {
  CallLogEntry callLogEntry;

  CallLogListRow({
    required this.callLogEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7.0),
      height: 100,
      decoration: BoxDecoration(
          color: Color.fromRGBO(224, 224, 224, 1),
          border: Border(
              bottom: BorderSide(
            width: 0.5,
          ))),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.callLogEntry.name != null
                      ? this.callLogEntry.name!
                      : "Unbekannt",
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  this.callLogEntry.formattedNumber != null
                      ? this.callLogEntry.formattedNumber!
                      : this.callLogEntry.number!,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  this.callLogEntry.duration!.toString() + "s",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
