import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CurrentFiltersCard extends StatelessWidget {
  final FilterContainer filterContainer;

  const CurrentFiltersCard({super.key, required this.filterContainer});

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    bool isStartDateSet = filterContainer.startDate != null;
    bool isEndDateSet = filterContainer.endDate != null;
    bool isAnyCallTypeSet = filterContainer.isCallTypeIncomingAccepted || filterContainer.isCallTypeOutgoingAccepted;

    return Card(
      color: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: mediaQueryUtil.width(0.02), right: mediaQueryUtil.width(0.04), left: mediaQueryUtil.width(0.04)),
        child: Column(
          children: [
            Text(
              appLocalizations.currentFilterHeadline,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: mediaQueryUtil.height(0.01)),
            if (isStartDateSet || isEndDateSet)
              Row(
                children: [
                  SizedBox(
                    width: mediaQueryUtil.width(0.3),
                    child: Text(appLocalizations.currentFilterTimerange),
                  ),
                  Text(filterContainer.startDate != null && filterContainer.endDate == null ? "${appLocalizations.currentFilterFrom} " : ''),
                  Text(filterContainer.startDate != null ? DateFormat('dd.MM.yyyy').format(filterContainer.startDate!) : ''),
                  Text(filterContainer.startDate == null && filterContainer.endDate != null ? '${appLocalizations.currentFilterUntil} ' : ''),
                  Text(filterContainer.startDate != null && filterContainer.endDate != null ? '  -  ' : ''),
                  Text(filterContainer.endDate != null ? DateFormat('dd.MM.yyyy').format(filterContainer.endDate!) : ''),
                ],
              ),
            if (isAnyCallTypeSet) SizedBox(height: mediaQueryUtil.height(0.01)),
            Row(
              children: [
                SizedBox(
                  width: mediaQueryUtil.width(0.3),
                  child: Text(appLocalizations.currentFilterCallTypes),
                ),
                filterContainer.isCallTypeIncomingAccepted ? Text(appLocalizations.callTypeIncoming) : Container(),
                filterContainer.isCallTypeIncomingAccepted && filterContainer.isCallTypeOutgoingAccepted ? const Text('; ') : Container(),
                filterContainer.isCallTypeOutgoingAccepted ? Text(appLocalizations.callTypeOutgoing) : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
