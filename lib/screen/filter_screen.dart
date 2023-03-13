import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/core/theme/colors.dart';
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/service/call_log_service.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const routeName = "filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _minController = TextEditingController();
  CallLogService callLogService = getIt<CallLogService>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = true;
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.filterScreenName),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(left: mediaQueryUtil.width(0.03), right: mediaQueryUtil.width(0.03), top: mediaQueryUtil.height(0.02), bottom: mediaQueryUtil.height(0.02)),
          child: Consumer<FilterProvider>(
            builder: (context, filterProvider, _) => Column(
              children: [
                _buildStartDateInput(filterProvider, mediaQueryUtil, appLocalizations),
                _buildDivider(mediaQueryUtil),
                _buildEndDateInput(filterProvider, mediaQueryUtil, appLocalizations),
                _buildDivider(mediaQueryUtil),
                _buildCallParticipantInput(filterProvider, mediaQueryUtil, appLocalizations),
                _buildDivider(mediaQueryUtil),
                _buildMinDurationInput(filterProvider, mediaQueryUtil, appLocalizations),
                _buildDivider(mediaQueryUtil),
                _buildCallTypesInput(filterProvider, mediaQueryUtil, appLocalizations),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMinDurationInput(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil, AppLocalizations appLocalizations) {
    _minController.text = filterProvider.filterContainer.minDuration.toString();
    _minController.selection = TextSelection(baseOffset: 0, extentOffset: _minController.value.text.length);
    return Row(
      children: [
        SizedBox(
          width: mediaQueryUtil.width(0.55),
          child: Text(
            appLocalizations.minDurationInfoText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: mediaQueryUtil.width(0.16),
                height: mediaQueryUtil.height(0.06),
                child: TextField(
                  controller: _minController,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  textAlignVertical: TextAlignVertical.top,
                  onSubmitted: (text) {
                    int parsed = int.tryParse(text) ?? 0;
                    filterProvider.update(filterProvider.filterContainer.copyWith(minDuration: parsed));
                  },
                ),
              ),
              if (filterProvider.filterContainer.minDuration != 0)
                IconButton(
                  onPressed: () {
                    filterProvider.update(filterProvider.filterContainer.copyWith(minDuration: 0));
                  },
                  icon: const Icon(Icons.remove_circle_outline_outlined),
                ),
            ],
          ),
        ),
      ],
    );
  }

  _buildStartDateInput(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil, AppLocalizations appLocalizations) {
    return Row(
      children: [
        SizedBox(
          width: mediaQueryUtil.width(0.55),
          child: Text(
            appLocalizations.startDateInfoText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                  if (newDate == null) {
                    // cancel pressed
                    return;
                  }
                  if (filterProvider.filterContainer.endDate != null && newDate.isAfter(filterProvider.filterContainer.endDate!)) {
                    Fluttertoast.showToast(
                      msg: appLocalizations.startDateAfterEndDateError,
                      fontSize: 16,
                      toastLength: Toast.LENGTH_LONG,
                    );
                    filterProvider.update(filterProvider.filterContainer.copyWith(startDate: null));
                    return;
                  }
                  filterProvider.update(filterProvider.filterContainer.copyWith(startDate: newDate));
                },
                child: Text(filterProvider.filterContainer.startDate != null ? DateFormat('dd.MM.yyyy').format(filterProvider.filterContainer.startDate!) : '-'),
              ),
              if (filterProvider.filterContainer.startDate != null)
                IconButton(
                  onPressed: () {
                    filterProvider.update(filterProvider.filterContainer.copyWith(startDate: null));
                  },
                  icon: const Icon(Icons.remove_circle_outline_outlined),
                ),
            ],
          ),
        ),
      ],
    );
  }

  _buildEndDateInput(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil, AppLocalizations appLocalizations) {
    return Row(
      children: [
        SizedBox(
          width: mediaQueryUtil.width(0.55),
          child: Text(
            appLocalizations.endDateInfoText,
            style: const TextStyle(color: AppColors.mainTextColor),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                  if (newDate == null) {
                    // cancel pressed
                    return;
                  }
                  if (filterProvider.filterContainer.startDate != null && newDate.isBefore(filterProvider.filterContainer.startDate!)) {
                    Fluttertoast.showToast(
                      msg: appLocalizations.endDateBeforeEndDateError,
                      fontSize: 16,
                      toastLength: Toast.LENGTH_LONG,
                    );
                    filterProvider.update(filterProvider.filterContainer.copyWith(endDate: null));
                    return;
                  }
                  filterProvider.update(filterProvider.filterContainer.copyWith(endDate: newDate));
                },
                child: Text(filterProvider.filterContainer.endDate != null ? DateFormat('dd.MM.yyyy').format(filterProvider.filterContainer.endDate!) : '-'),
              ),
              if (filterProvider.filterContainer.endDate != null)
                IconButton(
                  onPressed: () {
                    filterProvider.update(filterProvider.filterContainer.copyWith(endDate: null));
                  },
                  icon: const Icon(Icons.remove_circle_outline_outlined),
                ),
            ],
          ),
        ),
      ],
    );
  }

  _buildDivider(MediaQueryUtil mediaQueryUtil) {
    return Divider(
      height: mediaQueryUtil.height(0.07),
      thickness: 0.7,
      color: Colors.grey,
    );
  }

  _buildCallTypesInput(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil, AppLocalizations appLocalizations) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: mediaQueryUtil.width(0.75),
            child: Text(
              appLocalizations.filterIsCallTypeIncomingAccepted,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Switch(
            value: filterProvider.filterContainer.isCallTypeIncomingAccepted,
            onChanged: (isCallTypeIncomingAccepted) {
              filterProvider.update(filterProvider.filterContainer.copyWith(isCallTypeIncomingAccepted: isCallTypeIncomingAccepted));
            },
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: mediaQueryUtil.width(0.75),
            child: Text(
              appLocalizations.filterIsCallTypeOutgoingAccepted,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Switch(
            value: filterProvider.filterContainer.isCallTypeOutgoingAccepted,
            onChanged: (isCallTypeOutgoingAccepted) {
              filterProvider.update(filterProvider.filterContainer.copyWith(isCallTypeOutgoingAccepted: isCallTypeOutgoingAccepted));
            },
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: mediaQueryUtil.width(0.75),
            child: Text(
              appLocalizations.filterIsCallTypeMissedAccepted,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Switch(
            value: filterProvider.filterContainer.isCallTypeMissedAccepted,
            onChanged: (isCallTypeMissedAccepted) {
              filterProvider.update(filterProvider.filterContainer.copyWith(isCallTypeMissedAccepted: isCallTypeMissedAccepted));
            },
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: mediaQueryUtil.width(0.75),
            child: Text(
              appLocalizations.filterIsCallTypeRejectedAccepted,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Switch(
            value: filterProvider.filterContainer.isCallTypeRejectedAccepted,
            onChanged: (isCallTypeRejectedAccepted) {
              filterProvider.update(filterProvider.filterContainer.copyWith(isCallTypeRejectedAccepted: isCallTypeRejectedAccepted));
            },
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: mediaQueryUtil.width(0.75),
            child: Text(
              appLocalizations.filterIsCallTypeBlockedAccepted,
              style: const TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Switch(
            value: filterProvider.filterContainer.isCallTypeBlockedAccepted,
            onChanged: (isCallTypeBlockedAccepted) {
              filterProvider.update(filterProvider.filterContainer.copyWith(isCallTypeBlockedAccepted: isCallTypeBlockedAccepted));
            },
          ),
        ],
      ),
    ]);
  }

  _buildCallParticipantInput(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil, AppLocalizations appLocalizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: mediaQueryUtil.width(0.50),
          child: Text(
            appLocalizations.callParticipantInfoText,
            style: const TextStyle(color: AppColors.mainTextColor),
          ),
        ),
        SizedBox(
          width: mediaQueryUtil.width(0.05),
        ),
        Expanded(
          child: FutureBuilder(
            // Fetch call logs once to get all available call participants.
            future: callLogService.getCallLogsFuture(
              // Empty FilterContainer
              const FilterContainer(
                minDuration: 0,
                isCallTypeIncomingAccepted: true,
                isCallTypeOutgoingAccepted: true,
                isCallTypeMissedAccepted: true,
                isCallTypeRejectedAccepted: true,
                isCallTypeBlockedAccepted: true,
              ),
            ),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CallLogEntry> callLogEntryList = snapshot.data;
                List<String> callParticipants = [];
                for (var element in callLogEntryList) {
                  String contactName = element.name ?? appLocalizations.unknownCallerName;
                  if (!callParticipants.contains(contactName)) {
                    callParticipants.add(contactName);
                  }
                }
                callParticipants.sort();
                List<DropdownMenuItem<String>> items = callParticipants.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
                DropdownButton dropdownButton = DropdownButton(
                  items: items,
                  isExpanded: true,
                  value: filterProvider.filterContainer.callParticipant,
                  onChanged: (item) {
                    filterProvider.update(filterProvider.filterContainer.copyWith(callParticipant: item));
                  },
                );

                IconButton iconButton = IconButton(
                  onPressed: () {
                    filterProvider.update(filterProvider.filterContainer.copyWith(callParticipant: null));
                  },
                  icon: const Icon(Icons.remove_circle_outline_outlined),
                );

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: mediaQueryUtil.width(0.25), child: dropdownButton),
                    iconButton,
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
