import 'package:flutter/material.dart';
import 'package:provi_exam/models/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(value: 64, time: DateTime.utc(2019, 10, 4)),
    Weight(value: 74, time: DateTime.utc(2020, 05, 3)),
    Weight(value: 84, time: DateTime.utc(2018, 02, 4))
  ];
  List<Weight> get weights => _weights;

  add(Weight weight) {
    _weights.insert(0, weight);
    notifyListeners();
  }
}
