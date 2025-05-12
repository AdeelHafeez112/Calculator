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
  bool isDarkMode = false;

  //Theme Color
  late Color backgroundColor;
  late Color textColor;
  late Color buttonTextColor;
  late Color buttonColor;
  late Color buttonShadowColor;
  late Color zeroBorderShade;
  late Color zeroButtonShade;

  void _updateThemeColor(){
    if (isDarkMode){
      backgroundColor = Colors.black;
      textColor = Colors.white;
      buttonTextColor = Colors.white;
      buttonColor = Colors.black;
      buttonShadowColor = Colors.grey.shade900;
      zeroBorderShade = Colors.grey.shade800;
      zeroButtonShade = Colors.grey.shade900;
    }
    else{
      backgroundColor = Colors.white;
      textColor = Colors.black;
      buttonTextColor = Colors.black;
      buttonColor = Colors.white;
      buttonShadowColor = Colors.grey.withOpacity(0.3);
      zeroBorderShade = Colors.grey.shade400;
      zeroButtonShade = Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateThemeColor();
    return Scaffold(
      backgroundColor: backgroundColor,
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
                          IconButton(icon: Icon(
                              isDarkMode ? Icons.light_mode  : Icons.dark_mode,
                              color: textColor,
                              size: 30),
                            onPressed: (){
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            }, ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      AnswerWidget(answer: userInput,color: textColor,),
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
                          onPress: () {userInput ='';setState(() {});},
                          color: Colors.grey,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "+/-",
                          onPress: () {userInput += '+/-'; setState(() {});},
                          color: Colors.grey,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "%",
                          onPress: () {userInput += '%'; setState(() {});},
                          color: Colors.grey,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "÷",
                          onPress: () {userInput += '÷'; setState(() {});},
                          color: Colors.orange,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "7",
                          onPress: () {userInput += '7'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "8",
                          onPress: () {userInput += '8'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "9",
                          onPress: () {userInput += '9'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "×",
                          onPress: () {userInput += '×'; setState(() {});},
                          color: Colors.orange,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "4",
                          onPress: () {userInput += '4'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "5",
                          onPress: () {userInput += '5'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "6",
                          onPress: () {userInput += '6'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "-",
                          onPress: () {userInput += '-'; setState(() {});},
                          color: Colors.orange,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NormalButtonWidget(
                          title: "1",
                          onPress: () {userInput += '1'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "2",
                          onPress: () {userInput += '2'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "3",
                          onPress: () {userInput += '3'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "+",
                          onPress: () {userInput += '+'; setState(() {});},
                          color: Colors.orange,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ZeroButtonWidget(
                          title: "0",
                          onPress: () {userInput += '0'; setState(() {});},
                          buttonTextColor: buttonTextColor,
                          buttonColor: buttonColor,
                          shade1: zeroBorderShade,
                          shade2: zeroButtonShade,
                        ),
                        NormalButtonWidget(
                          title: ".",
                          onPress: () {userInput += '.'; setState(() {});},
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "=",
                          onPress: () {},
                          color: Colors.orange,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
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