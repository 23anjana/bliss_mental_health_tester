import 'package:ment_track/pages/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:ment_track/Pages/auth/login.dart';
import 'package:ment_track/colors.dart';
import '../home.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    "Register",
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
                              labelText: "Email",
                              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
      ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
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
                            borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
      ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 0, 0)),
                                child: Text("SIGN UP",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
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
                                        content: Text("Account created",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                      ));
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text("Account creation failed",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                      ));
                                    }
                                  }
                                },
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
                                    LoginPage(),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: Text("Already have an account?",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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