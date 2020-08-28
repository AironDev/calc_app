import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Dart:ui';
import 'dart:math';

void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
            backgroundColor: Colors.redAccent,
              title: Text("Calculator", style: TextStyle(), textAlign: TextAlign.center,),
            ),
            body: MainScreen(),
        )
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
    String input = "";
    dynamic output = "";


    Expanded calcButton (value, method){
    return Expanded(
       // padding: EdgeInsets.all(5.0),
        child: MaterialButton(
            elevation: 3.0,
            child: Text("$value"),
            color: Colors.white,
            onPressed: (){
               if(method == "ans"){
                    Parser p= Parser();
                    Expression exp = p.parse("$input");
                    double result = exp.evaluate(EvaluationType.REAL, ContextModel());
                    setState(() {
                        output =  result;
                    });
                    print('$output');
               }else if(method == "clear"){
                   setState(() {
                        input = "";
                        output = "";

                    });
               }else{
                   setState(() {
                        input = input + "$value";
                    });
               }

            },
            ),
        );
    }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            children: <Widget>[
                Container(
                    child: TextField(
                        readOnly: true,
                        controller: TextEditingController(text: "$input"),
                        keyboardType: TextInputType.number,
                        minLines: 2,
                        maxLines: 5,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                        ),
                    ),
                ),
                Container(
                    child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.end,
                        controller: TextEditingController(text: "$output"),
                        keyboardType: TextInputType.text,
                        minLines: 2,
                        maxLines: 5,
                        decoration: InputDecoration(

                        ),
                    ),
                ),
                Container(
                    child: SizedBox(height: 10.0),
                ),
                Container(
                    child: Row(
                        children: <Widget>[
                          calcButton("Clear", "clear"),
                          calcButton("/", "div"),
                          calcButton("*", "mul"),
                          calcButton("Del", "del"),
                        ],
                    )
                ),
                Container(
                    child: Row(
                        children: <Widget>[
                          calcButton(7, "seven"),
                          calcButton(8, "eight"),
                          calcButton(9, "nine"),
                          calcButton("+", "add"),
                        ],
                    )
                ),
                Container(
                    child: Row(
                        children: <Widget>[
                          calcButton(4, "four"),
                          calcButton(5, "five"),
                          calcButton(6, "six"),
                          calcButton("-", "sub"),
                        ],
                    )
                ),
                Container(
                    child: Row(
                        children: <Widget>[
                          calcButton(1, "one"),
                          calcButton(2, "two"),
                          calcButton(3, "three"),
                          calcButton("%", "mod"),
                        ],
                    )
                ),
                Container(
                    child: Row(
                        children: <Widget>[
                          calcButton(0, "zero"),
                          calcButton(".", "dot"),
                          calcButton("Ans", "ans"),
                        ],
                    )
                ),
            ]
        )
    );
}
}
