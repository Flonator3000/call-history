import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/widget/media_query_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const routeName = "filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _minController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryUtil mediaQueryUtil = MediaQueryUtil.of(context);

    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = true;
        //TODO shouldPop = await showWarning(context); https://www.youtube.com/watch?v=vEmJLvL1pzQ
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: mediaQueryUtil.width(0.03), right: mediaQueryUtil.width(0.03), top: mediaQueryUtil.height(0.02), bottom: mediaQueryUtil.height(0.02)),
          child: Consumer<FilterProvider>(
            builder: (context, filterProvider, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMinDuration(filterProvider, mediaQueryUtil),
                SizedBox(
                  height: mediaQueryUtil.height(0.03),
                ),
                _buildStartDateRow(filterProvider),
                SizedBox(
                  height: mediaQueryUtil.height(0.03),
                ),
                _buildEndDateRow(filterProvider),
                SizedBox(
                  height: mediaQueryUtil.height(0.03),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMinDuration(FilterProvider filterProvider, MediaQueryUtil mediaQueryUtil) {
    _minController.text = filterProvider.minDuration.toString();
    _minController.selection = TextSelection(baseOffset: 0, extentOffset: _minController.value.text.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Min duration',
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            SizedBox(
              width: mediaQueryUtil.width(0.17),
              height: mediaQueryUtil.height(0.08),
              child: TextField(
                controller: _minController,
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                textAlignVertical: TextAlignVertical.top,
                onSubmitted: (text) {
                  int parsed = int.tryParse(text) ?? 0;
                  filterProvider.setMinDuration(parsed);
                },
              ),
            ),
            if (filterProvider.minDuration != 0)
              IconButton(
                onPressed: () {
                  filterProvider.setMinDuration(0);
                },
                icon: const Icon(Icons.remove_circle_outline_outlined),
              ),
          ],
        ),
      ],
    );
  }

  _buildStartDateRow(FilterProvider filterProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start date',
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                if (newDate == null) {
                  // cancel pressed
                  return;
                }
                filterProvider.setStartDate(newDate);
              },
              child: Text(filterProvider.startDate != null ? filterProvider.startDate!.toString() : '-'),
            ),
            if (filterProvider.startDate != null)
              IconButton(
                onPressed: () {
                  filterProvider.setStartDate(null);
                },
                icon: const Icon(Icons.remove_circle_outline_outlined),
              ),
          ],
        ),
      ],
    );
  }

  _buildEndDateRow(FilterProvider filterProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'End date',
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                if (newDate == null) {
                  // cancel pressed
                  return;
                }
                filterProvider.setEndDate(newDate);
              },
              child: Text(filterProvider.endDate != null ? filterProvider.endDate!.toString() : '-'),
            ),
            if (filterProvider.endDate != null)
              IconButton(
                onPressed: () {
                  filterProvider.setEndDate(null);
                },
                icon: const Icon(Icons.remove_circle_outline_outlined),
              ),
          ],
        ),
      ],
    );
  }

//showWarning() https://www.youtube.com/watch?v=vEmJLvL1pzQ
}
