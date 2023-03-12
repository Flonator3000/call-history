import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/service/call_log_service.dart';
import 'package:call_history/widget/current_filters_card.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_history/widget/person_summary_row.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyzeScreen extends StatefulWidget {
  const AnalyzeScreen({Key? key}) : super(key: key);

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreen();
}

class _AnalyzeScreen extends State<AnalyzeScreen> {
  CallLogService callLogService = getIt<CallLogService>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return Consumer<FilterProvider>(
      builder: (context, filterProvider, _) {
        return Column(
          children: [
            SizedBox(
              height: mediaQueryUtil.height(0.140),
              child: CurrentFiltersCard(filterContainer: filterProvider.filterContainer),
            ),
            SizedBox(
              height: mediaQueryUtil.height(0.02),
            ),
            SizedBox(
              height: mediaQueryUtil.height(0.68),
              child: FutureBuilder(
                future: callLogService.getCallLogsFuture(filterProvider),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<CallLogEntry> callLogEntryList = snapshot.data;
                    List<PersonSummaryRow> personSummaryRowList = _mapToSortedPersonSummaryRows(callLogEntryList);
                    return ListView.builder(
                      itemCount: personSummaryRowList.length,
                      itemBuilder: (context, index) {
                        return personSummaryRowList[index];
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }

  List<PersonSummaryRow> _mapToSortedPersonSummaryRows(List<CallLogEntry> callLogEntryList) {
    List<PersonSummaryRow> personSummaryRows = _mapToPersonSummaryRows(callLogEntryList);
    return _sortPersonSummaryRowsByDuration(personSummaryRows);
  }

  List<PersonSummaryRow> _mapToPersonSummaryRows(List<CallLogEntry> callLogEntryList) {
    Map<String, List<CallLogEntry>> callLogsByName = _mapCallLogEntryListToMapByName(callLogEntryList);
    return _mapCallLogsByNameMapToPersonSummaryRowList(callLogsByName);
  }

  PersonSummaryRow _createPersonSummaryRow(String name, List<CallLogEntry> callLogEntryList) {
    int seconds = callLogEntryList.fold(0, (prev, curr) => prev + curr.duration!);
    return PersonSummaryRow(duration: seconds, name: name);
  }

  Map<String, List<CallLogEntry>> _mapCallLogEntryListToMapByName(List<CallLogEntry> callLogEntryList) {
    Map<String, List<CallLogEntry>> callLogsByName = {};
    for (var e in callLogEntryList) {
      if (e.name != null) {
        if (!callLogsByName.containsKey(e.name)) {
          callLogsByName[e.name!] = [];
        }
        callLogsByName[e.name]!.add(e);
      }
    }
    return callLogsByName;
  }

  List<PersonSummaryRow> _mapCallLogsByNameMapToPersonSummaryRowList(Map<String, List<CallLogEntry>> callLogsByName) {
    return callLogsByName.entries.map((entry) => _createPersonSummaryRow(entry.key, entry.value)).toList();
  }

  List<PersonSummaryRow> _sortPersonSummaryRowsByDuration(List<PersonSummaryRow> personSummaryRows) {
    personSummaryRows.sort((e1, e2) => e2.duration.compareTo(e1.duration));
    return personSummaryRows;
  }
}
