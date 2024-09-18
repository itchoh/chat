import 'package:flutter/material.dart';
import 'package:scholar_chat/components/model.dart';

class custom_main_chat_container extends StatefulWidget {
   custom_main_chat_container({Key? key,required this.message}) : super(key: key);
  Message message;
  @override
  State<custom_main_chat_container> createState() =>
      _custom_main_chat_containerState();
}

class _custom_main_chat_containerState
    extends State<custom_main_chat_container> {


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width:0.3),
          color: Color(0xff93D5DE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.message.message,style: TextStyle(fontSize: 15),),
            Text(widget.message.date.substring(11,16),style: TextStyle(fontSize: 10,color: Colors.white),),

          ],
        ),
      ),
    );
  }
}





