import 'package:flutter/material.dart';
import 'package:ment_track/controllers/surveycontroller.dart';
import 'package:get/get.dart';
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          padding: EdgeInsets.all(0), //You can use EdgeInsets like above
  margin: EdgeInsets.all(15),

          ),
          Align(
                alignment: Alignment.center,
                child: Image.asset(
                      "${Get.find<SurveyController>().resultImage}",
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
            height: 20,
          ),
                    Text(
            "${Get.find<SurveyController>().resultPhrase}",
            style: TextStyle(fontFamily: 'Schyler' ,color: Color.fromARGB(255, 0, 0, 0), fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
                              Text(
            "${Get.find<SurveyController>().resultrecomm}",
            style: TextStyle(fontFamily: 'Schyler', color: Color.fromARGB(255, 0, 0, 0), fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}