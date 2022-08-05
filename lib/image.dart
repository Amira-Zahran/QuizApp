
import 'package:flutter/material.dart';

import 'Model/QuestionModel.dart';

Image buildImage(Option option){
  return Image(image: option.isCorrect ? const AssetImage('assets/one.png') : const AssetImage('assets/glass.png'));
}

Widget glass(Option option, Question question){
  return Center(child: Container(
    //color: Color.fromRGBO(255, 132, 80, 1),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 132, 80, 1),
        borderRadius: BorderRadius.circular(16),),
      width: 80, height: 60,
      child: question.image));
}

Widget getImageForOption(Option option, Question question) {
  final isSelected = option == question.selectedOption;
  if(question.isLocked){
    if(isSelected){
      return option.isCorrect ? Image.asset('assets/two.png') : Image.asset('assets/one.png');
    } else if (option.isCorrect){
      return Image.asset('assets/two.png');
    }
  }
  return Image.asset('assets/two.png');
}
