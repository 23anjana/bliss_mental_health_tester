import 'package:ment_track/colors.dart';
import 'package:ment_track/pages/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned.fill(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 5.0),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontFamily: 'Schyler', color: Color.fromARGB(255, 0, 0, 0), fontSize: 55, fontWeight: FontWeight.w600),
                  ),
                )),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TextFormField(
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Email",
                              //labelText: "Email",
                              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
      ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the email address';
                              }

                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) return null;
                              return 'Please enter a valid email';
                            }),
                        const SizedBox(height: 16),
                        TextFormField(
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Password",
                            labelText: "Password",
                            labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text("Forgot Password?",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 0, 0)),
                                child: Text("LOG IN",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                      if (userCredential.user != null) {
                                        Navigator.of(context).pushReplacement(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                HomePage(),
                                            transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) =>
                                                FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            ),
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Login Successful",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                        ));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text("Login Failed",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Row(
                          children: [
                            Expanded(
                              child: GoogleAuthButton(
                                onPressed: () async {
                                  GoogleSignIn _googleSignIn = GoogleSignIn(
                                    scopes: <String>['email'],
                                  );
                                  try {
                                    GoogleSignInAccount? googleUser =
                                        await _googleSignIn.signIn();
                                    if (googleUser != null) {
                                      GoogleSignInAuthentication googleAuth =
                                          await googleUser.authentication;
                                      AuthCredential credential =
                                          GoogleAuthProvider.credential(
                                        idToken: googleAuth.idToken,
                                        accessToken: googleAuth.accessToken,
                                      );

                                      await FirebaseAuth.instance
                                          .signInWithCredential(credential);
                                      Navigator.of(context).pushReplacement(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              HomePage(),
                                          transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) =>
                                              FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text("Login Successful",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Login Failed",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                      ),
                                    );
                                  }
                                },
                                darkMode: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignupPage(),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: Text("Don't have an account? Sign up",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ); 
       }
}