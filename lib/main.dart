import 'package:ment_track/di.dart';
import 'package:ment_track/pages/home.dart';
import 'package:ment_track/pages/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
void main() {
  configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Bliss',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snaps) {
          if (!snaps.hasData) return const OnboardingPage();
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const OnboardingPage();
              return const HomePage();
            },
          );
        },
      ),
    );
  }
}

