import 'package:flutter/material.dart';
class chats_container extends StatefulWidget {
  const chats_container({Key? key,required this.email,required this.date}) : super(key: key);
  final String email;
  final String date;
  @override
  State<chats_container> createState() => _chats_containerState();
}

class _chats_containerState extends State<chats_container> {
  @override
  Widget build(BuildContext context) {
    return widget.email==''?Container(height: 0,width: 0,): Container(
      height: 70,
      width: double.infinity,

      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/download.jpeg'),
            ),
            height: 60,width: 70,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Text(widget.email,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
          ),

        ],
      ),
    );
  }
}
