import 'package:flutter/material.dart';

class TotalCounts extends StatelessWidget {
  TotalCounts(double _total);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _total;
    return Row(children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 20.0),
        child: Text(
          'Total is.',
          style: TextStyle(
            height: 2.0,
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 50, right: 10.0),
        margin: EdgeInsets.only(right: 10.0),
        alignment: Alignment.centerRight,
        width: 250.0,
        child: Text(
          '$_total',
          style: TextStyle(
            height: 2.0,
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}
