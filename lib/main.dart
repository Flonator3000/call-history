
import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/core/l10n/l10n.dart';
import 'package:call_history/screen/filter_screen.dart';
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/model/hive/box_names.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/screen/logs_screen.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FilterContainerAdapter());
  await Hive.openBox<FilterContainer>(BoxNames.FILTER_CONTAINER_BOX_NAME);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FilterProvider()),
    ], child: Consumer<FilterProvider>(
      builder: (context, provider, _) =>
          MediaQueryUtil(
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const LogsScreen(),
              routes: {
                FilterScreen.routeName: (context) => const FilterScreen(),
              },
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
            ),
          ),
    ),
    );
  }
}