import 'package:flutter/material.dart';

class SurveySearchView extends StatelessWidget {
  const SurveySearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.white38,
           ),
           suffixStyle: TextStyle(
            color: Colors.white,
            ),
          suffixIcon: Icon(
            Icons.search, 
            color: Colors.white30,),
        ),
      ),
    );
  }
}