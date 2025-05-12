import 'package:flutter/material.dart';

class NormalButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Color buttonColor;
  final Color shadowColor;
  final VoidCallback onPress;
  const NormalButtonWidget({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.buttonColor = Colors.white,
    this.shadowColor = Colors.grey,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(2, 4),
                ),
              ],
            ),

            child: Center(
              child: Text(title, style: TextStyle(color: color, fontSize: 30)),
            ),
          ),
        ),
      ),
    );
  }
}
