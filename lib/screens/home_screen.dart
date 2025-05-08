import 'package:flutter/material.dart';
import 'package:practice_app/components/normal_button_widget.dart';
import 'package:practice_app/components/zero_button_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 100),
                      Container(
                        alignment: Alignment.centerRight,
                        child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(userInput.toString(), style: TextStyle(fontSize: 90, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      const SizedBox(height:20),
                      Container(
                        alignment: Alignment.centerRight,
                        child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(userInput.toString(), style: TextStyle(fontSize: 45, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: () {userInput ='';answer ='';setState(() {});},
                          color: Colors.grey,
                        ),
                        MyButton(
                          title: "+/-",
                          onPress: () {userInput += '+/-'; setState(() {});},
                          color: Colors.grey,
                        ),
                        MyButton(
                          title: "%",
                          onPress: () {userInput += '%'; setState(() {});},
                          color: Colors.grey,
                        ),
                        MyButton(
                          title: "÷",
                          onPress: () {userInput += '÷'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {userInput += '7'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "8",
                          onPress: () {userInput += '8'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "9",
                          onPress: () {userInput += '9'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "×",
                          onPress: () {userInput += '×'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: () {userInput += '4'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "5",
                          onPress: () {userInput += '5'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "6",
                          onPress: () {userInput += '6'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "-",
                          onPress: () {userInput += '-'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: () {userInput += '1'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "2",
                          onPress: () {userInput += '2'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "3",
                          onPress: () {userInput += '3'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "+",
                          onPress: () {userInput += '+'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ZeroButtonWidget(
                          title: "0",
                          onPress: () {userInput += '0'; setState(() {});},
                          color: Colors.black,),
                        MyButton(
                          title: ".",
                          onPress: () {userInput += '.'; setState(() {});},
                          color: Colors.black,
                        ),
                        MyButton(
                          title: "=",
                          onPress: () {},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//