import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/components/constants.dart';
import 'package:scholar_chat/components/functions.dart';
import 'package:scholar_chat/components/Customcontainer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class register_view extends StatefulWidget {
  register_view({
    Key? key,
  }) : super(key: key);
  static String id = 'Register';
  String? email;
  String? password;

  @override
  State<register_view> createState() => _register_viewState();
}

class _register_viewState extends State<register_view> {
  bool bools = false;
   bool emailbool= false;
  late String tmail;
  late String tassword;
  late bool passwordbool= false ;
   bool indecator = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: indecator,
      child: Scaffold(
        backgroundColor: const Color(colors),
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
                //physics: ,
                children: [
                  const SizedBox(
                    height: 150,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'Chat',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Custom_TextField(
                    validator: (email)  {
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(pattern);

                      if (email.isEmpty) {
                        return 'Email is required';
                      } else if (!regex.hasMatch(email)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    onchanged: (data) {
                      widget.email = data;
                    },
                    hint: 'Email',
                    bol2: false,
                    bolcolor: emailbool,
                  ),
                  Container(
                    child: emailbool == true
                        ? Text(
                      tmail,
                      style: const TextStyle(color: Color(0xffB5251D),fontSize: 12),
                    )
                        : Container(
                      height: 0,
                      width: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Custom_TextField(
                    validator: (password) {
                      if (password.isEmpty) {
                        return 'please Enter an password';
                      } else if (password.length < 8) {
                        return 'Password must be at least 8 characters long';
                      } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
                        return 'Password must contain at least one uppercase letter';
                      } else if (!RegExp(r'[a-z]').hasMatch(password)) {
                        return 'Password must contain at least one lowercase letter';
                      } else if (!RegExp(r'[0-9]').hasMatch(password)) {
                        return 'Password must contain at least one number';
                      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                          .hasMatch(password)) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
                    onchanged: (data) {
                      widget.password = data;
                    },
                    hint: 'Password',
                    bol2: false,
                  ),
                  Container(
                                  child: passwordbool == true
                                      ? Text(
                                          tassword,
                                          style: const TextStyle(color: Colors.red),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomContainer(
                    ontap: () async {

                      if (formKey.currentState!.validate()) {

                        setState(() {
                          indecator = true;
                        });
                        try {
                          var auth = FirebaseAuth.instance;
                          UserCredential user =
                              await auth.createUserWithEmailAndPassword(
                                  email: widget.email!,
                                  password: widget.password!);
                          users_email.add(widget.email!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(child: Text('success')),
                            ),
                          );
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            tmail =
                            '  The email is already in use by another account.';
                            emailbool = true;
                            passwordbool = false;
                            setState(() {

                            });
                          } else if (e.code == 'invalid-email') {
                            tmail = 'The email address is not valid.';
                            emailbool = true;
                            passwordbool = false;
                            setState(() {

                            });
                          } else if (e.code == 'weak-password') {
                            tassword = 'The password is too weak.';
                            passwordbool = true;
                            emailbool = false;
                            setState(() {

                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      } else {
                        setState(() {
                        });
                      }
                      indecator = false;
                      setState(() {

                        // bools = true;
                      });
                    },
                    name: 'Register',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have Account!",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bools = true;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '  Login',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
