import 'package:call_history/call_log_list_row.dart';
import 'package:call_history/screen/filter_screen.dart';
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/model/hive/box_names.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  Future<Iterable<CallLogEntry>> entries = CallLog.get();

  @override
  Widget build(BuildContext context) {


    AppBar appBar = AppBar(
      title: Text("LogsScreen"),
      actions: [
        IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.filter_alt),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(FilterScreen.routeName);
              },
            ))
      ],
    );

    final mediaQuery = MediaQuery.of(context);
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final maxContentHeight = mediaQuery.size.height - appBar.preferredSize.height - statusBarHeight;
    final maxContentWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(left: maxContentWidth * 0.03, right: maxContentWidth * 0.03, top: maxContentHeight * 0.02, bottom: maxContentHeight * 0.02),
        child: SizedBox(
          height: maxContentHeight * 0.96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                    future: entries,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                              Consumer<FilterProvider>(
                                  builder: (context, filterProvider, _) {
                                    List<CallLogListRow> content = getContent(
                                        snapshot, filterProvider.minDuration,
                                        filterProvider.startDate,
                                        filterProvider.endDate);
                                    return Expanded(
                                      child: ListView.builder(
                                          itemCount: content.length,
                                          itemBuilder: (context, index) {
                                            return content[index];
                                          }
                                      ),
                                    );
                                  }
                            ),
                        ];
                      } else if (snapshot.hasError) {
                        children = <Widget>[
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Text('Error: ${snapshot.error}'),
                        ];
                      } else {
                        children = const <Widget>[
                          CircularProgressIndicator(),
                          Text('Awaiting result...'),
                        ];
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<CallLogListRow> getContent(AsyncSnapshot snapshot, int minDuration,
      DateTime? startDate,
      DateTime? endDate) {
    List<CallLogEntry> list = snapshot.data.toList();

    final secondLIst = list
        .where((entry) => (entry.duration! / 60) > minDuration)
        .where((entry) {
      if (startDate != null) {
        return entry.timestamp! >= startDate.millisecondsSinceEpoch;
      }
      return true;
    }).where((entry) {
      if (endDate != null) {
        return entry.timestamp! <= endDate.millisecondsSinceEpoch;
      }
      return true;
    }).map((entry) {
      return CallLogListRow(
        callLogEntry: entry,
      );
    }).toList();

    return secondLIst;
  }
}
