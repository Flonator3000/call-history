import 'dart:ffi';

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
  final _startDateDayController = TextEditingController();
  final _startDateMonthController = TextEditingController();
  final _startDateYearController = TextEditingController();
  final _endDateDayController = TextEditingController();
  final _endDateMonthController = TextEditingController();
  final _endDateYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = true;
        //TODO shouldPop = await showWarning(context); https://www.youtube.com/watch?v=vEmJLvL1pzQ

        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildMinDuration(),
              SizedBox(
                height: 10,
              ),
              _buildStartDate(),
              SizedBox(
                height: 10,
              ),
              _buildEndDate(),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print("onpressed");
                  String minDuration = _minController.value.text ?? '0';
                  if (minDuration.isEmpty) {
                    minDuration = "0";
                  }
                  context.read<FilterProvider>().setMinDuration(
                      minDuration != null ? int.parse(minDuration) : 0);
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMinDuration() {
    return TextField(
      controller: _minController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Min duration',
      ),
      keyboardType: TextInputType.number,
    );
  }

  _buildStartDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'start date',
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _startDateDayController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "DD",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 2,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextField(
                controller: _startDateMonthController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "MM",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 2,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextField(
                controller: _startDateYearController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "YYYY",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildEndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'end date',
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _endDateDayController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "DD",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 2,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextField(
                controller: _endDateMonthController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "MM",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 2,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextField(
                controller: _endDateYearController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "YYYY",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
            ),
          ],
        ),
      ],
    );
  }

//showWarning() https://www.youtube.com/watch?v=vEmJLvL1pzQ
}
