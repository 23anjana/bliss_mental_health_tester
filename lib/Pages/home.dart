import 'package:get/get.dart';
import 'package:ment_track/controllers/surveycontroller.dart';
import 'package:ment_track/pages/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/survey_category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List SurveyImages = ["cat1b","cat2","cat3","cat4","cat6","cat5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ]),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Text(
                    "Choose a Category",
                    style: TextStyle(fontFamily: 'Schyler', color: Color.fromARGB(255, 0, 0, 0), fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                )),
                  Obx(
                    ()
                    {
                      var categories = Get.find<SurveyController>().categories;
                      return Container(
                          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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

