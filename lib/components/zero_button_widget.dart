import 'package:flutter/material.dart';

class ZeroButtonWidget extends StatelessWidget {
  final String title;
  final Color buttonTextColor;
  final Color buttonColor;
  final Color shade1;
  final Color shade2;
  final VoidCallback onPress;
  const ZeroButtonWidget({
    super.key,
    required this.title,
    this.buttonTextColor = Colors.black,
    this.buttonColor = Colors.white,
    this.shade1 = Colors.grey,
    this.shade2 = Colors.grey,
    required this.onPress,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Stack(
            children: [
              // Bottom shadow (creates depth)
              Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  color: shade1,
                ),
              ),
              // Slightly offset top layer (creates impression of being pressed in)
              Positioned(
                top: 2, // This offset creates the "pressed in" effect
                left: 0,
                right: 0,
                child: Container(
                  height: 73,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.5),
                    color: buttonColor,
                    border: Border.all(
                      color: shade2,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                        title,
                        style: TextStyle(
                            color: buttonTextColor,
                            fontSize: 30
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
