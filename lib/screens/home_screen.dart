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
      buttonShadowColor = Colors.grey.withOpacity(0.5);
      zeroBorderShade = Colors.grey.shade400;
      zeroButtonShade = Colors.grey.shade300;
    }
  }

  String calculate(String expr) {
      // Step 1: Tokenize
      List tokens = [];
      String num = '';
      expr = expr.replaceAll("÷", "/");
      expr = expr.replaceAll("×", "*");
      for (int i = 0; i < expr.length; i++) {
        String ch = expr[i];
        if (RegExp(r'[0-9.]').hasMatch(ch)) {
          num += ch;
        } else if ('+-'.contains(ch) && (i == 0 || '+-*/%'.contains(expr[i - 1]))) {
          // Unary + or -
          num += ch;
        } else if ('+-*/%'.contains(ch)) {
          if (num.isNotEmpty) {
            tokens.add(double.parse(num));
            num = '';
          }
          tokens.add(ch);
        }
      }
      if (num.isNotEmpty) {
        tokens.add(double.parse(num));
      }

      // Step 2: *,/,%
      int i = 0;
      while (i < tokens.length) {
        if (tokens[i] == '/') {
          double result = tokens[i - 1] / tokens[i + 1];
          tokens.replaceRange(i - 1, i + 2, [result]);
          i -= 1;
        } else if (tokens[i] == '*') {
          double result = tokens[i - 1] * tokens[i + 1];
          tokens.replaceRange(i - 1, i + 2, [result]);
          i -= 1;
        } else if (tokens[i] == '%') {
          double result = tokens[i - 1] % tokens[i + 1];
          tokens.replaceRange(i - 1, i + 2, [result]);
          i -= 1;
        }else {
          i += 1;
        }
      }

      // Step 3: + and -
      i = 0;
      while (i < tokens.length) {
        if (tokens[i] == '+') {
          double result = tokens[i - 1] + tokens[i + 1];
          tokens.replaceRange(i - 1, i + 2, [result]);
          i -= 1;
        } else if (tokens[i] == '-') {
          double result = tokens[i - 1] - tokens[i + 1];
          tokens.replaceRange(i - 1, i + 2, [result]);
          i -= 1;
        } else {
          i += 1;
        }
      }

      return tokens[0].toStringAsFixed(2);

  }

  String logic(String expr) {
    // Step 1: Find where the last number starts
    int i = expr.length - 1;
    while (i >= 0 && isDigit(expr[i])) {
      i--;
    }
    int lastNumStart = i + 1;
    // Step 2: Check if character just before last number is '+' or '-'
    if (lastNumStart > 0 && (expr[lastNumStart - 1] == '+' || expr[lastNumStart - 1] == '-')) {
      int opIndex = lastNumStart - 1;
      if (expr[opIndex] == '+') {
        return '${expr.substring(0, opIndex)}-${expr.substring(opIndex + 1)}';
      } else if (expr[opIndex] == '-') {
        if (opIndex > 0 && isDigit(expr[opIndex - 1])) {
          return '${expr.substring(0, opIndex)}+${expr.substring(opIndex + 1)}';
        } else {
          return expr.substring(0, opIndex) + expr.substring(opIndex + 1);
        }
      }
    } else {
      // No '+' or '-' before last number → insert '-' before it
      return '${expr.substring(0, lastNumStart)}-${expr.substring(lastNumStart)}';
    }
    return expr;
  }

// Helper function to check if a character is a digit
  bool isDigit(String ch) {
    return ch.codeUnitAt(0) >= '0'.codeUnitAt(0) && ch.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }

  bool isOperator(String ch) {
    return ['+', '-', '×', '÷', '%','.'].contains(ch);
  }

  void addOperator(String operator) {
    if (userInput.isEmpty) {
      if (operator == '-') {
        userInput += '-';
        setState(() {});
      }
      // ignore other operators at start
    } else if (!isOperator(userInput[userInput.length - 1])) {
      userInput += operator;
      setState(() {});
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
                          onPress: () {
                            String output = logic(userInput);
                            userInput = output;
                            setState(() {});
                          },
                          color: Colors.grey,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "%",
                          onPress: () => addOperator("%"),
                          color: Colors.grey,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "÷",
                          onPress: () => addOperator("÷"),
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
                          onPress: () => addOperator('×'),
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
                          onPress: () => addOperator('-'),
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
                          onPress: () => addOperator('+'),
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
                          onPress: () => addOperator('.'),
                          color: buttonTextColor,
                          buttonColor: buttonColor,
                          shadowColor: buttonShadowColor,
                        ),
                        NormalButtonWidget(
                          title: "=",
                          onPress: () {
                            String answer = calculate(userInput);
                            if (answer.toLowerCase() == 'infinity'){
                              userInput = "0";
                            }else{
                            userInput = answer;
                            setState(() {});}
                          },
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
