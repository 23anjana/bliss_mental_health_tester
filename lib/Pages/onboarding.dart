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
        color: Color.fromARGB(255, 255, 255, 255),
        imageAssetPath: 'assets/screen1.png',
        title: 'Measure and improve',
        titleColor: Color.fromARGB(255, 0, 0, 0),
        bodyColor: Color.fromARGB(255, 0, 0, 0),
        body: 'your mental health',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 255, 255, 255),
        imageAssetPath: 'assets/screen2.png',
        title: 'Personalised insights',
        titleColor: Color.fromARGB(255, 0, 0, 0),
        bodyColor: Color.fromARGB(255, 0, 0, 0),
        body: 'and scientific assessments',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 255, 255, 255),
        imageAssetPath: 'assets/screen3.png',
        title: 'Bite-sized tools',
        body: 'developed by experts',
        titleColor: Color.fromARGB(255, 0, 0, 0),
        bodyColor: Color.fromARGB(255, 0, 0, 0),
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 255, 255, 255),
        imageAssetPath: 'assets/screen4.png',
        title: '100% confidential',
        body: 'for your personal privacy',
        titleColor: Color.fromARGB(255, 0, 0, 0),
        bodyColor: Color.fromARGB(255, 0, 0, 0),
        doAnimateImage: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        activeBulletColor: Color.fromARGB(255, 0, 0, 0),
        inactiveBulletColor: Color.fromARGB(77, 67, 57, 57),
        buttonColor: Color.fromARGB(255, 0, 0, 0),
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