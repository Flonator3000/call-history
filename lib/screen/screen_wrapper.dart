import 'package:call_history/core/constant/menu_sections.dart';
import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/screen/analyze_screen.dart';
import 'package:call_history/screen/export_screen.dart';
import 'package:call_history/screen/filter_screen.dart';
import 'package:call_history/screen/history_screen.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:showcaseview/showcaseview.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  int currentBottomNavigationIndex = 0;
  final showCaseKey1 = GlobalKey();
  final screens = [
    const HistoryScreen(),
    const AnalyzeScreen(),
    const ExportScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        showCaseKey1,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return Scaffold(
      appBar: _buildAppBar(currentBottomNavigationIndex, appLocalizations, mediaQueryUtil),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentBottomNavigationIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() {
          currentBottomNavigationIndex = index;
        }),
        backgroundColor: AppColors.primary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: _getScreenNameByBottomNavigationIndex(0, appLocalizations),
          ),
          BottomNavigationBarItem(icon: const Icon(Icons.trending_up), label: _getScreenNameByBottomNavigationIndex(1, appLocalizations)),
          BottomNavigationBarItem(icon: const Icon(Icons.download), label: _getScreenNameByBottomNavigationIndex(2, appLocalizations)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: mediaQueryUtil.width(0.025),
          right: mediaQueryUtil.width(0.025),
          top: mediaQueryUtil.height(0.015),
          bottom: mediaQueryUtil.height(0.015),
        ),
        child: screens[currentBottomNavigationIndex],
      ),
    );
  }

  _onMenuSectionSelected(BuildContext context, MenuSections menuSection) {
    switch (menuSection) {
      case MenuSections.LICENSES:
        showLicensePage(
          context: context,
          applicationName: "Call Logs",
          applicationIcon: Image.asset(
            'assets/logo.png',
            width: 48,
            height: 48,
          ),
        );
        break;
    }
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

  _buildAppBar(int currentBottomNavigationIndex, AppLocalizations appLocalizations, MediaQueryUtil mediaQueryUtil) {
    return AppBar(
      title: Text(_getScreenNameByBottomNavigationIndex(currentBottomNavigationIndex, appLocalizations)),
      actions: [
        PopupMenuButton<MenuSections>(
          itemBuilder: (context) => [..._buildMenuSection(appLocalizations)],
          onSelected: (menuSection) => _onMenuSectionSelected(context, menuSection),
        ),
        Showcase.withWidget(
          key: showCaseKey1,
          container: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: mediaQueryUtil.width(0.5),
                height: mediaQueryUtil.height(0.05),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.secondary.shade800,
                ),
                child: Center(
                  child: Text(
                    appLocalizations.showcaseFilter,
                    style: const TextStyle(
                      color: AppColors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          width: mediaQueryUtil.width(0.5),
          height: mediaQueryUtil.height(0.05),
          child: IconButton(
            icon: const Icon(Icons.filter_alt),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ),
      ],
    );
  }

  _getScreenNameByBottomNavigationIndex(int bottomNavigationIndex, AppLocalizations appLocalizations) {
    switch (bottomNavigationIndex) {
      case 0:
        return appLocalizations.logScreenName;
      case 1:
        return appLocalizations.analyzeScreenName;
      case 2:
        return appLocalizations.exportScreenName;
      default:
        return 'Call logs';
    }
  }
}
