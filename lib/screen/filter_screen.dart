import 'package:call_history/provider/FilterProvider.dart';
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
    final AppBar appBar = AppBar();

    final mediaQuery = MediaQuery.of(context);
    var statusBarHeight = mediaQuery.viewPadding.top;
    final maxContentHeight = mediaQuery.size.height - appBar.preferredSize.height - statusBarHeight;
    final maxContentWidth = mediaQuery.size.width;

    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = true;
        //TODO shouldPop = await showWarning(context); https://www.youtube.com/watch?v=vEmJLvL1pzQ
        return shouldPop;
      },
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: EdgeInsets.only(left: maxContentWidth * 0.03, right: maxContentWidth * 0.03, top: maxContentHeight * 0.02, bottom: maxContentHeight * 0.02),
          child: Consumer<FilterProvider>(
            builder: (context, filterProvider, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMinDuration(filterProvider),
                SizedBox(
                  height: maxContentHeight * 0.03,
                ),
                _buildStartDateRow(filterProvider),
                SizedBox(
                  height: maxContentHeight * 0.03,
                ),
                _buildEndDateRow(filterProvider),
                SizedBox(
                  height: maxContentHeight * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMinDuration(FilterProvider filterProvider) {
    _minController.text = filterProvider.minDuration.toString();
    _minController.selection = TextSelection.fromPosition(TextPosition(offset: _minController.text.length));
    return TextField(
      controller: _minController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Min duration',
      ),
      keyboardType: TextInputType.number,
      onSubmitted: (text) {
        int parsed = int.tryParse(text) ?? 0;
        filterProvider.setMinDuration(parsed);
      },
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
