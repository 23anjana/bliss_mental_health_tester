import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ment_track/Pages/home/survey_page.dart';
import 'package:ment_track/controllers/surveycontroller.dart';
import 'package:ment_track/models/survey_category.dart';

class SurveyCategoryCard extends StatelessWidget {
  final image;
  final SurveyCategory category;
  const SurveyCategoryCard(
    this.category,{
    Key? key, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<SurveyController>().loadQuestions(category);
        Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,anim,anim2) => FadeTransition(
          opacity: anim,
          child: SurveyPage(),
          ),
        ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: AssetImage("assets/"+image+".png")
                  ),
                ),
              ),
              Positioned(
                bottom: 7,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(100, 255, 255, 255),
                        Color.fromARGB(100, 255, 255, 255),
                      ]
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontFamily: 'Schyler',
                          fontSize: 20.0,
                        ),
                      ),                      
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

