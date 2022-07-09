import 'Package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset("assets/app_logo.png"),
            ),
    
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
              filled: true,
              hintText: "Email",
              labelText: "Email",
              border: InputBorder.none,
             ),
             keyboardType: TextInputType.emailAddress,
             ),const SizedBox(height: 16),
                 TextFormField(
                  decoration: const InputDecoration(
                  filled: true,
                  hintText: "Password",
                  labelText: "Password",
                  border: InputBorder.none,
                 ),
                 obscureText: true,
                 ),const SizedBox(height: 16),
                 Row(
                   children: [
                     Expanded(
                       child: GoogleAuthButton(
                        onPressed: () {},
                                     ),
                     ),
                   ],
                 ),
               ],
        ),
      ),
        ],
      ),
        
      );
    return scaffold;
  }
}