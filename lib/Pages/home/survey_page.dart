import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ment_track/controllers/surveycontroller.dart';
import 'package:ment_track/pages/recommend.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  PageController questionsPageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
          image: AssetImage("assets/bg.png"),
      ),
            ),
          ),
          SafeArea(
            child: Obx(() {
              if (Get.find<SurveyController>().loadingQuestions.value) {
                return Center(child: CircularProgressIndicator());
              }
              var questions = Get.find<SurveyController>().questions;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: PageView.builder(
                  controller: questionsPageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (_, index) {
                    var randQuestions = [
                      questions[index]["list1"],
                      questions[index]["list2"],
                      questions[index]["list3"],
                      questions[index]["list4"],
                    ];
                    //randQuestions.shuffle();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Questions ${index + 1}/${questions.length}",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontFamily: 'Schyler',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          questions[index]["ques"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Schyler',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Column(
                          children: [
                            ...List.generate(
                              randQuestions.length,
                              (index2) => Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 255, 255, 255),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.find<SurveyController>()
                                            .score
                                            .value += index2;
                                        print(Get.find<SurveyController>()
                                            .score
                                            .value);

                                        var i = questionsPageController.page!
                                                .round() +
                                            1;
                                        if (i >= questions.length) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SecondScreen()));
                                        } else {
                                          questionsPageController.animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.bounceIn,
                                          );
                                          randQuestions.clear();
                                        }
                                      },
                                      child: Text(randQuestions[index2],style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Schyler',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
