import 'dart:convert';

import 'package:ment_track/models/survey_category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SurveyController extends GetxController {
  int points = 10;
  int questionAmount = 10;
  RxInt score = 0.obs;
  RxList categories = [
    SurveyCategory( "Depression",1, "Easy"),
    SurveyCategory("Sleep Disorder", 2, "Hard"),
    SurveyCategory("Obsessive Compulsive Disorder", 3, "Easy"),
    SurveyCategory("Bipolar Disorder", 4, "Medium"),
    SurveyCategory("Personality Disorder", 5, "Easy"),
    SurveyCategory("Anxiety", 6, "Easy"),
  ].obs;

  RxList questions = [].obs;
  RxBool loadingQuestions = true.obs;
  //Remark Logic
  int? catego;
  String get resultPhrase {
    String resultText;
    String categgg = "Dummy";
    if(catego == 1) {
      categgg = "Depression";
    }
    else if(catego == 2)
    {
      categgg = "Sleep Disorder";
    }
      else if(catego == 3)
    {
      categgg = "OCD";
    }
      else if(catego == 4)
    {
      categgg = "Bipolar Disorder";
    }
    else if(catego == 5)
    {
      categgg = "Personality Disorder";
    }
    else {
      categgg = "Anxiety";
    }
    if (score <= 4) {
      resultText = "Minimal $categgg";
      
      print(score);
    } else if (score > 4 && score <= 9) {
      resultText = 'Mild $categgg';
      print(score);
    } else if (score > 9 && score <= 14) {
      resultText = 'Moderate $categgg';
    } else if (score > 14 && score <= 19 ) {
      resultText = 'Moderately severe $categgg';
    } else {
      resultText = 'Severe $categgg';
      print(score);
    }
    return resultText;
  }
    String get resultImage {
    String resultImText;
    if (score <= 4) {
      resultImText = 'assets/1h.png';
      
      print(score);
    } else if (score > 4 && score <= 9) {
      resultImText = 'assets/2h.png';
      print(score);
    } else if (score > 9 && score <= 14) {
      resultImText = 'assets/3h.png';
    } else if (score > 14 && score <= 19 ) {
      resultImText = 'assets/4h.png';
    } else {
      resultImText = 'assets/5h.png';
      print(score);
    }
    return resultImText;
  }

      String get resultrecomm {
    String resultrecText;
    if(catego == 1) {
      resultrecText = "Take a 15 to 30 minutes brisk walk everyday\nEat healthy food\nDon't dwell on problems\nNotice good things\nDevote your energy to positive influences\nTry online connection\nLet the people you trust know how you are feeling\n";
    }
    else if(catego == 2)
    {
      resultrecText = "Mindful meditation\nYoga\nEliminate alcohol and stimulants like nicotine and caffeine\nLight Regulation\nWake up at the same time each day\nConsider participating in cognitive therapy";
    }
      else if(catego == 3)
    {
      resultrecText = "Light therapy\nExercise\nStructure your day\nMeditation\nMusic Therapy\nEat healthy";
    }
      else if(catego == 4)
    {
      resultrecText = "Keep track of your moods and feelings\nEat healthy\nSleep well\nAvoid alcohol and other substances\nStructure your day\nDon't isolate yourself\nFind new ways to relieve stress";
    }
    else if(catego == 5)
    {
      resultrecText = "Be an active participant in your care\nTake your medications as directed\nLearn about your condition\nGet active\nAvoid drugs and alcohol\nGet routine mediacal care";
    }
    else {
      resultrecText = "Practice focused, deep breathing\nUse aromatherapy\nGo for a walk or do 15 minutes of yoga\nWrite down your thoughts\nDo a daily routine meditation\nKeep a journal\nSocialize";
    }
    return resultrecText;
  }
  loadQuestions(SurveyCategory category) async {
    questions.clear();
    score(0);
    String questionsss;
    catego = category.id;
    print(category.id);
    if (category.id == 1)
    {
      questionsss = "questions1";
    } else if (category.id == 2) {
      questionsss = "questions4";
    } else if (category.id == 3) {
      questionsss = "questions3";
    } else if (category.id == 4) {
      questionsss = "questions6";
    } else if (category.id == 5) {
      questionsss = "questions5";
    } else {
      questionsss = "questions2";
    }
    loadingQuestions(true);
    http.Response res = await http.get(
      Uri.parse(
        "https://king-prawn-app-3zl33.ondigitalocean.app/${questionsss}",
      ),
    );
    var json = jsonDecode(res.body);
    print(json);
      json.forEach((e)=> questions.add(e));
    loadingQuestions(false);
  }
  clearQuestions() => questions.clear();
  }