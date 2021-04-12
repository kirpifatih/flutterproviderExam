import 'package:flutter/material.dart';
import 'package:provi_exam/screens/weight_page.dart';
import 'package:provi_exam/screens/deneme.dart';
import 'package:provi_exam/state/weight_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return // MultiProvider(
        MaterialApp(
      title: 'Provider Demo',
      home: Deneme(),
      //WeightPage(),
    );
    // providers: <SingleChildCloneableWidget>[
    // ChangeNotifierProvider(builder: (context) => WeightState())
    //],
    //);
  }
}
