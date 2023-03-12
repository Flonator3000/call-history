import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/util/time_utils.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CallLogListRow extends StatelessWidget {
  final CallLogEntry callLogEntry;

  const CallLogListRow({
    super.key,
    required this.callLogEntry,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.only(bottom: mediaQueryUtil.height(0.01)),
      height: mediaQueryUtil.height(0.13),
      decoration: BoxDecoration(
        color: AppColors.secondary.shade100,
        border: Border(
          bottom: BorderSide(
            width: mediaQueryUtil.height(0.001),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: mediaQueryUtil.height(0.025), right: mediaQueryUtil.width(0.025), left: mediaQueryUtil.width(0.04)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: mediaQueryUtil.width(0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    callLogEntry.name != null ? callLogEntry.name! : appLocalizations.unknownCallerName,
                    style: const TextStyle(color: AppColors.mainTextColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: mediaQueryUtil.height(0.01)),
                  Text(
                    callLogEntry.formattedNumber != null ? callLogEntry.formattedNumber! : callLogEntry.number!,
                    style: const TextStyle(color: AppColors.mainTextColor),
                  ),
                  SizedBox(height: mediaQueryUtil.height(0.01)),
                  _getCallTypeRowByCallType(callLogEntry.callType, appLocalizations),
                ],
              ),
            ),
            SizedBox(
              width: mediaQueryUtil.width(0.25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    callLogEntry.timestamp != null ? DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(callLogEntry.timestamp!)) : '',
                    style: const TextStyle(
                      color: AppColors.mainTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryUtil.height(0.01),
                  ),
                  Text(
                    callLogEntry.timestamp != null ? DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(callLogEntry.timestamp!)) : '',
                    style: const TextStyle(
                      color: AppColors.mainTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: mediaQueryUtil.width(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    TimeUtils.convertSecondsToTimeString(callLogEntry.duration!),
                    style: const TextStyle(color: AppColors.mainTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCallTypeRowByCallType(CallType? callType, AppLocalizations appLocalizations) {
    if (callType == null) {
      return Container();
    }
    switch (callType) {
      case CallType.incoming:
        return Row(
          children: [
            const Icon(
              Icons.call_received,
              size: 16.0,
            ),
            Text(
              appLocalizations.callTypeIncoming,
              style: const TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 10.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      case CallType.outgoing:
        return Row(
          children: [
            const Icon(
              Icons.call_made,
              size: 16.0,
            ),
            Text(
              appLocalizations.callTypeOutgoing,
              style: const TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 10.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      case CallType.missed:
        return Row(
          children: [
            const Icon(Icons.call_missed),
            const SizedBox(width: 3.0),
            Text(
              appLocalizations.callTypeMissed,
              style: const TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 10.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      case CallType.rejected:
        return Text(
          appLocalizations.callTypeRejected,
          style: const TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 10.0,
            fontStyle: FontStyle.italic,
          ),
        );
      case CallType.blocked:
        return Text(
          appLocalizations.callTypeBlocked,
          style: const TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 10.0,
            fontStyle: FontStyle.italic,
          ),
        );
      default:
        return Container();
    }
  }
}
