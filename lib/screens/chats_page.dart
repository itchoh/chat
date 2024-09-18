import 'package:flutter/material.dart';
import 'package:scholar_chat/components/constants.dart';

import '../components/chat_container.dart';
import 'main_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class chats extends StatefulWidget {
  static String id = 'chats';
  @override
  State<chats> createState() => _chatsState();
}


class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
   String email= ModalRoute.of(context)!.settings.arguments as String;
   List<String>chat=[email];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4E19F),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.exit_to_app),),
        title: const Text('chat app'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/blank-speech-bubble-blue-background.jpg'),
          ),
        ),
        child: Stack(
            children: [
          ListView.builder(
            itemCount: users_email.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  chat.add(users_email[index]);
                  Navigator.pushNamed(context, main_chat.id,arguments:chat);

                },
                child: chats_container(email:users_email[index]!=email?users_email[index]:'',date: '09:18',),
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xffF4E19F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 15,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
