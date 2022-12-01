import 'package:call_history/call_log_list_row.dart';
import 'package:call_history/filter_screen.dart';
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
  Future<Iterable<CallLogEntry>> entries = CallLog.get();

  @override
  Widget build(BuildContext context) {
    print("BUILD method");
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
              future: entries,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SizedBox(
                        height: 600,
                        child: Consumer<FilterProvider>(
                          builder: (context, filterProvider, _) =>
                         ListView(
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.vertical,
                            children: getContent(snapshot, filterProvider.minDuration),
                          ),
                        ),
                      ),
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                );
              })
        ],
      ),
    );
  }

  getContent(AsyncSnapshot snapshot, int minDuration) {
    print("getContent " + minDuration.toString());
    List<CallLogEntry> list = snapshot.data.toList();

    final secondLIst = list
    .where((entry) => (entry.duration! / 60) > minDuration)
        .map((entry) {
      return SizedBox(
        height: 100,
        child: CallLogListRow(
          callLogEntry: entry,
        ),
      );
    }).toList();

    return secondLIst;
  }
}
