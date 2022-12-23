import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/service/call_log_service.dart';
import 'package:call_history/widget/call_log_list_row.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  CallLogService callLogService = getIt<CallLogService>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return SizedBox(
      height: mediaQueryUtil.height(0.96),
      child: Consumer<FilterProvider>(
        builder: (context, filterProvider, _) {
          return FutureBuilder(
            future: callLogService.getCallLogsFuture(filterProvider),
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




}
