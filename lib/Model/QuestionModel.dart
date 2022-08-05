import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Image? image;
  Image? jar;
  Image? tru;
  Image? assh;


  Question({
    required this.text,
    required this.options,
    required this.image,
    required this.jar,
    required this.tru,
    required this.assh,
    this.isLocked = false,
    this.selectedOption,
});
}

class Option {
  final String text;
  final bool isCorrect;

  const Option ({
    required this.text,
    required this.isCorrect,

  });
}

final Questions = [
  Question(text: 'What comes after "B"?', options: [
     const Option(text: 'A', isCorrect: false),
     const Option(text: 'C', isCorrect: true),
     const Option(text: 'D', isCorrect: false),
     const Option(text: 'E', isCorrect: false),
  ],
    image: Image.asset('assets/tetris.png'), jar: Image.asset('assets/two.png' ), assh: Image.asset('assets/one.png'), tru: Image.asset(''),
  ),
  Question(text: 'What comes after "C"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'D', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],
    image: Image.asset('assets/Ttwo.png'), jar: Image.asset('assets/three.png' ), assh: Image.asset('assets/two.png'),tru: Image.asset('assets/one.png'),
  ),
  Question(text: 'What comes after "D"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'E', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],
    image: Image.asset('assets/Tthree.png'), jar: Image.asset('assets/four.png' ), assh: Image.asset('assets/three.png'), tru: Image.asset('assets/two.png'),
  ),
  Question(text: 'What comes after "E"?', options: [
    const Option(text: 'A', isCorrect: false),
    const Option(text: 'F', isCorrect: true),
    const Option(text: 'B', isCorrect: false),
    const Option(text: 'C', isCorrect: false),
  ],
    image: Image.asset('assets/Tfour.png'), jar: Image.asset('assets/five.png' ), assh: Image.asset('assets/four.png'), tru: Image.asset('assets/three.png'),
  ),
];



