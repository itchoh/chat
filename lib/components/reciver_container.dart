import 'package:flutter/material.dart';
import 'model.dart';
class cont extends StatefulWidget {
  const cont({Key? key, required this.message}) : super(key: key);

  final Message message;
  @override
  State<cont> createState() => _contState();
}
class _contState extends State<cont> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width:0.3),
          color: Color(0xffFFDF88),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.message.message,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              widget.message.date.substring(11, 16),
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
