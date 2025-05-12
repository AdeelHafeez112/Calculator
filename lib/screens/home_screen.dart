import 'package:flutter/material.dart';
import 'package:practice_app/components/answer_widget.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                  IconButton(icon: Icon(Icons.dark_mode, color: Colors.black, size: 20),
                  onPressed: (){}, ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      AnswerWidget(answer: userInput,),
                      const SizedBox(height:75),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "AC",
                          onPress: () {userInput ='';answer ='';setState(() {});},
                          color: Colors.grey,
                        ),
                        NormalButtonWidget(
                          title: "+/-",
                          onPress: () {userInput += '+/-'; setState(() {});},
                          color: Colors.grey,
                        ),
                        NormalButtonWidget(
                          title: "%",
                          onPress: () {userInput += '%'; setState(() {});},
                          color: Colors.grey,
                        ),
                        NormalButtonWidget(
                          title: "÷",
                          onPress: () {userInput += '÷'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "7",
                          onPress: () {userInput += '7'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "8",
                          onPress: () {userInput += '8'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "9",
                          onPress: () {userInput += '9'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "×",
                          onPress: () {userInput += '×'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "4",
                          onPress: () {userInput += '4'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "5",
                          onPress: () {userInput += '5'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "6",
                          onPress: () {userInput += '6'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "-",
                          onPress: () {userInput += '-'; setState(() {});},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "1",
                          onPress: () {userInput += '1'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "2",
                          onPress: () {userInput += '2'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
                          title: "3",
                          onPress: () {userInput += '3'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
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
                          buttonTextColor: Colors.black,),
                        NormalButtonWidget(
                          title: ".",
                          onPress: () {userInput += '.'; setState(() {});},
                          color: Colors.black,
                        ),
                        NormalButtonWidget(
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