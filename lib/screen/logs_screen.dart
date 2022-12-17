import 'package:call_history/widget/call_log_list_row.dart';
import 'package:call_history/screen/filter_screen.dart';
import 'package:call_history/provider/FilterProvider.dart';
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
    AppBar appBar = AppBar(
      title: const Text("LogsScreen"),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          },
        ),
      ],
    );

    final mediaQuery = MediaQuery.of(context);
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final maxContentHeight = mediaQuery.size.height - appBar.preferredSize.height - statusBarHeight;
    final maxContentWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(
          left: maxContentWidth * 0.03,
          right: maxContentWidth * 0.03,
          top: maxContentHeight * 0.02,
          bottom: maxContentHeight * 0.02,
        ),
        child: SizedBox(
          height: maxContentHeight * 0.96,
          child: FutureBuilder(
            future: CallLog.get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Consumer<FilterProvider>(builder: (context, filterProvider, _) {
                  List<CallLogListRow> callLogListRows = getCallLogListRows(snapshot, filterProvider);
                  return ListView.builder(
                        itemCount: callLogListRows.length,
                        itemBuilder: (context, index) {
                          return callLogListRows[index];
                        },
                  );
                });
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  List<CallLogListRow> getCallLogListRows(AsyncSnapshot snapshot, FilterProvider filterProvider) {
    List<CallLogEntry> list = snapshot.data.toList();

    return list.where((entry) => (entry.duration! / 60) > filterProvider.minDuration).where((entry) {
      if (filterProvider.startDate != null) {
        return entry.timestamp! >= filterProvider.startDate!.millisecondsSinceEpoch;
      }
      return true;
    }).where((entry) {
      if (filterProvider.endDate != null) {
        return entry.timestamp! <= filterProvider.endDate!.millisecondsSinceEpoch;
      }
      return true;
    }).map((entry) {
      return CallLogListRow(
        callLogEntry: entry,
      );
    }).toList();
  }
}