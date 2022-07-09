import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:ment_track/Pages/auth/login.dart';

import 'home.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);


  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/Mind.png',
        title: 'Measure and improve',
        body: 'your mental health',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/undraw_survey_05s5.png',
        title: 'Personalised insights',
        body: 'and scientific assessments',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/undraw_In_progress_re_m1l6.png',
        title: '100% Confidential',
        body: 'for your personal privacy',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Image.asset('assets/undraw_Meditation_re_gll0.png', width: 300.0, height: 300.0),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
         Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
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
         Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: ((context, animation, secondaryAnimation) => const LoginPage()),
         transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, 
         child: child,)
         ),);
        },
      ),
    );
}
}
