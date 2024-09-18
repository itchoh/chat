import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/components/functions.dart';
import 'package:scholar_chat/components/Customcontainer.dart';
import 'package:scholar_chat/screens/Register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/screens/chats_page.dart';

class Home_view extends StatefulWidget {
  Home_view({Key? key}) : super(key: key);
  static String id = 'Login';

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  bool emailbool = false;
  bool passwordbool = false;
  bool indecator = false;
  late String tmail;
  late String tassword;
  double hie = 150;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: indecator,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/comic-empty-speech-bubble-retro-pop-art-style-with-shadow-yellow-background.jpg'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: hie),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Chat',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Custom_TextField(
                    obsecure_bool: false,
                    controller: emailController, // Assign the controller
                    validator: (email) {
                      if (email.isEmpty) {
                        return 'Enter your Email';
                      }
                      return null;
                    },
                    onchanged: (data) {
                      // You can also track this if needed
                    },
                    hint: 'Email',
                    bol2: false,
                    bolcolor: emailbool,
                  ),
                  if (emailbool)
                    Text(
                      tmail,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                  Custom_TextField(
                    controller: passwordController, // Assign the controller
                    validator: (password) {
                      if (password.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    onchanged: (data) {
                      // You can also track this if needed
                    },
                    hint: 'Password',
                    obsecure_bool: true,
                    bol2: true,
                    bolcolor: passwordbool,
                  ),
                  if (passwordbool)
                    Text(
                      tassword,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 30),
                  CustomContainer(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          indecator = true;
                        });
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('success'),
                            ),
                          );
                          setState(() {
                            emailbool = false;
                            passwordbool = false;
                          });
                          Navigator.pushNamed(context, chats.id,
                              arguments: emailController.text);

                          // Clear the text fields
                          emailController.clear();
                          passwordController.clear();

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-email') {
                            setState(() {
                              tmail = 'The email address is not valid.';
                              emailbool = true;
                            });
                          } else if (e.code == 'user-disabled') {
                            setState(() {
                              tmail = 'The user has been disabled.';
                              emailbool = true;
                            });
                          } else if (e.code == 'user-not-found') {
                            setState(() {
                              tmail = 'No user found for that email.';
                              emailbool = true;
                            });
                          } else if (e.code.contains('invalid-credential')) {
                            setState(() {
                              tassword = 'Wrong password provided.';
                              passwordbool = true;
                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            indecator = false;
                          });
                        });
                      }
                    },
                    name: 'Login',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You Don't Have Account!",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, register_view.id);
                          setState(() {
                            emailbool = false;
                            passwordbool = false;
                          });

                          // Clear the text fields when navigating to register
                          emailController.clear();
                          passwordController.clear();
                        },
                        child: const Text(
                          '  Register',
                          style: TextStyle(color: Colors.redAccent, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
