import 'dart:ui';

import 'package:flutter/material.dart';

class Question{
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;


  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
});
}

class Option {
  final String text;
  final bool isCorrect;

  const Option ({
    required this.text,
    required this.isCorrect

  });
}

final Questions = [
  Question(text: 'What comes after "B"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'C', isCorrect: true),
    const Option(text: 'D', isCorrect: false),
    const Option(text: 'E', isCorrect: false),
  ], ),
  Question(text: 'What comes after "C"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'D', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],),
  Question(text: 'What comes after "D"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'E', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],),
  Question(text: 'What comes after "E"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'F', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],),
];


