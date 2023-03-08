import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/widget/current_filters_card.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return Consumer<FilterProvider>(
      builder: (context, filterProvider, _) {
        return SizedBox(
          height: mediaQueryUtil.height(0.140),
          child: CurrentFiltersCard(filterContainer: filterProvider.filterContainer),
        );
      },
    );
  }
}
