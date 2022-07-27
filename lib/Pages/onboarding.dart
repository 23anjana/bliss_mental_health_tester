import 'package:ment_track/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pages = [
    PageModel(
        color: Color.fromARGB(255, 242, 197, 103),
        imageAssetPath: 'assets/screen1c.png',
        title: 'Measure and improve',
        titleColor: Color.fromARGB(255, 255, 255, 255),
        bodyColor: Color.fromARGB(255, 255, 255, 255),
        body: 'your mental health',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 243, 165, 165),
        imageAssetPath: 'assets/screen2c.png',
        title: 'Personalised insights',
        titleColor: Color.fromARGB(255, 255, 255, 255),
        bodyColor: Color.fromARGB(255, 255, 255, 255),
        body: 'and scientific assessments',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 84, 120, 240),
        imageAssetPath: 'assets/screen3c.png',
        title: 'Bite-sized tools',
        body: 'developed by experts',
        titleColor: Color.fromARGB(255, 255, 255, 255),
        bodyColor: Color.fromARGB(255, 255, 255, 255),
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 30, 47, 55),
        imageAssetPath: 'assets/screen4c.png',
        title: '100% confidential',
        body: 'for your personal privacy',
        titleColor: Color.fromARGB(255, 255, 255, 255),
        bodyColor: Color.fromARGB(255, 255, 255, 255),
        doAnimateImage: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        activeBulletColor: Color.fromARGB(255, 255, 255, 255),
        inactiveBulletColor: Color.fromARGB(77, 226, 226, 226),
        buttonColor: Color.fromARGB(255, 255, 255, 255),
        skipCallback: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  LoginPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  LoginPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}