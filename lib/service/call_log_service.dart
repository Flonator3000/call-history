import 'package:call_history/model/filter_container.dart';
import 'package:call_log/call_log.dart';

class CallLogService {
  Future<List<CallLogEntry>> getCallLogsFuture(FilterContainer filterContainer) {
    var callParticipant = filterContainer.callParticipant;
    // TODO find better solution...
    if (callParticipant == 'Unknown' || callParticipant == 'Unbekannt' || callParticipant == 'غير معروف' || callParticipant == 'Άγνωστο' || callParticipant == 'Inconnu' || callParticipant == 'desconocido') {
      callParticipant = null;
    }

    return CallLog.query(
      dateFrom: filterContainer.startDate != null ? filterContainer.startDate!.millisecondsSinceEpoch : null,
      dateTo: filterContainer.endDate != null ? filterContainer.endDate!.millisecondsSinceEpoch : null,
      durationFrom: filterContainer.minDuration * 60,
      name: callParticipant,
    ).then((Iterable<CallLogEntry> callLogEntries) {
      List<CallLogEntry> callLogEntryList = callLogEntries.where((e) => _isCallLogEntryValidByFilters(e, filterContainer)).toList(); // Apply filters
      callLogEntryList.sort((a, b) => _compareByTimestamp(a, b)); // Sort by date
      return callLogEntryList;
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

  int _compareByTimestamp(CallLogEntry a, CallLogEntry b) {
    if (a.timestamp == null) {
      return 1;
    } else if (b.timestamp == null) {
      return -1;
    }
    return b.timestamp!.compareTo(a.timestamp!);
  }
}
