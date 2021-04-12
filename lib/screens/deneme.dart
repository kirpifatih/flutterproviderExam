import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    int _activeMeterIndex;
    return Container(
      child: Container(
        child: new ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int i) {
              return Card(
                margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                child: new ExpansionPanelList(
                  expansionCallback: (int index, bool status) {
                    setState(() {
                      _activeMeterIndex = _activeMeterIndex == 1 ? null : i;
                    });
                  },
                  children: [
                    new ExpansionPanel(
                      isExpanded: _activeMeterIndex == 1,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          new Container(
                              padding: const EdgeInsets.only(left: 15.0),
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                'list-$i',
                              )),
                      body: new Container(
                        child: new Text('content-$i'),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
