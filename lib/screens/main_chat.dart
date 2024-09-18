import 'package:flutter/material.dart';
import 'package:scholar_chat/components/model.dart';
import '../components/main_chat_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/reciver_container.dart';
class main_chat extends StatefulWidget {
  const main_chat({Key? key}) : super(key: key);
  static String id = 'main chat';
  @override
  State<main_chat> createState() => _main_chatState();
}

class _main_chatState extends State<main_chat> {
  TextEditingController _controller = TextEditingController();
  bool bools = false;
  late String message;

  void _clearTextField() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _controller.clear();
        bools = false;
      });
    });
  }
  final controll=ScrollController();

  @override
  Widget build(BuildContext context) {
    List<String> email= ModalRoute.of(context)!.settings.arguments as List<String>;

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    CollectionReference user1 = users.doc(users.id).collection(email[0]) as CollectionReference<Object?>;
    CollectionReference reciver1 = user1.doc(user1.id).collection(email[1]) as CollectionReference<Object?>;
    CollectionReference user2 = users.doc(users.id).collection(email[1]) as CollectionReference<Object?>;
    CollectionReference reciver2 = user2.doc(user2.id).collection(email[0]) as CollectionReference<Object?>;

    return StreamBuilder<QuerySnapshot>(
      stream: reciver1.orderBy('date',descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messages = [];
          for(int i=0;i<snapshot.data!.docs.length;i++)
          {
            messages.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff93D5DE),
              title:  Text(email[1]),
              centerTitle: true,
              elevation: 0,
              
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pop-art-style-speech-bubbles-yellow-backdrop.jpg'),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: controll,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return messages[index].email==email[0]?custom_main_chat_container(message: messages[index]):cont(message: messages[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (data) {
                          message = data;
                        },
                        controller: _controller,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (message.isNotEmpty) {
                                // Send the message to Firestore
                                reciver1.add({
                                  'date': DateTime.now().toString(), // Example date format
                                  'message': message,
                                  'sender_message':email[0],
                                });
                                reciver2.add({
                                  'date': DateTime.now().toString(), // Example date format
                                  'message': message,
                                  'sender_message':email[0],
                                });
                                // Clear the text field
                                _clearTextField();
                                message='';
                                controll.animateTo(
                                  0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                );

                              }
                            },
                            icon: const Icon(Icons.send_rounded),
                          ),
                          hintText: 'Enter your message...',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
