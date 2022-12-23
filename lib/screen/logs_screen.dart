import 'package:call_history/model/filter_container.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/widget/call_log_list_row.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return SizedBox(
      height: mediaQueryUtil.height(0.96),
      child: Consumer<FilterProvider>(
        builder: (context, filterProvider, _) {
          return FutureBuilder(
            future: _getCallLogsFuture(filterProvider),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CallLogListRow> callLogListRows = snapshot.data;
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

  Future<List<CallLogListRow>> _getCallLogsFuture(FilterProvider filterProvider) {
    FilterContainer filterContainer = filterProvider.filterContainer;
    return CallLog.query(
      dateFrom: filterContainer.startDate != null ? filterContainer.startDate!.millisecondsSinceEpoch : null,
      dateTo: filterContainer.endDate != null ? filterContainer.endDate!.millisecondsSinceEpoch : null,
      durationFrom: filterContainer.minDuration * 60,
    ).then((Iterable<CallLogEntry> callLogEntries) {
      List<CallLogEntry> callLogEntryList = callLogEntries.where((e) => _isCallLogEntryValidByFilters(e, filterProvider.filterContainer)).toList(); // Apply filters
      callLogEntryList.sort((a, b) => _compareByTimestamp(a, b)); // Sort by date
      return callLogEntryList.map((e) => _convertCallLogEntriesToCallLogListRows(e)).toList(); // Convert to CallLogRow
    }).catchError((error) => []); // TODO handle error
  }

  /// This additional filter method is needed, because the CallLogs.query method does not provide all filter possibilities.
  bool _isCallLogEntryValidByFilters(CallLogEntry callLogEntry, FilterContainer filterContainer) {
    switch (callLogEntry.callType) {
      case CallType.incoming:
        return filterContainer.isCallTypeIncomingAccepted;
      case CallType.outgoing:
        return filterContainer.isCallTypeOutgoingAccepted;
      case CallType.missed:
        return filterContainer.isCallTypeMissedAccepted;
      case CallType.rejected:
        return filterContainer.isCallTypeRejectedAccepted;
      case CallType.blocked:
        return filterContainer.isCallTypeBlockedAccepted;
      default:
        return false;
    }
  }

  CallLogListRow _convertCallLogEntriesToCallLogListRows(CallLogEntry callLogEntry) {
    return CallLogListRow(callLogEntry: callLogEntry);
  }

  int _compareByTimestamp(CallLogEntry a, CallLogEntry b) {
    if (a.timestamp == null) {
      return 1;
    } else if (b.timestamp == null) {
      return -1;
    }
    return b.timestamp!.compareTo(a.timestamp!);
  }
}
