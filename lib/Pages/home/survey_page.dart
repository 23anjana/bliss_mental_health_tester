import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ment_track/controllers/surveycontroller.dart';

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
              gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ]),
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
                      questions[index]["correct_answer"],
                      ...questions[index]["incorrect_answers"],
                    ];
                    randQuestions.shuffle();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Questions ${index + 1}/${questions.length}",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${Get.find<SurveyController>().points} points",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          questions[index]["question"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                                        primary: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (questions[index]
                                                ["correct_answer"] ==
                                            randQuestions[index2]) {
                                          Get.find<SurveyController>()
                                                  .score
                                                  .value +=
                                              Get.find<SurveyController>().points;
                                          print(Get.find<SurveyController>()
                                              .score
                                              .value);
                                        }
                                        var i = questionsPageController.page!
                                                .round() +
                                            1;
                                        if (i >= questions.length) {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              content: Text(
                                                  "Score ${Get.find<SurveyController>().score.value}"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    randQuestions.shuffle();
                                                    Get.find<SurveyController>()
                                                        .score(0);
                                                    questionsPageController
                                                        .animateToPage(
                                                      0,
                                                      duration: Duration(
                                                        milliseconds: 250,
                                                      ),
                                                      curve: Curves.bounceIn,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Retry"),
                                                ),
                                              ],
                                            ),
                                          );
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
                                      child: Text(randQuestions[index2]),
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