
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  int minDuration = 0;

  setMinDuration(int minDuration) {
    this.minDuration = minDuration;
    print("filterprovider " + minDuration.toString());
    notifyListeners();
  }
}