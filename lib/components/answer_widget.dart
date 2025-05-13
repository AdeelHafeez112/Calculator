import 'package:flutter/material.dart';


class AnswerWidget extends StatefulWidget {
  final Color color;
  final dynamic answer;
  const AnswerWidget({super.key,this.color = Colors.black,required this.answer});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(widget.answer.toString(),style: TextStyle(color: widget.color,fontSize: 80),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}