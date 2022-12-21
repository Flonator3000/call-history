import 'package:call_history/core/constant/menu_sections.dart';
import 'package:call_history/core/theme/colors.dart';
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
        PopupMenuButton<MenuSections>(
          itemBuilder: (context) => [..._buildMenuSection(appLocalizations)],
          onSelected: (menuSection) => _onMenuSectionSelected(context, menuSection),
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
          child: Consumer<FilterProvider>(
            builder: (context, filterProvider, _) {
              return FutureBuilder(
                future: CallLog.query(
                  dateFrom: filterProvider.startDate != null ? filterProvider.startDate!.millisecondsSinceEpoch : null,
                  dateTo: filterProvider.endDate != null ? filterProvider.endDate!.millisecondsSinceEpoch : null,
                  durationFrom: filterProvider.minDuration * 60,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<CallLogListRow> callLogListRows = _getCallLogListRows(snapshot);
                    return ListView.builder(
                      itemCount: callLogListRows.length,
                      itemBuilder: (context, index) {
                        return callLogListRows[index];
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  List<CallLogListRow> _getCallLogListRows(AsyncSnapshot snapshot) {
    List<CallLogEntry> data = snapshot.data.toList();
    return data.map((entry) => CallLogListRow(callLogEntry: entry)).toList();
  }

  List<PopupMenuItem<MenuSections>> _buildMenuSection(AppLocalizations appLocalizations) {
    return [
      PopupMenuItem(
        value: MenuSections.LICENSES,
        child: Row(
          children: [
            const Icon(Icons.aod_outlined, color: Colors.black, size: 20),
            const SizedBox(width: 10),
            Text(
              appLocalizations.menuSectionTextLicenses,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ],
        ),
      ),
    ];
  }

  _onMenuSectionSelected(BuildContext context, MenuSections menuSection) {
    switch (menuSection) {
      case MenuSections.LICENSES:
        showLicensePage(context: context); // TODO also set app name and icon https://www.youtube.com/watch?v=9lrLwIHI6IE
        break;
    }
  }
}
