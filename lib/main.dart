import 'package:flutter/material.dart';
import 'package:quiz_app_task2/Model/QuestionModel.dart';

import 'Questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var image;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Fill the jar by answering the questions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Center(
                    child: SizedBox(
                        width: 50, height: 50,
                        child: Image(image: AssetImage('assets/game.png'))),
                  )
                ],),
              /*const Center(
                child: SizedBox(
                    width: 60, height: 60,
                    child: Image(image: AssetImage('assets/tetris.png'))),
              ),*/
              const Center(
                child: SizedBox(
                    width: 600, height: 600,
                    child: QuestionWidget()),
              ),
              //glass(),
            ],
          )),
    );
  }
}







