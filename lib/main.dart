import 'package:flutter/material.dart';
import 'package:scholar_chat/screens/Login.dart';
import 'package:scholar_chat/screens/Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholar_chat/screens/chats_page.dart';
import 'package:scholar_chat/screens/main_chat.dart';
import 'components/main_chat_container.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home_view.id:(context)=>  Home_view(),
        register_view.id:(context)=> register_view(),
        chats.id:(context)=> chats(),
        main_chat.id:(context)=> main_chat(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute:   Home_view.id,
    );
  }
}

