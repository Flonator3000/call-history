import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/service/call_log_service.dart';
import 'package:call_history/widget/call_log_list_row.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  CallLogService callLogService = getIt<CallLogService>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return SizedBox(
      height: mediaQueryUtil.height(0.96),
      child: Consumer<FilterProvider>(
        builder: (context, filterProvider, _) {
          return FutureBuilder(
            future: callLogService.getCallLogsFuture(filterProvider.filterContainer),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CallLogEntry> callLogEntryList = snapshot.data;
                List<CallLogListRow> callLogListRows = callLogEntryList.map((e) => _convertCallLogEntriesToCallLogListRows(e)).toList();
                return ListView.builder(
                  itemCount: callLogListRows.length,
                  itemBuilder: (context, index) {
                    return callLogListRows[index];
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  CallLogListRow _convertCallLogEntriesToCallLogListRows(CallLogEntry callLogEntry) {
    return CallLogListRow(callLogEntry: callLogEntry);
  }
}
