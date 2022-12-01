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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("back button pressed");
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
          child:
            ListView(
              children: [
                _buildMin(),
                ElevatedButton(
                  onPressed: () {
                  print("onpressed");
                    String minDuration = _minController.value.text ?? '0';
                    if(minDuration.isEmpty) {
        minDuration = "0";
        }
            context.read<FilterProvider>().setMinDuration(minDuration != null ? int.parse(minDuration) : 0);
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          
        ),
      ),
    );
  }

  _buildMin() {
    return TextField(
      controller: _minController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Min duration',
      ),
      keyboardType: TextInputType.number,

    );
  }

  _onPressed(BuildContext context) {

  }

  //showWarning() https://www.youtube.com/watch?v=vEmJLvL1pzQ
}
