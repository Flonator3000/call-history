import 'package:call_history/widget/call_log_list_row.dart';
import 'package:call_history/screen/filter_screen.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    AppBar appBar = AppBar(
      title: Text(appLocalizations.logScreenName),
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

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(
          left: mediaQueryUtil.width(0.03),
          right: mediaQueryUtil.width(0.03),
          top: mediaQueryUtil.height(0.02),
          bottom: mediaQueryUtil.height(0.02),
        ),
        child: SizedBox(
          height: mediaQueryUtil.height(0.96),
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
