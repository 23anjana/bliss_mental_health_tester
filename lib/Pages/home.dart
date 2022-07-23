import 'package:get/get.dart';
import 'package:ment_track/controllers/surveycontroller.dart';
import 'package:ment_track/pages/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/survey_category_card.dart';
import 'home/survey_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List SurveyImages = ["Progress","Progress","Progress","Progress","Progress"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 95, 49, 174),Color.fromARGB(255, 53, 29, 119),]
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SurveySearchView(),
                  Obx(
                    ()
                    {
                      var categories = Get.find<SurveyController>().categories;
                      return Container(
                          padding:  EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            itemBuilder: (_, index) => SurveyCategoryCard(
                              categories[index],
                              image: SurveyImages[index % (SurveyImages.length)],
                            ),
                          ),
                        );
                    }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}

