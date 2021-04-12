import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provi_exam/models/weight.dart';
import 'package:provider/provider.dart';
import 'package:provi_exam/state/weight_state.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight tracker Demo"),
      ),
      drawer: Drawer(),
      body: Consumer<WeightState>(builder: (context, state, widget) {
        var weights = state.weights;
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Current Weight",
                          textScaleFactor: 1.2,
                        ),
                        Text(
                          weights.first.value.toString(),
                          textScaleFactor: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var weight = weights[index];
                    return ListTile(
                      title: Text(
                          "${weight.time.day}/${weight.time.month}/${weight.time.year} "),
                      trailing: Text(
                        weight.value.toString(),
                        textScaleFactor: 2,
                      ),
                    );
                  },
                  itemCount: state.weights.length,
                ),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var state = Provider.of<WeightState>(context, listen: false);
          var result = await showDialog<double>(
              context: context,
              builder: (context) => NumberPickerDialog.decimal(
                    minValue: 1,
                    maxValue: 200,
                    initialDoubleValue: state.weights.first.value,
                  ));
          if (result != null && result > 0) {
            state.add(
              Weight(
                value: result,
                time: DateTime.now(),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
