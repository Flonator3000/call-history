import 'package:call_history/provider/FilterProvider.dart';
import 'package:call_history/util/date_utils.dart';
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
  final _startDateDayController = TextEditingController();
  final _startDateMonthController = TextEditingController();
  final _startDateYearController = TextEditingController();
  final _endDateDayController = TextEditingController();
  final _endDateMonthController = TextEditingController();
  final _endDateYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar();

    final mediaQuery = MediaQuery.of(context);
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
                  _buildStartDate(filterProvider),
                  SizedBox(
                    height: maxContentHeight * 0.03,
                  ),
                  _buildEndDate(filterProvider),
                  SizedBox(
                    height: maxContentHeight * 0.03,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     FilterProvider filterProvider =
                  //         context.read<FilterProvider>();
                  //
                  //     String minDuration = _minController.value.text ?? '0';
                  //     if (minDuration.isEmpty) {
                  //       minDuration = "0";
                  //     }
                  //     filterProvider.setMinDuration(
                  //         minDuration != null ? int.parse(minDuration) : 0);
                  //
                  //     if (_startDateDayController.text.isNotEmpty) {
                  //       DateTime startDate = DateUtil.fromStringInputs(
                  //           _startDateDayController.text,
                  //           _startDateMonthController.text,
                  //           _startDateYearController.text);
                  //       filterProvider.setStartDate(startDate);
                  //     }
                  //
                  //     if (_endDateDayController.text.isNotEmpty) {
                  //       DateTime endDate = DateUtil.fromStringInputs(
                  //           _endDateDayController.text,
                  //           _endDateMonthController.text,
                  //           _endDateYearController.text);
                  //       filterProvider.setEndDate(endDate);
                  //     }
                  //   },
                  //   child: Text("Submit"),
                  // ),
                ],
              ),

          ),
        ),
      ),
    );
  }

  _buildMinDuration(FilterProvider filterProvider) {
    _minController.text = filterProvider.minDuration != null ? filterProvider.minDuration.toString() : '';
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

  _buildStartDate(FilterProvider filterProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'start date',
          style: TextStyle(color: Colors.black),
        ),
        ElevatedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if(newDate == null) return; // cancel pressed
              filterProvider.setStartDate(newDate);
            },
            child: Text(filterProvider.startDate != null ? filterProvider.startDate!.toString() : '-'))
      ],
    );
  }

  _buildEndDate(FilterProvider filterProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'end date',
          style: TextStyle(color: Colors.black),
        ),
        ElevatedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if(newDate == null) return; // cancel pressed
              filterProvider.setEndDate(newDate);
            },
            child: Text(filterProvider.endDate != null ? filterProvider.endDate!.toString() : '-'))
      ],
    );
  }


//showWarning() https://www.youtube.com/watch?v=vEmJLvL1pzQ
}
