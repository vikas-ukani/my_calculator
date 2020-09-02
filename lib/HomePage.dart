// Import necessary packages
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; // tital attribute

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String total = "0";
  String _total = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  List opertatorsList = ["+", "-", "*", "/"];

  numberFunctions(String number) {
    if (number == "C") {
      number = "";
      total = "0";
      _total = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }

    /** set operand if found in list */
    if (opertatorsList.contains(number)) {
      num1 = double.parse(total);
      operand = number;
      _total = "0";
    } else if (number == ".") {
      // check already dot
      if (_total.contains(".")) {
        print("Dot found again");
        return;
      } else {
        _total = _total + number;
      }
    } else if (number == "=") {
      num2 = double.parse(total); // final result

      if (operand == "+") {
        _total = (num1 + num2).toString(); // for addition
      }

      if (operand == "-") {
        _total = (num1 - num2).toString(); // substraction
      }

      if (operand == "*") {
        _total = (num1 * num2).toString(); // multiplications
      }

      if (operand == "/") {
        _total = (num1 / num2).toString(); // devision
      }

      num1 = 0.0; // first input 
      num2 = 0.0; // second input
//      _total = "0";
      operand = ""; // default set to zero 
    } else {
      _total = _total + number;
    }

    setState(() {
      total = double.parse(_total).toStringAsFixed(1);
//      total = _total + number;
    });
  }

  Widget _button(String number) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
      child: MaterialButton(
        height: 75.0,
        textTheme: ButtonTextTheme.primary,
        highlightElevation: 1,

//        shape: StadiumBorder(),
        shape: BeveledRectangleBorder(),
//        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(1.0),
        padding: EdgeInsets.all(10.0),
        child: Text(
          number,
          style: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic),
        ),
        onPressed: () {
          numberFunctions(number);
        }, //function
      ),
    );
  }

  Widget _sideButtons(
      String icon, Object color, Object splashColor, double size) {
    return Container(
      margin: EdgeInsets.only(top: 33.0),
      child: IconButton(
        splashColor: splashColor,
        alignment: Alignment.center,
        icon: Text(
          "$icon",
          style: TextStyle(
              color: color, fontSize: size, fontWeight: FontWeight.w800),
        ),
        color: color,
        tooltip: 'Clear',
        iconSize: size,
        onPressed: () => numberFunctions(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      backgroundColor: Colors.black38,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Flexible(
                    flex: 1,
                    child: Text(operand,
                      style: TextStyle(
                          color: Color(
                              (math.Random().nextDouble() * 0xFFFFFF).toInt() <<
                                  0)
                              .withOpacity(1),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                   ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 150.0,
                      color: Colors.black,
                      child: Text(
                        "$total",
                        style: TextStyle(
                            color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt() <<
                                    0)
                                .withOpacity(1),
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("7"),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("8"),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("9"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: _button("4"),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("5"),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: _button("6"),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: _button("1"),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("2"),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: _button("3"),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: _button("0"),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: _button("."),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: _button("="),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: _sideButtons(
                                  "C", Colors.white, Colors.indigo, 40.0),
//                              child: _clearButton(Icon(Icons.backspace),
//                                  Colors.blue, 450.),
                            ),
                            Flexible(
                              flex: 1,
                              child: _sideButtons(
                                  "/", Colors.blueAccent, Colors.amber, 30.0),
                            ),
                            Flexible(
                              flex: 1,
                              child: _sideButtons(
                                  "*", Colors.blueAccent, Colors.amber, 30.0),
                            ),
                            Flexible(
                              flex: 1,
                              child: _sideButtons(
                                  "-", Colors.blueAccent, Colors.amber, 30.0),
                            ),
                            Flexible(
                              flex: 1,
                              child: _sideButtons(
                                  "+", Colors.blueAccent, Colors.amber, 30.0),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
